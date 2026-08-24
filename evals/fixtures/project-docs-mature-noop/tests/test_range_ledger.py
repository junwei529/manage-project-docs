import unittest

from src.range_ledger import inclusive_sum


class InclusiveSumTests(unittest.TestCase):
    def test_sums_inclusive_range(self) -> None:
        self.assertEqual(inclusive_sum(2, 4), 9)


if __name__ == "__main__":
    unittest.main()
