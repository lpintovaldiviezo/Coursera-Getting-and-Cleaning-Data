##Read the trainning data
train.data <- read.table("./data/train/X_train.txt")
train.label <- read.table("./data/train/y_train.txt")
train.subject <- read.table("./data/train/subject_train.txt")
##Read the test data
test.data <- read.table("./data/test/X_test.txt")
test.label <- read.table("./data/test/y_test.txt")
test.subject <- read.table("./data/test/subject_test.txt")
##Join the data, adding the test'rows 
join.data <- rbind(train.data, test.data)
join.label <- rbind(train.label, test.label)
join.subject <- rbind(train.subject, test.subject)
##Read the features data and activity labels
features.data <- read.table("./data/features.txt")
activity.labels <- read.table("./data/activity_labels.txt")
##Get features index that include mean or std
features.index <- grep("std\\(\\)|mean\\(\\)", features.data[,2]) 
##Keep the features of study
join.data <- join.data[ ,features.index] 
##Rename variables names
names(join.data) <- features.data[features.index, 2]
names(join.data) <- gsub("-","",names(join.data)) 
names(join.data) <- gsub("\\(\\)","",names(join.data)) 
##Uses descriptive activity names to name the activities in the data set
activity.labels[ ,2] <- tolower(activity.labels[ ,2])
activity.labels[ ,2] <- gsub("_","",activity.labels[ ,2]) 
join.label[ ,1] <- activity.labels[join.label[ ,1],2]
##Appropriately labels the data set with descriptive variable names.
names(join.label) <- "activity"
names(join.subject) <- "subject"
##Join all parts to get the clean data
newData <- cbind(join.subject, join.label, join.data)
write.table(newData, "clean_data.txt", row.name=FALSE)
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy.data <- aggregate(. ~ subject + activity, newData, mean)
write.table(tidy.data, "tidy_data.txt", row.name=FALSE)
