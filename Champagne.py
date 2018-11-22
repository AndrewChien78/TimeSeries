# This python code takes the champagne-sales.csv file from Udacity's Time Series Forecasting course 
# and decomposes it into the Error,Trend and Seasonal components. Code is based on Jason Brownlee's 
# Python example.
# links: https://www.udacity.com/course/time-series-forecasting--ud980
# https://machinelearningmastery.com/decompose-time-series-data-trend-seasonality/
#
from pandas import Series
from matplotlib import pyplot
series = Series.from_csv('champagne-sales.csv', header=0)
series.plot()
pyplot.show()