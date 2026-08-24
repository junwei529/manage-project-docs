[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Destination
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$runRoot = Join-Path $repoRoot '.eval-runs'
$runRootFull = [System.IO.Path]::GetFullPath($runRoot)
$destinationFull = [System.IO.Path]::GetFullPath($Destination)
$isWindowsPlatform = [System.Environment]::OSVersion.Platform -eq [System.PlatformID]::Win32NT
$pathComparison = if ($isWindowsPlatform) {
    [System.StringComparison]::OrdinalIgnoreCase
}
else {
    [System.StringComparison]::Ordinal
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

if (
    -not $destinationFull.StartsWith(
        $runRootFull + [System.IO.Path]::DirectorySeparatorChar,
        $pathComparison
    )
) {
    throw 'Destination must be a child of the repository .eval-runs directory.'
}

Assert-NoReparsePoint -Path $destinationFull

if (-not (Test-Path -LiteralPath $destinationFull -PathType Container)) {
    throw "Destination does not exist: $destinationFull"
}

$baselinePath = Join-Path $destinationFull '.git\project-docs-eval-baseline.json'
if (-not (Test-Path -LiteralPath $baselinePath -PathType Leaf)) {
    throw "Project Docs eval baseline is missing: $baselinePath"
}

$baseline = Get-Content -Raw -Encoding UTF8 -LiteralPath $baselinePath |
    ConvertFrom-Json
$currentManifest = @(Get-WorkspaceManifest -Root $destinationFull)
$baselineByPath = @{}
$currentByPath = @{}

foreach ($item in @($baseline.Manifest)) {
    $baselineByPath[$item.Path] = $item
}
foreach ($item in $currentManifest) {
    $currentByPath[$item.Path] = $item
}

$added = @(
    $currentManifest |
    Where-Object { -not $baselineByPath.ContainsKey($_.Path) }
)
$removed = @(
    @($baseline.Manifest) |
    Where-Object { -not $currentByPath.ContainsKey($_.Path) }
)
$modified = @(
    $currentManifest |
    Where-Object {
        $before = $baselineByPath[$_.Path]
        $null -ne $before -and (
            $before.Length -ne $_.Length -or
            $before.Sha256 -ne $_.Sha256
        )
    } |
    ForEach-Object {
        $before = $baselineByPath[$_.Path]
        [pscustomobject]@{
            Path = $_.Path
            BeforeLength = $before.Length
            AfterLength = $_.Length
            BeforeSha256 = $before.Sha256
            AfterSha256 = $_.Sha256
        }
    }
)

$gitStatus = @(
    & git -C $destinationFull status --porcelain=v1 --untracked-files=all --ignored
)
if ($LASTEXITCODE -ne 0) {
    throw 'Unable to inspect Project Docs eval Git status.'
}

$headCommit = (& git -C $destinationFull rev-parse HEAD | Out-String).Trim()
if ($LASTEXITCODE -ne 0) {
    throw 'Unable to inspect Project Docs eval HEAD.'
}

[ordered]@{
    SchemaVersion = 1
    Case = $baseline.Case
    Destination = $destinationFull
    BaselineCommit = $baseline.BaselineCommit
    HeadCommit = $headCommit
    InitialGitStatus = @($baseline.InitialGitStatus)
    CurrentGitStatus = $gitStatus
    BaselineFileCount = @($baseline.Manifest).Count
    CurrentFileCount = $currentManifest.Count
    ManifestDelta = [ordered]@{
        Added = $added
        Modified = $modified
        Removed = $removed
    }
} | ConvertTo-Json -Depth 8
