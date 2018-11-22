# This python code takes a list of hotel bookings from the booking.csv file from Udacity's Time Series Forecasting course 
# and decomposes it into the Error,Trend and Seasonal components. Code is based on Jason Brownlee's 
# Python example.
# links: https://www.udacity.com/course/time-series-forecasting--ud980
# https://machinelearningmastery.com/decompose-time-series-data-trend-seasonality/
# this code uses the newer read_csv function and uses the modified bookings2.csv which only has 2 columns
# Year and Month columns combined into 1 columns so it can plot correctly.
# Year and Month has been formatted into YYYY-MM in numerals to follow Jason's airlines example. 
# This seems to fix seasonal decomposition error.

from pandas import read_csv
from matplotlib import pyplot
series = read_csv('bookings3.csv', header=0,parse_dates=[0],index_col=0,squeeze=True)
pyplot.plot(series)
pyplot.show()