Course Project

This file describes how run_analysis.R script works.
First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder as "data".
Make sure the folder "data" and the run_analysis.R script are both in the current working directory.

Second, use source("run_analysis.R") command in RStudio.

Third, you will find two output files are generated in the working directory:
clean_data.txt (8.0 Mb): it contains the result merged of test and train data set.
tidy.data.txt (219 Kb):  tidy data set with the average of each variable for each activity and each subject.
