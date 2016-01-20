install.packages("data.table")
library(data.table)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, "q5.csv")
DT <- read.table("q5.csv",header=TRUE,sep=",",quote="",
    stringsAsFactors=FALSE,comment.char=""
    )





