# Code Book

##Description
This code book summarizes the transformations and resulting data fields in `tidy_UCI_HAR_step5_summary.txt`.

##Source Data
Data for this class project was sourced from the following links:
* [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Original Data Archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Transformations

- Step 1: Merged the training and the test sets to create one data set.
- Step 2: Extracted only the measurements on the mean and standard deviation for each measurement.
- Step 3: Used descriptive activity names to name the activities in the data set.
- Step 4: Appropriately labeled the data set with descriptive variable names. 
- Step 5: Created a second, independent tidy data set with the average of each variable for each activity and each subject. Also, added "MeanOf" to new variables calculated in this step.

##Resulting Data Fields

###Identifiers
* `activity` - the activity the subject was performing during the test: `walking` (value `1`): subject was walking, `walking upstairs` (value `2`): subject was walking up a staircase, `walking downstairs` (value `3`): subject was walking down a staircase, `sitting` (value `4`): subject was sitting, `standing` (value `5`): subject was standing, `laying` (value `6`): subject was laying down
* `subject` - the ID (1-30) of the specific test subject

###Summary of Measurements

The following variables represent the average for each measurement variable for each activity and each subject.

* `MeanOf.FastFourierTransform.BodyAcceleration.mean...X` 
* `MeanOf.FastFourierTransform.BodyAcceleration.mean...Y` 
* `MeanOf.FastFourierTransform.BodyAcceleration.mean...Z` 
* `MeanOf.FastFourierTransform.BodyAcceleration.std...X` 
* `MeanOf.FastFourierTransform.BodyAcceleration.std...Y` 
* `MeanOf.FastFourierTransform.BodyAcceleration.std...Z`
* `MeanOf.FastFourierTransform.BodyAccelerationJerk.mean...X`
* `MeanOf.FastFourierTransform.BodyAccelerationJerk.mean...Y`
* `MeanOf.FastFourierTransform.BodyAccelerationJerk.mean...Z`
* `MeanOf.FastFourierTransform.BodyAccelerationJerk.std...X`
* `MeanOf.FastFourierTransform.BodyAccelerationJerk.std...Y`
* `MeanOf.FastFourierTransform.BodyAccelerationJerk.std...Z`
* `MeanOf.FastFourierTransform.BodyAccelerationMagnitude.mean..`
* `MeanOf.FastFourierTransform.BodyAccelerationMagnitude.std..`
* `MeanOf.FastFourierTransform.BodyBodyAccelerationJerkMagnitude.mean..`
* `MeanOf.FastFourierTransform.BodyBodyAccelerationJerkMagnitude.std..`
* `MeanOf.FastFourierTransform.BodyBodyGyroscopeJerkMagnitude.mean..`
* `MeanOf.FastFourierTransform.BodyBodyGyroscopeJerkMagnitude.std..`
* `MeanOf.FastFourierTransform.BodyBodyGyroscopeMagnitude.mean..`
* `MeanOf.FastFourierTransform.BodyBodyGyroscopeMagnitude.std..`
* `MeanOf.FastFourierTransform.BodyGyroscope.mean...X`
* `MeanOf.FastFourierTransform.BodyGyroscope.mean...Y`
* `MeanOf.FastFourierTransform.BodyGyroscope.mean...Z`
* `MeanOf.FastFourierTransform.BodyGyroscope.std...X`
* `MeanOf.FastFourierTransform.BodyGyroscope.std...Y`
* `MeanOf.FastFourierTransform.BodyGyroscope.std...Z`
* `MeanOf.Time.BodyAcceleration.mean...X`
* `MeanOf.Time.BodyAcceleration.mean...Y`
* `MeanOf.Time.BodyAcceleration.mean...Z`
* `MeanOf.Time.BodyAcceleration.std...X`
* `MeanOf.Time.BodyAcceleration.std...Y`
* `MeanOf.Time.BodyAcceleration.std...Z`
* `MeanOf.Time.BodyAccelerationJerk.mean...X`
* `MeanOf.Time.BodyAccelerationJerk.mean...Y`
* `MeanOf.Time.BodyAccelerationJerk.mean...Z`
* `MeanOf.Time.BodyAccelerationJerk.std...X` 
* `MeanOf.Time.BodyAccelerationJerk.std...Y`
* `MeanOf.Time.BodyAccelerationJerk.std...Z`
* `MeanOf.Time.BodyAccelerationJerkMagnitude.mean..`
* `MeanOf.Time.BodyAccelerationJerkMagnitude.std..`
* `MeanOf.Time.BodyAccelerationMagnitude.mean..`
* `MeanOf.Time.BodyAccelerationMagnitude.std..`
* `MeanOf.Time.BodyGyroscope.mean...X`
* `MeanOf.Time.BodyGyroscope.mean...Y`
* `MeanOf.Time.BodyGyroscope.mean...Z`
* `MeanOf.Time.BodyGyroscope.std...X`
* `MeanOf.Time.BodyGyroscope.std...Y`
* `MeanOf.Time.BodyGyroscope.std...Z`
* `MeanOf.Time.BodyGyroscopeJerk.mean...X`
* `MeanOf.Time.BodyGyroscopeJerk.mean...Y`
* `MeanOf.Time.BodyGyroscopeJerk.mean...Z`
* `MeanOf.Time.BodyGyroscopeJerk.std...X`
* `MeanOf.Time.BodyGyroscopeJerk.std...Y`
* `MeanOf.Time.BodyGyroscopeJerk.std...Z`
* `MeanOf.Time.BodyGyroscopeJerkMagnitude.mean..`
* `MeanOf.Time.BodyGyroscopeJerkMagnitude.std..`
* `MeanOf.Time.BodyGyroscopeMagnitude.mean..`
* `MeanOf.Time.BodyGyroscopeMagnitude.std..`
* `MeanOf.Time.GravityAcceleration.mean...X`
* `MeanOf.Time.GravityAcceleration.mean...Y`
* `MeanOf.Time.GravityAcceleration.mean...Z`
* `MeanOf.Time.GravityAcceleration.std...X`
* `MeanOf.Time.GravityAcceleration.std...Y`
* `MeanOf.Time.GravityAcceleration.std...Z`
* `MeanOf.Time.GravityAccelerationMagnitude.mean..`
* `MeanOf.Time.GravityAccelerationMagnitude.std..`


