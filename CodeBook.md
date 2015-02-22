# Codebook for Tidy Data Set created by run_analysis.R

## Original Source Data

The source data used in creating the tidy data set is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Complete description of the data experiment to collect the data is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original data set is fully described in the README.txt included in the zip file.  The data consists of sensor data collected from a smart phone while subjects performed different physical activities.  The original data set is split up into the train and test data sets.  Each data set consists of multiple files containing parts of the data and files with the labels for the data.

## Tidy Data Overview

The transformation of the original source data to create the tidy data set includes the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Data set

The resulting data set contains 14220 observations of 4 variables.  Each observation is in a different row and each variable is in a single column.

Each observation is a record of the the mean of all measurements for a combination of subject, activity, and variable from the original source data set.

### Columns

- subject:  an integer representing the subject from the original study.  The range of values is 1-30.

- activity: a string of the activity for which the measurements were taken.  The range of values include the following:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

- variable:  these are the variables from the original source data set as specified in features_info.txt file.  Only the variables for mean and standard deviation were retained from the original data set.

- mean:  The mean of all the measurements from the original dataset.
