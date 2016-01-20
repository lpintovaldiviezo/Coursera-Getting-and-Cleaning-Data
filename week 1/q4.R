install.packages("XML")
library(XML)
library(RCurl)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xData <- getURL(fileURL)
doc <- xmlParse(xData)
rootNode <- xmlRoot(doc)
data.zipcode = xpathSApply(rootNode, "//zipcode", xmlValue)
length(data.zipcode[(data.zipcode == "21231")])

##127