import os
import pandas as pd
import chardet

with open('C:/Users/Aran/Documents/Projects for data analyst/Superstore sales/train.csv', 'rb') as f:
    print(chardet.detect(f.read(100000)))
df = pd.read_csv('C:/Users/Aran/Documents/Projects for data analyst/Superstore sales/train.csv',encoding='cp1252')
df['Order Date'] = pd.to_datetime(df['Order Date'], format= '%d/%m/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'], format= '%d/%m/%Y')

#drop missing values
df.dropna(subset=['Postal Code'], inplace=True)
print(df.head())
print(df.info())
print(df.isnull().sum())

df.to_csv('train_utf8.csv', index=False, encoding='utf-8')