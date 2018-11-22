# This is the code from Jason Brownlee of Machine Learning Mastery. This code provides an example 
# of time series decomposition - Additive
# https://machinelearningmastery.com/decompose-time-series-data-trend-seasonality/
from random import randrange
from pandas import Series
from matplotlib import pyplot
from statsmodels.tsa.seasonal import seasonal_decompose
series = [i+randrange(10) for i in range(1,100)]
result = seasonal_decompose(series, model='additive', freq=1)
result.plot()
pyplot.show()