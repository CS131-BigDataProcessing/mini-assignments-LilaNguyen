#validate_functions.py
import pandas as pd

def validate_vict_sex(df):
    ''' Function to check that 'Vict sex' column is either M or F and not missing (NULL) '''
    valid_sex = (df['Vict sex'].isin(['M', 'F'])) & df['Vict sex'].notnull()
    return valid_sex

def validate_vict_age(df):
    ''' Function to check that 'Vict age' column values are between 1-100 and not missing (NULL) '''
    valid_age = (df['Vict age'] >= 1) & (df['Vict age'] <= 100) & df['Vict age'].notnull()
    return valid_age
