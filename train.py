import os
import pandas as pd
df = pd.read_csv('C:/Users/Aran/Documents/Projects for data analyst/Superstore sales/train.csv')
df['Order Date'] = pd.to_datetime(df['Order Date'], format= '%d/%m/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'], format= '%d/%m/%Y')

#drop missing values
df.dropna(subset=['Postal Code'], inplace=True)
print(df.head())
print(df.info())
print(df.isnull().sum())