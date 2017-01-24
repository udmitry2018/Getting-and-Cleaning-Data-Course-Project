This document descibes the processing data to generate the output result required in the course.

Given data source

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following tables were used

X_train.txt
subject_train.txt
Y_train.txt
X_test.txt
subject_test.txt
Y_test.txt
features.txt
activity_labels.txt
Steps

As train and test data were in separate directories
they were first merged
The feature were then copied in from features.txt

Only feature names with mean and std in the name were used.
The data with X coordinate was merged with Y coordinate  and then aggregated by activity and subject.