# Code Book

##Description
This code book summarizes the transformations and resulting data fields in `tidy_UCI_HAR_step5_summary.txt`.

##Source Data
Data for this class project was sourced from the following links:
* [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Original Data Archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

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
Merged combined data set with descriptive activity names (removed `_` and coverted to all lowercase).

###Step 4: Appropriately labeled the data set with descriptive variable names. 
Used gsub to replace various strings to clean up the variable labels.

###Step 5: Created a second, independent tidy data set with the average of each variable for each activity and each subject.
Read the following files:
- subject_train.txt
- subject_test.txt

Merged subject IDs into the current merged data set. Used dplyr to produce a new tidy data set that displays the average of each variable for each activity and subject.

##Resulting Data Fields

###Identifiers
* `activity` - the activity the subject was performing during the test: `walking` (value `1`): subject was walking, `walking upstairs` (value `2`): subject was walking up a staircase, `walking downstairs` (value `3`): subject was walking down a staircase, `sitting` (value `4`): subject was sitting, `standing` (value `5`): subject was standing, `laying` (value `6`): subject was laying down
* `subject` - the ID (1-30) of the test subject.

###Measurements (Mean of)
`MeanOf.FastFourierTransform.BodyAcceleration.Mean.X` `MeanOf.FastFourierTransform.BodyAcceleration.Mean.Y` `MeanOf.FastFourierTransform.BodyAcceleration.Mean.Z` `MeanOf.FastFourierTransform.BodyAcceleration.Std.X` `MeanOf.FastFourierTransform.BodyAcceleration.Std.Y` `MeanOf.FastFourierTransform.BodyAcceleration.Std.Z` `MeanOf.FastFourierTransform.BodyAccelerationJerk.Mean.X` `MeanOf.FastFourierTransform.BodyAccelerationJerk.Mean.Y` `MeanOf.FastFourierTransform.BodyAccelerationJerk.Mean.Z` `MeanOf.FastFourierTransform.BodyAccelerationJerk.Std.X` `MeanOf.FastFourierTransform.BodyAccelerationJerk.Std.Y` `MeanOf.FastFourierTransform.BodyAccelerationJerk.Std.Z` `MeanOf.FastFourierTransform.BodyAccelerationMagnitude.Mean` `MeanOf.FastFourierTransform.BodyAccelerationMagnitude.Std` `MeanOf.FastFourierTransform.BodyBodyAccelerationJerkMagnitude.Mean` `MeanOf.FastFourierTransform.BodyBodyAccelerationJerkMagnitude.Std` `MeanOf.FastFourierTransform.BodyBodyGyroscopeJerkMagnitude.Mean` `MeanOf.FastFourierTransform.BodyBodyGyroscopeJerkMagnitude.Std` `MeanOf.FastFourierTransform.BodyBodyGyroscopeMagnitude.Mean` `MeanOf.FastFourierTransform.BodyBodyGyroscopeMagnitude.Std` `MeanOf.FastFourierTransform.BodyGyroscope.Mean.X` `MeanOf.FastFourierTransform.BodyGyroscope.Mean.Y` `MeanOf.FastFourierTransform.BodyGyroscope.Mean.Z` `MeanOf.FastFourierTransform.BodyGyroscope.Std.X` `MeanOf.FastFourierTransform.BodyGyroscope.Std.Y` `MeanOf.FastFourierTransform.BodyGyroscope.Std.Z` `MeanOf.Time.BodyAcceleration.Mean.X`
`MeanOf.Time.BodyAcceleration.Mean.Y`
`MeanOf.Time.BodyAcceleration.Mean.Z`
`MeanOf.Time.BodyAcceleration.Std.X`
`MeanOf.Time.BodyAcceleration.Std.Y`
`MeanOf.Time.BodyAcceleration.Std.Z`
`MeanOf.Time.BodyAccelerationJerk.Mean.X`
`MeanOf.Time.BodyAccelerationJerk.Mean.Y`
`MeanOf.Time.BodyAccelerationJerk.Mean.Z`
`MeanOf.Time.BodyAccelerationJerk.Std.X`
`MeanOf.Time.BodyAccelerationJerk.Std.Y`
`MeanOf.Time.BodyAccelerationJerk.Std.Z` `MeanOf.Time.BodyAccelerationJerkMagnitude.Mean` `MeanOf.Time.BodyAccelerationJerkMagnitude.Std` `MeanOf.Time.BodyAccelerationMagnitude.Mean` `MeanOf.Time.BodyAccelerationMagnitude.Std`
`MeanOf.Time.BodyGyroscope.Mean.X`
`MeanOf.Time.BodyGyroscope.Mean.Y`
`MeanOf.Time.BodyGyroscope.Mean.Z`
`MeanOf.Time.BodyGyroscope.Std.X`
`MeanOf.Time.BodyGyroscope.Std.Y`
`MeanOf.Time.BodyGyroscope.Std.Z`
`MeanOf.Time.BodyGyroscopeJerk.Mean.X`
`MeanOf.Time.BodyGyroscopeJerk.Mean.Y`
`MeanOf.Time.BodyGyroscopeJerk.Mean.Z`
`MeanOf.Time.BodyGyroscopeJerk.Std.X`
`MeanOf.Time.BodyGyroscopeJerk.Std.Y`
`MeanOf.Time.BodyGyroscopeJerk.Std.Z`
`MeanOf.Time.BodyGyroscopeJerkMagnitude.Mean` `MeanOf.Time.BodyGyroscopeJerkMagnitude.Std` `MeanOf.Time.BodyGyroscopeMagnitude.Mean`
`MeanOf.Time.BodyGyroscopeMagnitude.Std`
`MeanOf.Time.GravityAcceleration.Mean.X`
`MeanOf.Time.GravityAcceleration.Mean.Y`
`MeanOf.Time.GravityAcceleration.Mean.Z`
`MeanOf.Time.GravityAcceleration.Std.X`
`MeanOf.Time.GravityAcceleration.Std.Y`
`MeanOf.Time.GravityAcceleration.Std.Z` `MeanOf.Time.GravityAccelerationMagnitude.Mean` `MeanOf.Time.GravityAccelerationMagnitude.Std`

