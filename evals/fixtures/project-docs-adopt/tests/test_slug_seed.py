import unittest

from src.slug_seed import make_slug


class SlugSeedTests(unittest.TestCase):
    def test_normalizes_ascii_label(self) -> None:
        self.assertEqual(make_slug("  Hello, Agent!  "), "hello-agent")


if __name__ == "__main__":
    unittest.main()
