##Webscraping: programatically extract data from HTML code of website.

con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode 
##Getting XML library
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)
xpathSApply(html, "//title", xmlValue)
##Getting httr package
library(httr)
html2 = GET(url)
content2 = content(html2, as = "text")
parsedHtml = htmlParse(content2, asText=T)
xpathSApply(parsedHtml, "//title", xmlValue)
##Authenticate
pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
	authenticate("user","password"))