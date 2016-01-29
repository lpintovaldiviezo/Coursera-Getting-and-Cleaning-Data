fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, "ACSdata.csv")
ACSdata <- read.csv("ACSdata.csv")
splitname = strsplit(names(ACSdata),"wgtp")