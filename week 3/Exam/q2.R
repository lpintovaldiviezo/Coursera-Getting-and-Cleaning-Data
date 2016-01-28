install.packages("jpeg") 
library(jpeg)
sourceJPEG <- "getdata-jeff.jpg"
dat <- readJPEG(sourceJPEG, native = TRUE)
quantile(dat, na.rm = TRUE, probs = c(0.3, 0.8))
	