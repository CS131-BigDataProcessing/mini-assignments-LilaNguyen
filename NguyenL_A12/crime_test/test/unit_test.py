#unit_test.py
import unittest
import pandas as pd
from validate_functions import validate_vict_sex, validate_vict_age
from stats_function import mean_age, median_age

class TestValidateFunctions(unittest.TestCase):
    def test_validate_vict_sex(self):
        # Proper columns
        valid_df = pd.DataFrame({
            'Vict sex': ['M', 'F', 'F'],
            'Vict age': [20, 31, 42]
        })

        # Invalid 'Vict sex' column
        invalid_df = pd.DataFrame({
            'Vict sex': ['M', 'F', 'X'],
            'Vict age': [20, 30, 40]
        })

        # Invalid data type
        invalid_type_df = pd.DataFrame({
            'Vict sex': [1, 2, 'F'],
            'Vict age': [20, 30, 40]
        })

        # Empty case
        empty_df = pd.DataFrame()

        # Test cases
        self.assertTrue(validate_vict_sex(valid_df))
        self.assertFalse(validate_vict_sex(invalid_df))
        self.assertFalse(validate_vict_sex(invalid_type_df))
        self.assertTrue(validate_vict_sex(empty_df))


    def test_validate_vict_age(self):
        # Proper columns
        valid_df = pd.DataFrame({
            'Vict sex': ['M', 'F', 'F'],
            'Vict age': [20, 31, 42]
        })

        # Invalid 'Vict age' column
        invalid_df = pd.DataFrame({
            'Vict sex': ['M', 'F', 'F'],
            'Vict age': [0, 100, None]
        })

        # Invalid 'Vict age' column
        invalid2_df = pd.DataFrame({
            'Vict sex': ['M', 'F', 'F'],
            'Vict age': [-5, 100, 150]
        })

        # Invalid data type
        invalid_type_df = pd.DataFrame({
            'Vict sex': ['M', 'F', 'F'],
            'Vict age': [20, 'thirty-one', 40]
        })

        # Missing 'Vict age' column
        missing_df = pd.DataFrame({
            'Vict sex': ['M', 'F', 'F'],
        })

        # Test cases
        self.assertTrue(validate_vict_age(valid_df))
        self.assertFalse(validate_vict_age(invalid_df))
        self.assertFalse(validate_vict_age(invalid2_df))
        self.assertFalse(validate_vict_age(invalid_type_df))
        self.assertTrue(validate_vict_sex(empty_df))

class TestStatsFunction(unittest.TestCase):
    def test_mean_age(self):
        # Proper columns
        valid_df = pd.DataFrame({'Vict age': [20, 30, 40]})

        # One value
        one_df = pd.DataFrame({'Vict age': [40]})

        # Negative age
        neg_df = pd.DataFrame({'Vict age': [-10, -20, -30]})
    
        # Test cases
        self.assertEqual(mean_age(valid_df), 30)
        self.assertEqual(mean_age(one_df), 40)
        self.assertEqual(mean_age(neg_df), -20)
    
    def test_median_age(self):
        # Proper columns
        valid_df = pd.DataFrame({'Vict age': [20, 30, 40]})

        # All same values
        same_df = pd.DataFrame({'Vict age': [40, 40, 40]})

        # One value
        one_df = pd.DataFrame({'Vict age': [40]})

        # Test cases
        self.assertEqual(median_age(valid_df), 30)
        self.assertEqual(median_age(same_df), 40)
        self.assertEqual(median_age(one_df), 40)


if __name__ == '__main__':
    unittest.main()
