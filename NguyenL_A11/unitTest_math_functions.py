import unittest
from math_functions import power, divide
class TestMathFunc(unittest.TestCase):
    def test_power(self):
        self.assertEqual(power(2,3), 8)
        self.assertEqual(power(5,0), 1)
        self.assertEqual(power(0,3), 0)
        self.assertEqual(power(0,0), 1)
        self.assertEqual(power(4,-3), 1/64)
        self.assertEqual(power(10,100), 10**100)
        self.assertEqual(power(2,0.5), 1.4142135623730951)
        self.assertEqual(power(8,1/3), 2)
    
    def test_divide(self):
        self.assertEqual(divide(10,0), "Undefined (division by 0)")
        self.assertEqual(divide(12,2), 6)
        self.assertEqual(divide(0,3), 0)
        self.assertEqual(divide(15,-3), -5) 
        self.assertEqual(divide(-10,2), -5)
        self.assertEqual(divide(-15,-3), 5)

if __name__ == "__main__":
    unittest.main() 
