# This python code takes the booking.csv file from Udacity's Time Series Forecasting course 
# and decomposes it into the Error,Trend and Seasonal components. Code is based on Jason Brownlee's 
# Python example.
# links: https://www.udacity.com/course/time-series-forecasting--ud980
# https://machinelearningmastery.com/decompose-time-series-data-trend-seasonality/
# this code uses the newer read_csv function and uses the modified bookings2.csv which only has 2 columns
# Year and Month columns combined into 1 columns so it can plot correctly.
from pandas import read_csv
from matplotlib import pyplot
from statsmodels.tsa.seasonal import seasonal_decompose
series = read_csv('bookings3.csv', header=0,parse_dates=[0],index_col=0,squeeze=True)
result = seasonal_decompose(series, model='additive')
result.plot()
pyplot.show()