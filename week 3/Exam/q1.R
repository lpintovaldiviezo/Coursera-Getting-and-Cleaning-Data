fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, "q1.csv")
dat <- read.csv("q1.csv")
which(dat$ACR == 3 & dat$AGS==6) ##Get logical vector