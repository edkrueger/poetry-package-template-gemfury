"""
Tests resc.py.
"""
from poetrypackagetemplate.demo import add, sub


def test_add():
    """Tests add."""
    assert add(1, 1) == 2


def test_sub():
    """Tests sub."""
    assert sub(1, 1) == 0
