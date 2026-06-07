import pandas as pd
from prophet import Prophet
from sklearn.metrics import mean_absolute_error
from statsforecast.models import AutoARIMA
from statsforecast import StatsForecast


df = pd.read_csv('train_utf8.csv', encoding='utf-8')

print(df.head())
print(df.info())
print(df.describe())
#print(df.isnull().sum())
df.duplicated().sum()
df['Order Date'] = pd.to_datetime(df['Order Date'])
df['Ship Date'] = pd.to_datetime(df['Ship Date'])

monthly_sales = df.groupby(
    pd.Grouper(key='Order Date', freq='M')
)['Sales'].sum()

category_sales = df.groupby('Category')['Sales'].sum()

region_sales = df.groupby('Region')['Sales'].sum()

product_sales = df.groupby('Product Name')['Sales'].sum()

print(monthly_sales)

#time series

sales_ts = df.groupby('Order Date')['Sales'].sum().reset_index()
print(sales_ts)

sales_ts.set_index('Order Date', inplace=True)

# visualise time series

import matplotlib.pyplot as plt

plt.figure(figsize=(12,6))
plt.plot(sales_ts)
plt.title('Daily Sales Over Time')
plt.xlabel('Date')
plt.ylabel('Sales')
plt.show()

forecast_df = monthly_sales.reset_index()
forecast_df.columns = ['ds', 'y']


model = Prophet()
train = forecast_df[:-3]
test = forecast_df[-3:]
print("X")
model.fit(train)


future = model.make_future_dataframe(periods=6,freq='M')
forecast = model.predict(future)

next_3_months_predictions_prophet = forecast[['ds', 'yhat']].tail(6)
print(next_3_months_predictions_prophet)

model.plot(forecast)
plt.show()
actual = test['y'].values
prediction = next_3_months_predictions_prophet['yhat'][:3].values
print(next_3_months_predictions_prophet['yhat'].values)

mae = mean_absolute_error(actual, prediction)

print("Prophet MAE:", mae)

next_3_months_predictions_prophet.tail(3).to_csv('predictions.csv', index=False)
print(monthly_sales) 

#AutoARIMA Forecasting
arima_df = forecast_df.copy()
arima_df['unique_id'] = 'sales'

train = arima_df[:-3]
test = arima_df[-3:]

models = [
    AutoARIMA(seasonal=False, alias="ARIMA"),
    AutoARIMA(seasonal = True,season_length=12,alias="SARIMA")
]
sf = StatsForecast(models=models, freq="M")
sf.fit(df=train)
arima_preds = sf.predict(h=3)

arima_prediction = arima_preds['ARIMA'].values

actual = test['y'].values

arima_mae = mean_absolute_error(
    actual,
    arima_prediction
)

print("ARIMA MAE:", arima_mae)

sarima_prediction = arima_preds['SARIMA'].values

sarima_mae = mean_absolute_error(
    actual,
    sarima_prediction
)

print("SARIMA MAE:", sarima_mae)

print(sarima_prediction)

plt.figure(figsize=(14,6))

# Historical training data
plt.plot(
    train['ds'],
    train['y'],
    label='Training Data'
)

# Actual future values
plt.plot(
    test['ds'],
    actual,
    marker='o',
    linewidth=3,
    label='Actual Sales'
)

# ARIMA forecast
plt.plot(
    test['ds'],
    arima_prediction,
    marker='o',
    linestyle='--',
    label='ARIMA Forecast'
)

# SARIMA forecast
plt.plot(
    test['ds'],
    sarima_prediction,
    marker='o',
    linestyle='--',
    label='SARIMA Forecast'
)

# Prophet forecast
plt.plot(
    test['ds'],
    prediction,
    marker='o',
    linestyle='--',
    label='Prophet Forecast'
    
)

plt.title('Retail Sales Forecast Comparison')

plt.xlabel('Date')

plt.ylabel('Monthly Revenue')

plt.legend()

plt.grid(True)

plt.show()

mae_results = pd.DataFrame({
    'Model': [
        'Prophet',
        'ARIMA',
        'SARIMA'
], 
    'MAE': [mae,arima_mae,sarima_mae]
    })

print(mae_results)
mae_results.to_csv("mae_results.csv",index=False)


actual_vs_predicted = pd.DataFrame({
    'Date': test['ds'],
    'Actual': actual,
    'ARIMA': arima_prediction,
    'SARIMA': sarima_prediction,
    'Prophet': prediction 
    
})

actual_vs_predicted.to_csv('forecast results.csv', index = False)


forecast_df =  pd.DataFrame(index=monthly_sales.index)
forecast_df['Actual'] = monthly_sales
forecast_df['Prophet'] = None
forecast_df['ARIMA'] = None
forecast_df['SARIMA'] = None

forecast_df.loc[monthly_sales[-3:].index, 'Prophet'] = prediction
forecast_df.loc[monthly_sales[-3:].index, 'ARIMA'] = arima_prediction
forecast_df.loc[monthly_sales[-3:].index, 'SARIMA'] = sarima_prediction

forecast_df.to_csv('forecast_results_full.csv')