def inclusive_sum(start: int, end: int) -> int:
    if end < start:
        return 0
    return sum(range(start, end + 1))
