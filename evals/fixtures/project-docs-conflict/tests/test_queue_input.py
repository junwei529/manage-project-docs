import unittest

from src.queue_input import normalize_label


class NormalizeLabelTests(unittest.TestCase):
    def test_normalizes_spacing_and_case(self) -> None:
        self.assertEqual(normalize_label("  Urgent   Work "), "urgent work")


if __name__ == "__main__":
    unittest.main()
