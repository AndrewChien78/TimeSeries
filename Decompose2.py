# This is the code from Jason Brownlee of Machine Learning Mastery. This code provides an example 
# of time series decomposition - multiplicative
# https://machinelearningmastery.com/decompose-time-series-data-trend-seasonality/
from pandas import Series
from matplotlib import pyplot
from statsmodels.tsa.seasonal import seasonal_decompose
series = [i**2.0 for i in range(1,100)]
result = seasonal_decompose(series, model='multiplicative', freq=1)
result.plot()
pyplot.show()