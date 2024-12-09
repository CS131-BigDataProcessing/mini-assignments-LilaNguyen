#stats_function.py
import pandas as pd

def mean_age(df):
    ''' Function to iterate age column and calculates mean age '''
    if 'Vict age' not in df.columns:
        raise ValueError("Column 'Vict age' is missing from DataFrame.")

    mean = df['Vict age'].mean()

    if pd.isna(mean):
        return 0

    return mean


def median_age(df):
    ''' Function to iterate age column and calculates median age '''
    if 'Vict age' not in df.columns:
        raise ValueError("Column 'Vict age' is missing from DataFrame.")

    median = df['Vict age'].median()

    if pd.isna(median):
        return 0

    return median


