# This is a file for R.
#
# put the data into a time series
library(gdata)                   # load gdata package 

setwd("/Users/andre/Desktop/TimeSeries")
booking <- read.csv("bookings3.csv")  # read from file
lines(booking, type="l", col="red")
booking.ts <- ts(booking, frequency=12, start=c(2006,1), end=c(2015,12))

