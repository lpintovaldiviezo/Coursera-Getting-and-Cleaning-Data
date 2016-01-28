####### Subsetting qnd Sorting
	##Logicals and or // get rows 
	X[(X$var1 <= 3 & X$var1 <= 11),]
	X[(X$var1 <= 3  X$var1 <= 11),] 

	##sort
	sort(x$var1, decreasing = TRUE; na.last = TRUE)

	##ordering 
	X[order(x$var1, x$var3),]

	##ordering with plyr
	library(plyr)
	arrange(x, var1)
	arrange(x, desc(var1))

	##Adding rows and columns
	X$var4 <- rnorm(5)
	Y <- cbind(X, rnorm(5)) ##rbind

####### Summarizing Data
	## Getting the data from the web
	if(!file.exists("./data")){dir.create("./data")}
	fileURL <- "https://data.baltimorecity.gov/api/views/"
	download.file(fileURL, destfile = "./data/restaurants.csv", method ="curl")
	restdata <- read.csv("./data/restaurant.csv")
	##Look data
	head(restdata, n = 3)
	tail(restdata, n = 3)
	##summarize data
	summary(resrdata)
	##depth information
	str(restdata)
	##quantiles
	quantile(resrdata$councilDistrict, na.rm = TRUE, probs = c(0.5, 0.75, 0.9))
	##Make table
	table(restdata$zipCode, useNA = "ifany") 
	table(restdata$zipCode, restdata$zipCode)
	##check for missing values
	sum(is.na(restdata$councilDistrict))
	any(is.na(restdata$councilDistrict))
	all(restdata$zipCode > 0)
	##Rows and Columns sums
	colSums(is.na(restdata))
	all(colSums(is.na(resrdata))==0)
	##Values with specific characteristics
	table(restdata$zipCode %in% c("21212", "21213"))
	restdata[restdata$zipCode %in% c("21212", "21213"),]
	##Cross tabs
	xt <- xtabs(Freq ~ Gender + Admit, data = DF)
	##siwe of a data set
	object.size()
	print(object.size(), units = "Mb")
	
####### Create new variables
	##Create sequence
	s1 <- seq(1,10,by=2)	
	s1 <- seq(1,10,length=3)	
	s1 <- c(1,3,25,100); seq(along = x) ##same dimention
	##Subsetting variables
	restdata$nearMe = restdata$neighborhood %in% c("a","b")
	table(restdata$nearMe)
	##Creating binary variables
	restData$zipWrong = ifelse(restdata$ < 0, TRUE, FALSE)
	table(restdata$zipWrong, restdata$zipCode < 0)
	##Creating categorical variables
	restdata$zipGroups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
	table(restData$zipGroups)
	table(restData$zipGroups, restData$zipCode)
	##Easier cutting
	library(Hmisc)
	restData$zipGroups = cut2(restData$zipCode, g=4)
	table(restData$zipGroups)
	##Creating factor variables
	restData$zfc <- factor(restData$zipCode)
	restData$zfc[1:10]
	##Levels of factor variables
	yesno <- sample(c("yes", "no"), size = 10, replace = TRUE)
	yesnofac <- factor(yesno, levels=c("yes","no")) ##specify yes as lowest level
	relevel(yesno, ref = "yes")
	as.numeric(yesno)
	##Using the mutate function
	library(Hmisc)
	library(plyr)
	restData2 = mutate(restData, zipGroups=cut2(zipCode, g=4)) ##Add variable zipGroups
	##common transform
	floor(x)
	round(x, digits = n) round(3.475,digits=2) 3.48
	signif(x, digits = n)  round(3.475,digits=2) 3.5
##Reshaping data
##The goal is tidy data
##1. Each variable forms a column
##2. Each observation formsa row
##3. Each table/file stores data about one kind of observation (people/hospital)
	##Melting data frames
	mtcars$carname <- rownames(mtcars)
	carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.values=c("mpg", "hp"))
	##Casting data frames
	cylData <- dcast(carMelt, cyl ~ variable)
	cylData <- dcast(carMelt, cyl ~ variable,mean)
	##Averaging values
	tapply(InspectSprays$count, InspectSprays$spray, sum) ##Get sum of all one respect of two
	##Another way - split
	spIns = split(InspectSprays$count, InspectSprays$spray) 
	sprCount = lapply(spIns, sum) ##Return a vector
	unlist(sprCount) 
	##Another way - plyr package
	ddply(InspectSpray, .(spray), summarize, sum=sum(count))
	##Creating new variable
	spraySums <- ddply(InspectSprays, .(spray), summarize, sum=ave(count, FUN=sum))
##dplyr
	library(dplyr)	
	##Select function: access the columns using their namees
	head(select(chicago, city:dptp)) ##subset columns
	head(select(chicago, -(city:dptp))) 
	##Filter function
	chic.f <- filter(chicago, pm25tmean2 > 30)
	chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
	##arrange function
	chicago <- arrange(chicago, date) ##default inc
	chicago <- arrange(chicago, desc(date))
	##rename function
	chicago <- rename(chicago, pm25=pm25tmean2, dewpoint, dptp)
	##mutate
	chicago <- mutate(chicago, pm25detrend = pm25-mean(pm25, na.rm = TRUE))
	##group by function
	chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold","hot"))
	hotcold <- group_by(chicago, tempcat)
	##summarize
	summarize(hotcold, pm25 = mean(pm25), a3 = max(a3lmean2), na = median(no2tmean2))
 	summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), a3 = max(a3lmean2), na = median(no2tmean2))
 
	chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
	years <- group_by(chicago, year)
	
	##special operator concat operations implicit datasets
	chicago%>% mutate(month = as.POSIXlt(date)$mon + 1)%>% group_by(month)%>%summarize(pm25 = mean(pm25, na.rm = TRUE), a3 = max(a3lmean2), na = median(no2tmean2))
	
	##merging data
	mergedData = merge(reviews, solutions, by.x = "solution_id", by.y = "id", all = TRUE)
	arrange(join(df1,df2),id)

	##multiple data frames
	dfList = list(df1,df2,df3)
	join_all(dfList)

	
	
	
