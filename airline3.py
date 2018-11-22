# This is the airline passengers example from Jason Brownlee of Machine Learning Mastery. This code provides 
# an example of time series decomposition
# https://machinelearningmastery.com/decompose-time-series-data-trend-seasonality/
# this file uses the read_csv function instead of Series function
from pandas import read_csv
from matplotlib import pyplot
from statsmodels.tsa.seasonal import seasonal_decompose
series = read_csv('international-airline-passengers.csv', header=0,parse_dates=[0],index_col=0,squeeze=True)
result = seasonal_decompose(series, model='multiplicative')
result.plot()
pyplot.show()