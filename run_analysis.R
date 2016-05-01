# Assignment: Getting and Cleaning Data Course Project
# The purpose of this project is to demonstrate your 
# ability to collect, work with, and clean a data set.

library(tidyr)

# Check to see if the Samsung data directory exists; if not , go get the data
if (!file.exists("./UCI HAR Dataset")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./UCI_HAR_Dataset.zip")  
  unzip("./UCI_HAR_Dataset.zip")
}

# Read in features.txt
features  <- read.table("./UCI HAR Dataset/features.txt")

# Read In Training Data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features[,2])
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("activityNumber"))

# Combine Training Data Columns
finalTrainData = cbind(trainLabels, trainSubjects, X_train)

# Read In Test Data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("activityNumber"))

# Combine Test Data Columns
finalTestData = cbind(testLabels, testSubjects, X_test)

# STEP 1 - Merges the training and the test sets to create one data set.
mergedData <- rbind(finalTrainData, finalTestData)

# End of STEP 1

# STEP 2 Extracts only the variables on the mean and standard deviation for each measurement.
meanAndStdColumns <- (grepl("activityNumber", colnames(mergedData)) | grepl("subject", colnames(mergedData)) | grepl("mean\\.\\.", colnames(mergedData)) | grepl("std\\.\\.", colnames(mergedData)))
mergedData <- mergedData[meanAndStdColumns == TRUE]

# End of STEP 2

# STEP 3 Uses descriptive activity names to name the activities in the data set.

# Read in activity labels and clean up
activityLabels <- sapply(read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("activityNumber", "activity")), function (x) {sub("_", " ", tolower(x))})

# Merge with activity labels
mergedData <- merge(mergedData, activityLabels, by="activityNumber", all.x = TRUE)

# End of STEP 3

# STEP 4 Appropriately labels the data set with descriptive variable names.
cleanupVariableNames <- function(variableNames) {
    variableNames <- gsub("tBody", "Time.Body", variableNames)
    variableNames <- gsub("tGravity", "Time.Gravity", variableNames)
    variableNames <- gsub("fBody", "FastFourierTransform.Body", variableNames)
    variableNames <- gsub("fGravity", "FastFourierTransform.Gravity", variableNames)
    variableNames <- gsub("Acc", "Acceleration", variableNames)
    variableNames <- gsub("Mag", "Magnitude", variableNames)
    variableNames <- gsub("Gyro", "Gyroscope", variableNames)
    
    return(variableNames)
} 

names(mergedData) <- cleanupVariableNames(names(mergedData))

# End of STEP 4

# STEP 5 From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and each subject.
tidySummaryMergedData <- mergedData %>%
    gather(variable, value, -activityNumber, -subject, -activity) %>%
    group_by(activity, subject, variable) %>%
    summarize(value=mean(value)) %>%  
    spread(variable,value)

# Update variable names to show that they are now means of the original mesasurements
updateVariableNames <- function(variableNames) {
    variableNames <- gsub("Time.Body", "MeanOf.Time.Body", variableNames)
    variableNames <- gsub("Time.Gravity", "MeanOf.Time.Gravity", variableNames)
    variableNames <- gsub("FastFourierTransform.Body", "MeanOf.FastFourierTransform.Body", variableNames)
    variableNames <- gsub("FastFourierTransform.Gravity", "MeanOf.FastFourierTransform.Gravity", variableNames)
  
    return(variableNames)
} 

names(tidySummaryMergedData) <- updateVariableNames(names(tidySummaryMergedData))

write.table(tidySummaryMergedData, file = "tidy_UCI_HAR_step5_summary.txt", row.names = FALSE)