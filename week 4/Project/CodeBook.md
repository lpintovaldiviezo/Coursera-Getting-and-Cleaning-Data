Course Project CodeBook

This file describes the variables, the data, and any work performed to clean up the data.

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:

1. Read the trainning data which includes: X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in train.data, train.label and train.subject variables respectively.
2. Read the test data which includes: X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in test.data, test.label and test.subject variables respectively.
3. Concatenate train.data to test.data to generate a 10299x561 data frame, called join.data; concatenate train.label to test.label to generate a 10299x1 data frame, called join.label; concatenate train.subject to test.subject to generate a 10299x1 data frame, called join.subject.
4. Read the features.txt file from the "/data" folder and store the data in a variable called features.data. 
5. Read the activity_labels.txt file from the "/data" folder and store the data in a variable called activity.labels. 
6. Extract the measurements on the mean and standard deviation. Getting a subset of join.data with the 66 corresponding columns.
5. Rename variables names of the subset. We remove the "()" and "-" symbols in the names.
7. Clean the activity names in the second column of activity.labels. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore.
8. Transform the values of join.label according to the activity data frame.
9. Rename variables names of the subset: join.label, join.subject for activity, subject respectively
9. Combine the joinSubject, joinLabel and joinData by column to get a new cleaned 10299x68 data frame, called newData. The newData set has the following structure: The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
10. Write the newData out to "clean_data.txt" file in current working directory.
11. Finally, generate a second independent tidy data set with the average of each variable for each activity and each subject ans stored in a data frame, called "tidy.data".
12. Write the result out to "tidy_data.txt" file in current working directory.