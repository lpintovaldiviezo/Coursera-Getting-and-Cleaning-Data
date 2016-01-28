source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created <- h5createFile("example.h5")
##create groups
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")
##read/write
h5write(c(12,13,14), "example.h5","foo/A",index = list(1:3,1))
readA = h5read("example.h5","foo/A")
