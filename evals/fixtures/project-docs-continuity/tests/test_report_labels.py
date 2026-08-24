import unittest

from src.report_labels import normalize_slug


class ReportLabelTests(unittest.TestCase):
    def test_normalizes_slug(self) -> None:
        self.assertEqual(normalize_slug("Agent Report 2"), "agent-report-2")


if __name__ == "__main__":
    unittest.main()
