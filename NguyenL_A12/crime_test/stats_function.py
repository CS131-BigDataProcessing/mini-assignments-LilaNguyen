#stats_function.py
import pandas as pd

def mean_age(df):
    ''' Function to iterate age column and calculates mean age '''
    return df['Vict age'].mean()


def median_age(df):
    ''' Function to iterate age column and calculates median age '''
    return df['Vict age'].median()


