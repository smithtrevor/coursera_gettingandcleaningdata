# Codebook for Tidy Data Set created by run_analysis.R

## Original Source Data

## Tidy Data Overview

### Data set

The resulting data set contains 14220 observations of 4 variables.  

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
