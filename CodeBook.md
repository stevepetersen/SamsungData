# Code Book for Samsung Data

## Context
This is the codebook for the Getting and Cleaning Data Course Project.

The input data for the project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is also checked into this repository in the "UCI HAR Dataset" subdirectory, in case it is changed or deleted on the web.

## Raw Data
For a description of the underlying data collection and format, please reference the README.txt file in the UCI HAR Dataset subdirectory.

## Tidy Data (part 1)
The project is in two parts.  Part one is to tidy up the raw accelerometer data, in the following steps:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.

to perform these steps, do the following in R:
```
    library(dplyr)
    source("run_analysis.R")
    tidyData <- getTidyData()
```

### Schema
The tidy data schema is as follows:

Subject:  The participant subject identifier, range 1-30.

Activity:  The activity classification, one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Measurement columns: a subset of the raw data measurements that includes the mean and standard deviation measurements only.  These are in
the form XXX-std() and YYY-mean().  The meaning of these measurements is beyond the scope of the project, but can be found in the raw data subdirectory in the features_info.txt file.


## Output data (part 2)
Part two is to perform the following:
- From the data set in part 1, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

to perform this steps, execute the following R function (in "run_analysis.R") on the tidy data set created in part 1, to create the output.txt output file:

```
    outputDataSet <- createOutputDataSet(tidyData)
    writeDataSet(outputDataSet)
```

### Schema
The output data schema is as follows:

Subject:  The participant subject identifier, range 1-30.

Activity:  The activity classification, one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Measurement columns: the mean of all observations of the original mean and standard deviation measurements.  These are in
the form "XXX-std() MEAN" and "YYY-mean() MEAN".  Understanding the meaning of these measurements is not a goal of this project.