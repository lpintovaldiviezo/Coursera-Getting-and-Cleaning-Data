
	
##Editing Text variables
		##Fixing tolower(), toupper()
		tolower(names(cameradata))
		
		##separate strsplit()
		splitname = strsplit(names(cameraDara),"\\.")
		
		##fixing character vectors - sapply() apply a function to each element in a vector
		sapply(splitNames, firstElement)
		
		##fixing character vectors - sub()
		sub("_","",names(reviews))   ##use gsub for replace all
		
		##finding values grep or grepl
		grep("Alameda", camera$intersection) ##3 5 36  add parameter value = TRUE to return the element
		
		table(grepl("Alameda", camera$intersection)) ##FALSE 77 TRUE 3 u can use !grepl
		
		##subset
		cameraData2 <- cameraData[!grepl("Alameda", cameraData$Intersection),]
		
		##check value concidences
		length(grep("Alameda", camera$intersection))
		
		##other useful string functions
		nchar("hola") ##count character
		substr("Jeffrey Leek",1,7)
		paste("hola", "mundo") ##or paste0 
		str_trim("Jeff        ") ##remove blank spaces
			##Names of variable should be: all lower, no blank spaces or dots, not duplicated
			
			
##Regulqr Expressions consists only of literals
	##start of the line
	^i think
	##end of the line
	morning$
	##
	[Bb][Uu][Ss][Hh] ##look for bush or BUSH
	##Combine
	^[Ii] am
	##Specify range of  [a-z] [A-Z] [a-zA-Z] [0-9]
	^[0-9][a-zA-Z] ##1A
	##end anything different than
	[^.]$ ##end anything different from dot
	##dot is using to specify any character
	9.11 ##9/11
	##pipe
	flood|fire
	##
	^[Gg]ood|[Bb]ad
	^([Gg]ood|[Bb]ad)
	
	##question mark than follow a parenthesis \ to use special characters
	[Gg]eorge( [Ww]\.)? [Bb]ush
	
	## * (repeat times n) + (once)
	(.*) ##any character between ()
	
	##
	[Bb]ush ( + [^ ] + +){1,5} debates  ##m exact matches m, at least m macthes
	
	\1  ##replicate the same phrase

##working zith dates
	##formatting dates a = abbr weekday A = unabbr m = (00-12) b = abbr month B = unabbr y = 2 digit year Y = 4 digit year
	format(d2, "%a %b %d")
	##Creating dates
	z = as.Date(x, "%d%b%Y") ## rest dates return days can do as.numeric[]
	weekdays(d2) ##return the day pf the weekday
	months(d2) ##return the name of month
	julian(d2) ##return number of days since the beginning
	
	##lubridate 
	library(lubridate)
	ymd("20140810")
	mdy()
	dmy()
	ymd_hms("2011-08-03 10:15:03")
	
	
	
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
