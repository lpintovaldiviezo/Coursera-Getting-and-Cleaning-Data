fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, "q3.xlsx")
install.packages('xlsx',repos='http://cran.r-project.org')
library("xlsx")
rowindex <- 18:23
colindex <- 7:15
dat <- read.xlsx("q3.xlsx", sheetIndex=1, colIndex = colindex, rowIndex = rowindex)
sum(dat$Zip*dat$Ext,na.rm=T)

##36534720