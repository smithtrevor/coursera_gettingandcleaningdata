# load needed libraries
library(dplyr)
library(tidyr)
library(reshape2)

# Merge the trianing and the test sets
start_dir <- getwd()
setwd("/tmp/data")

## read in the test data set
test_raw <- read.table("./test/X_test.txt")
test_subjects <- read.table("./test/subject_test.txt")
test_activities <- read.table("./test/y_test.txt")
test_raw <- cbind(test_subjects,test_activities,test_raw)

## read in the train data set
train_raw <- read.table("./train/X_train.txt")
train_subjects <- read.table("./train/subject_train.txt")
train_activities <- read.table("./train/y_train.txt")
train_raw <- cbind(train_subjects,train_activities,train_raw)

## merge both data sets
combined_data <- rbind(train_raw, test_raw)

## read in the features
features <- read.table("./features.txt")

## change column names labeling the variables by the feature
colnames(combined_data) <- c('subject','activity', as.vector(features$V2))

## read in the activity labels
activity_labels <- read.table("./activity_labels.txt")
colnames(activity_labels) <- c('activity','activity_label')

## combine the activity labels with both data sets
combined_data <- merge(combined_data,activity_labels, by='activity')

## convert each data set to long forms of data
combined_data <- melt(combined_data, id.vars=c('subject','activity_label','activity'))

# extract the mean and standard deviation measures
tidy_data <- filter(combined_data, grepl('std|mean', combined_data$variable))

# create an independent data set with the average of each variable for each activity and subject
grouped_data <- group_by(tidy_data, subject,activity_label, variable)
avg_by_subject_activity <- summarize(grouped_data, mean(value))
colnames(avg_by_subject_activity) <- c('subject','activity','variable','mean')

# write out the independent data set
write.table(avg_by_subject_activity, file = paste(start_dir, "/avg_by_subject_activity.txt", sep=""), row.names = FALSE)

# return to start_dir
setwd(start_dir)
