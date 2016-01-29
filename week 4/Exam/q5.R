library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sampleDates <- (as.Date(sampleTimes,"%A %b %Y"))
years <- format(sampleDates, "%Y")
years.2012 <- years[years == "2012"]
length(years.2012)
year.day <- format(sampleDates,  "%A %Y")
year.day.2012 <- year.day[year.day == "lunes 2012"]
length(year.day.2012)