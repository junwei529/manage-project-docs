def normalize_label(raw: str) -> str:
    return " ".join(raw.strip().split()).lower()


def parse_priority(raw: str) -> int:
    raise NotImplementedError("priority parsing is not implemented")
