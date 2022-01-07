import unittest

from src.utils.operator import add


class TestAdd(unittest.TestCase):
    def test_evalate(self) -> None:
        self.assertEqual("2", f"{add(1, 1)}")
