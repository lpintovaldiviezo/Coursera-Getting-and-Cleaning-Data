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
mergedData = merge(GDPdata, GDPedu, by.x = "CountryCode", by.y = "CountryCode")
grep("Fiscal year end: June", mergedData$Special.Notes)