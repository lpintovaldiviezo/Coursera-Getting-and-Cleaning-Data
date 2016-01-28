library(dplyr)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, "GDPdata.csv")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL, "EDUdata.csv")
GDPraw <- read.csv("GDPdata.csv")
GDPdata <- GDPraw[5:194, c(1,2,4,5)]
names(GDPdata) <- c("CountryCode", "Ranked", "Economy", "Money")
rownames(GDPdata) <- c(1:nrow(GDPdata))
GDPdata$Ranked <- as.numeric(as.character(GDPdata$Ranked))
GDPedu <- read.csv("EDUdata.csv")
##q3
mergedData = merge(GDPdata, GDPedu, by.x = "CountryCode", by.y = "CountryCode")
mergedData <- arrange(mergedData, desc(Ranked))
##q4
mergedDataIncome <- filter(mergedData, Income.Group %in% c("High income: OECD"))
mean(mergedDataIncome$Ranked)
mergedDataIncome <- filter(mergedData, Income.Group %in% c("High income: nonOECD"))
mean(mergedDataIncome$Ranked)
##q5
quantile <- quantileCut(mergedData$Ranked, n = 5)
mergedData$Quantile = cut(mergedData$Ranked, breaks = quantile)
quantile.data = xtabs(~ Income.Group + Quantile , mergedData)
