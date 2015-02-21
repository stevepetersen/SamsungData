#
# data tidier for accelerometer data.  Creates the initial tidy data set from the accelerometer data bits and pieces.
#
getTidyData <- function() {

    #this helps us do the grep for mean and std later
    options( StringsAsFactors=FALSE )

    #
    # read general feature labels and activity labels that apply to both training and test datasets
    #

    feature_labels <- read.table("UCI HAR Dataset/features.txt")

    #fixed option for grep uses the literal string
    meanAndStdLogical <- grepl("mean()", feature_labels$V2, fixed=TRUE) | grepl("std()", feature_labels$V2, fixed=TRUE)
    retained_feature_labels <- subset(feature_labels, meanAndStdLogical)

    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names= c("id", "Activity"))

    #
    # read and create the test subset
    #

    #check.names makes sure the read operation doesn't change any of the column names
    test_features <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feature_labels$V2, check.names = FALSE)
    test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
    test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")

    #combine features with the subject and activity data
    #create std and mean subset
    subsetLogical <- colnames(test_features) %in% retained_feature_labels$V2
    test_features <- subset(test_features, select=subsetLogical)
    test_features$Subject <- test_subject$V1
    test_features$ActivityID <- test_activity$V1

    #
    # read and create the training subset
    #
    train_features <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feature_labels$V2, check.names = FALSE)
    train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
    train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")

     #combine with the subject and activity data
    #create std and mean subset
    subsetLogical <- colnames(train_features) %in% retained_feature_labels$V2
    train_features <- subset(train_features, select=subsetLogical)
    train_features$Subject <- train_subject$V1
    train_features$ActivityID <- train_activity$V1

    #
    # now merge the training and test datasets
    #
    all_features <- merge(test_features, train_features, all=T)

    # use merge to associate activity numbers with activity names, be sure not to sort the results
    all_features <- merge(all_features, activity_labels, by.x="ActivityID", by.y="id", sort=F)
    all_features$ActivityID <- NULL
    return(all_features)
}

#
# Creates the output tidy data set from the tidied Samsung data.
#
createOutputDataSet <- function(dataset) {

    #
    # finally create and return a data frame of averages of each value by subject and activity
    #
    outputDataSet <- dataset %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
    return(outputDataSet)
}

writeDataSet <- function(dataset) {

    write.table(dataset, "output.txt", row.name=FALSE)
}
