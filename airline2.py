# This is the airline passengers example from Jason Brownlee of Machine Learning Mastery. This code provides 
# an example of time series decomposition
# https://machinelearningmastery.com/decompose-time-series-data-trend-seasonality/
from pandas import Series
from matplotlib import pyplot
from statsmodels.tsa.seasonal import seasonal_decompose
series = Series.from_csv('international-airline-passengers.csv', header=0)
result = seasonal_decompose(series, model='multiplicative')
result.plot()
pyplot.show()