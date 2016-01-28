install.packages("sqldf")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, "q1.csv")
acs <- read.csv("q1.csv")
options(sqldf.driver = "SQLite") # as per FAQ #7 force SQLite
options(gsubfn.engine = "R")
library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select distinct AGEP from acs")

