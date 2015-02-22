# Course Project - Getting and Cleaning Data

## Dependencies
This script depends on the tidyr, reshape2 and dplyr packages and assumes they are already installed. It does load the libraries.

## Setup
The script will record your current working directory and return you to it after run.  It assumes you have downloaded the source data
prior to performing the analysis.

The working directory is set to /tmp/data.  This can be changed on line 8 as necessary.

The data can be retrieved from, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Script Overview

### Merges the train and test data sets

Three files are read in using the read.table function into it's own data frame.

1.  The raw data with one measurement per row
2.  The subject list that matches the raw data file order
3.  The activity list that matches the raw data file order

These files are then merged using the cbind function for each data set and then merged with the rbind function into a single data set.

### Adds descriptive names to the variables and adds the activity labels to each row

The activity labels are read in from the activity\_labels.txt file.  The variable names are read in from the features.txt file.

The activity\_labels.txt file contains the label and the number associated with that label, 1-6.  The number corresponds with the entry from the activity
list for each dataset.  The merge function is used to add a column with the label to each row in the merged dataset corresponding to the activity number in that row.

The features.txt file contains the variable names in order from top to bottom that correspond to the columns in order from left to right in the data set.
The variable names are added to the merged data set as column names using the colnames function.

### Converts the data set to a long form data set

The data set is initially a wide data set with the variables being stored in columns for each measurement.  The melt function is used to convert the
data frame so that the subject, activity\_label, and activity rows are retained and combined with the colname for each variable is moved to a variable column with its
value in the value column.

### extracts only the measurements on the mean and standard deviation for each measurement.

The script processes the combined data set and retrieves only the records that contain 'std' or 'mean' in the 'variable' column. This is accomplished with the
filter function and the grepl function to do the matching.

### Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This is accomplished by using the group\_by function to add grouping by subject, activity\_label, and variable.  Then summarize is used to calculate the mean of the 'value' column for each combination of subject, activity, and variable.  The resulting data set is written to the avg\_by\_subject\_activity.txt file
written to the starting working directory
