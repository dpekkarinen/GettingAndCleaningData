# Getting and Cleaning Data Class Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

This repository contains: 
 *  `run_analysis.R` - script for performing the project analysis
 *  `CodeBook.md` - code book that describes the variables, the data, and transformations performed to clean up the data and produce the output file, `tidy_UCI_HAR_step5_summary.txt`
 
 The script, `run.analysis.R`, performs the following actions:
    * Step 1: Merges the training and the test sets to create one data set.
    * Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
    * Step 3: Uses descriptive activity names to name the activities in the data set.
    * Step 4: Appropriately labels the data set with descriptive variable names.
    * Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. At the conclusion of this step the independent tidy data set will be written to the script's current directory as a comma seperated value file, `tidy_UCI_HAR_step5_summary.txt`.
