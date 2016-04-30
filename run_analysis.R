# Assignment: Getting and Cleaning Data Course Project
# The purpose of this project is to demonstrate your 
# ability to collect, work with, and clean a data set.

library(tidyr)
library(dplyr)

# Check to see data directory exists; if not , create the data directory
if (!file.exists("./data")) {
    dir.create("./data")
}

# Download the dataset archive to be used throughtout the asisgnement
if (!file.exists("./data/UCI_HAR_Dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
        "./data/UCI_HAR_Dataset.zip")
}

# Unzip the dataset archive
if (!file.exists("./data/UCI HAR Dataset")) {
    unzip("./data/UCI_HAR_Dataset.zip", exdir = "./data")
}

# STEP 1 - Merges the training and the test sets to create one data set.

# Read In Training Data
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("./data/UCI HAR Dataset/train/y_train.txt", 
                             col.names=c("activityNumber"))

# Read In Test Data
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("./data/UCI HAR Dataset/test/y_test.txt", 
                            col.names=c("activityNumber"))

# Read in second column of features.txt
features  <- read.table("./data/UCI HAR Dataset/features.txt", 
                           stringsAsFactors=FALSE)[[2]]

# Merge Traing and Test Data
mergedData <- rbind(X_train, X_test)
colnames(mergedData) <- features

# End of STEP 1

# STEP 2 Extracts only the measurements on the mean and standard deviation 
# for each measurement.
meanAndStdColumns <- grep("mean\\()|std\\()", colnames(mergedData))
mergedData <- mergedData[,meanAndStdColumns]

# End of STEP 2

# STEP 3 Uses descriptive activity names to name the activities in the data set.

# Merge labels from Training and Test data
mergedDataLabels <- rbind(trainLabels, testLabels)

# Read in activity labels
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", 
                             col.names=c("activityNumber", "activityName"))

# Merge with activity labels
allMergedActivityNames <- merge(mergedDataLabels, activityLabels, 
                                   by="activityNumber", sort=FALSE)[["activityName"]]

# Assigned descriptive names back into mergedData
mergedData["activity"] <- sub("_", " ", tolower(allMergedActivityNames))

# End of STEP 3

# STEP 4 Appropriately labels the data set with descriptive variable names.
updateVariableNames <- function(variableNames) {
    variableNames <- gsub("tBody", "Time.Body", variableNames)
    variableNames <- gsub("tGravity", "Time.Gravity", variableNames)
    variableNames <- gsub("fBody", "FastFourierTransform.Body", variableNames)
    variableNames <- gsub("fGravity", "FFT.Gravity", variableNames)
    variableNames <- gsub("Acc", "Acceleration", variableNames)
    variableNames <- gsub("Mag", "Magnitude", variableNames)
    variableNames <- gsub("Gyro", "Gyroscope", variableNames)
    variableNames <- gsub("\\-mean\\(\\)\\-", ".Mean.", variableNames)
    variableNames <- gsub("\\-std\\(\\)\\-", ".Std.", variableNames)
    variableNames <- gsub("\\-mean\\(\\)", ".Mean", variableNames)
    variableNames <- gsub("\\-std\\(\\)", ".Std", variableNames)
    
    return(variableNames)
} 

names(mergedData) <- updateVariableNames(names(mergedData))

# End of STEP 4

# STEP 5 From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and each subject.

# Read in Subjects
trainSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", 
                          col.names=c("subject"))

testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", 
                          col.names=c("subject"))

# Merge subject data
mergedData["subject"] <- rbind(trainSubjects, testSubjects)

tidyMergedData <- mergedData %>%
  gather(variable, value, -activity, -subject) %>%
  group_by(activity, subject, variable) %>%
  summarize(value=mean(value)) %>%
  arrange(activity, subject, variable)

write.table(tidyMergedData, file = "tidy_UCI_HAR_step5_summary.txt", row.names = FALSE)