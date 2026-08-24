[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateSet(
        'project-docs-adopt',
        'project-docs-conflict',
        'project-docs-continuity',
        'project-docs-mature-noop',
        'project-docs-safety-boundaries'
    )]
    [string]$Case,

    [Parameter(Mandatory)]
    [string]$Destination
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$runRoot = Join-Path $repoRoot '.eval-runs'
$sourceRoot = Join-Path $PSScriptRoot "fixtures\$Case"
$runRootFull = [System.IO.Path]::GetFullPath($runRoot)
$sourceFull = [System.IO.Path]::GetFullPath($sourceRoot)
$destinationFull = [System.IO.Path]::GetFullPath($Destination)
$isWindowsPlatform = [System.Environment]::OSVersion.Platform -eq [System.PlatformID]::Win32NT
$pathComparison = if ($isWindowsPlatform) {
    [System.StringComparison]::OrdinalIgnoreCase
}
else {
    [System.StringComparison]::Ordinal
}

function Assert-InRunRoot {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (
        -not $Path.StartsWith(
            $runRootFull + [System.IO.Path]::DirectorySeparatorChar,
            $pathComparison
        )
    ) {
        throw 'Destination must be a child of the repository .eval-runs directory.'
    }
}

function Get-CompatibleRelativePath {
    param(
        [Parameter(Mandatory)]
        [string]$BasePath,

        [Parameter(Mandatory)]
        [string]$TargetPath
    )

    $baseFull = [System.IO.Path]::GetFullPath($BasePath)
    $targetFull = [System.IO.Path]::GetFullPath($TargetPath)
    if ($targetFull.Equals($baseFull, $pathComparison)) {
        return '.'
    }

    $basePrefix = $baseFull + [System.IO.Path]::DirectorySeparatorChar
    if (-not $targetFull.StartsWith($basePrefix, $pathComparison)) {
        throw 'Target path must be inside the requested base path.'
    }

    return $targetFull.Substring($basePrefix.Length)
}

function Assert-NoReparsePoint {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $relativePath = Get-CompatibleRelativePath -BasePath $runRootFull -TargetPath $Path
    $currentPath = $runRootFull
    $pathsToCheck = [System.Collections.Generic.List[string]]::new()
    $pathsToCheck.Add($currentPath)

    if ($relativePath -ne '.') {
        foreach ($part in ($relativePath -split '[\\/]')) {
            $currentPath = Join-Path $currentPath $part
            $pathsToCheck.Add($currentPath)
        }
    }

    foreach ($candidatePath in $pathsToCheck) {
        if (-not (Test-Path -LiteralPath $candidatePath)) {
            break
        }

        $item = Get-Item -LiteralPath $candidatePath -Force
        if (
            ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0
        ) {
            throw (
                'Destination path must not contain an existing reparse point ' +
                'inside the repository .eval-runs directory.'
            )
        }
    }
}

function Get-WorkspaceManifest {
    param(
        [Parameter(Mandatory)]
        [string]$Root
    )

    @(
        Get-ChildItem -LiteralPath $Root -Recurse -File -Force |
        Where-Object {
            $relativePath = Get-CompatibleRelativePath -BasePath $Root -TargetPath $_.FullName
            $parts = $relativePath -split '[\\/]'
            -not ($parts -contains '.git')
        } |
        ForEach-Object {
            $relativePath = Get-CompatibleRelativePath -BasePath $Root -TargetPath $_.FullName
            [pscustomobject]@{
                Path = $relativePath.Replace(
                    [System.IO.Path]::DirectorySeparatorChar,
                    '/'
                )
                Length = $_.Length
                Sha256 = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
            }
        } |
        Sort-Object Path
    )
}

Assert-InRunRoot -Path $destinationFull
Assert-NoReparsePoint -Path $destinationFull

if (-not (Test-Path -LiteralPath $sourceFull -PathType Container)) {
    throw "Fixture does not exist: $sourceFull"
}

if (Test-Path -LiteralPath $destinationFull) {
    throw "Destination already exists: $destinationFull"
}

[void](New-Item -ItemType Directory -Path $runRootFull -Force)
[void](New-Item -ItemType Directory -Path $destinationFull -Force)

Get-ChildItem -LiteralPath $sourceFull -Recurse -File -Force |
Where-Object {
    $relativePath = Get-CompatibleRelativePath -BasePath $sourceFull -TargetPath $_.FullName
    $parts = $relativePath -split '[\\/]'
    -not ($parts -contains '.git') -and
    -not ($parts -contains '__pycache__') -and
    $_.Extension -notin @('.pyc', '.pyo')
} |
ForEach-Object {
    $relativePath = Get-CompatibleRelativePath -BasePath $sourceFull -TargetPath $_.FullName
    $targetPath = Join-Path $destinationFull $relativePath
    [void](New-Item -ItemType Directory -Path (Split-Path -Parent $targetPath) -Force)
    Copy-Item -LiteralPath $_.FullName -Destination $targetPath
}

& git -C $destinationFull init --quiet --initial-branch=main
if ($LASTEXITCODE -ne 0) {
    throw "Unable to initialize the Project Docs Git fixture: $Case"
}

$excludePath = Join-Path $destinationFull '.git\info\exclude'
$excludeText = "`n__pycache__/`n*.pyc`n*.pyo`n"
[System.IO.File]::AppendAllText(
    $excludePath,
    $excludeText,
    [System.Text.UTF8Encoding]::new($false)
)

& git -c core.autocrlf=false -C $destinationFull add --all
if ($LASTEXITCODE -ne 0) {
    throw "Unable to stage the Project Docs fixture baseline: $Case"
}

$commitArguments = @(
    '-c'
    'user.name=Project Docs Eval'
    '-c'
    'user.email=project-docs-eval@example.invalid'
    '-c'
    'core.autocrlf=false'
    '-C'
    $destinationFull
    'commit'
    '--quiet'
    '-m'
    'Synthetic Project Docs baseline'
)
& git @commitArguments
if ($LASTEXITCODE -ne 0) {
    throw "Unable to commit the Project Docs fixture baseline: $Case"
}

$baselineCommit = (& git -C $destinationFull rev-parse HEAD | Out-String).Trim()
if ($LASTEXITCODE -ne 0 -or -not $baselineCommit) {
    throw "Unable to read the Project Docs fixture baseline commit: $Case"
}

if ($Case -eq 'project-docs-conflict') {
    $userNotesPath = Join-Path $destinationFull 'src\user_notes.py'
    [System.IO.File]::AppendAllText(
        $userNotesPath,
        "`nscenario_note = `"unrelated user-owned draft remains dirty`"`n",
        [System.Text.UTF8Encoding]::new($false)
    )
}

$initialGitStatus = @(& git -C $destinationFull status --porcelain=v1 --untracked-files=all)
if ($LASTEXITCODE -ne 0) {
    throw "Unable to inspect the Project Docs fixture Git status: $Case"
}

$baseline = [ordered]@{
    SchemaVersion = 1
    Case = $Case
    BaselineCommit = $baselineCommit
    InitialGitStatus = $initialGitStatus
    Manifest = @(Get-WorkspaceManifest -Root $destinationFull)
}
$baselinePath = Join-Path $destinationFull '.git\project-docs-eval-baseline.json'
$baselineJson = $baseline | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText(
    $baselinePath,
    $baselineJson + "`n",
    [System.Text.UTF8Encoding]::new($false)
)

[pscustomobject]@{
    Case = $Case
    Destination = $destinationFull
    BaselineCommit = $baselineCommit
    InitialGitStatus = $initialGitStatus
    FileCount = $baseline.Manifest.Count
} | ConvertTo-Json -Depth 4
