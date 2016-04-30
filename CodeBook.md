# Code Book

##Description
This code book summarizes the resulting data fields in `tidy_UCI_HAR_step5_summary.txt`.

##Source Data
Data for this class project was sourced from the following links:
[The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[Original Data Archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Transformations

###Step 1: Merged the training and the test sets to create one data set.
After downloading and unzipping the data archive, read the following files:
- x_train.txt
- y_train.txt
- x_test.txt
- y_test.txt
- features.txt

Merged train and test data using rbind. Added column names using features.txt data.

###Step 2: Extracted only the measurements on the mean and standard deviation for each measurement.
Subsetted the data by grepping for the column names matching mean and std.

###Step 3: Used descriptive activity names to name the activities in the data set.
Merged combined data set with descriptive activity names.

###Step 4: Appropriately labeled the data set with descriptive variable names. 
Used gsub to replace various strings to clean up the variable labels.

###Step 5: Created a second, independent tidy data set with the average of each variable for each activity and each subject.
Merged subject IDs. Used dplyr to produce a new tidy data set that displays the average of each variable for each activity and subject.

* `activity` - The activity the subject was performing during the test. Can be any of: `walking` (value `1`): subject was walking, `walking upstairs` (value `2`): subject was walking up a staircase, `walking downstairs` (value `3`): subject was walking down a staircase, `sitting` (value `4`): subject was sitting, `standing` (value `5`): subject was standing, `laying` (value `6`): subject was laying down
* `subject` - The ID (1-30) of the test subject.
* `variable` - Names the specific measurement variable.
* `value` - Average of the `variable`.

