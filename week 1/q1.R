fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, "q1.csv")
dat <- read.csv("q1.csv")
x.sub <- subset(dat, VAL == 24)
nrow(x.sub)

##53
