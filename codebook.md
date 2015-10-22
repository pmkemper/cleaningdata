---
title: "Codebook template"
author: "Philip Kemper"
date: "10/22/2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
In this project we take raw data from accelerometers from the Samsung Galaxy S smartphone measured during 6 activities in 30 participants, and create a tidy data file that only contains averages of the means and standard deviations of the features measured for each subject and activity.

##Study design and data processing

###Collection of the raw data
Raw data was collected by downloading and unzipping the following file:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Creating the tidy datafile

###Guide to create the tidy data file
1. Download the run_analysis.R file
2. Place the run_analysis.R file within the raw data folder (so that it is in the same folder as features.txt etc.)
3. Run run_analysis.R by using source() in your R environment:  
```
source(“run_analysis.R”)
```

You will now find tidy_data.txt in the same directory.

###Cleaning of the data
The script takes the raw data, combines test and train data sets, extracts only the measurements on the mean and standard deviation for each measurement, adds labels and names, and then returns the average of each of these measurements for each activity of each subject.

See the README.md file for more information.

##Description of the variables in the tidy_data.txt file
tidy_data.txt has 180 rows and 68 columns.

The 180 rows consist of the 6 activities (laying, sitting, standing, walking, walking downstairs and walking upstairs) for each of the 30 participants.

The columns are the Subjects, Activity, and 66 columns containing the average of the various mean() and std() measurements:

###Subjects
The subjects in this study, identified by integers ranging from 1 to 30.

###Activity
The activities the subjects engaged in.
A factor variable with 6 levels: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS.

###Measurements

The following text describes how the measurements were originally derived and calculated:  
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>tBodyAcc-XYZ  
>tGravityAcc-XYZ  
>tBodyAccJerk-XYZ  
>tBodyGyro-XYZ  
>tBodyGyroJerk-XYZ  
>tBodyAccMag  
>tGravityAccMag  
>tBodyAccJerkMag  
>tBodyGyroMag  
>tBodyGyroJerkMag  
>fBodyAcc-XYZ  
>fBodyAccJerk-XYZ  
>fBodyGyro-XYZ  
>fBodyAccMag  
>fBodyAccJerkMag  
>fBodyGyroMag  
>fBodyGyroJerkMag  

To create the tidy data set, the average of the mean and standard deviation of each of these signals were calculated for each subject and each activity. 

This means that we get the following variables. Each variable contains the average of the relevant feature:

 * tBodyAcc-mean()-X
 * tBodyAcc-mean()-Y
 * tBodyAcc-mean()-Z
 * tBodyAcc-std()-X
 * tBodyAcc-std()-Y
 * tBodyAcc-std()-Z
 * tGravityAcc-mean()-X
 * tGravityAcc-mean()-Y
 * tGravityAcc-mean()-Z
 * tGravityAcc-std()-X
 * tGravityAcc-std()-Y
 * tGravityAcc-std()-Z
 * tBodyAccJerk-mean()-X
 * tBodyAccJerk-mean()-Y
 * tBodyAccJerk-mean()-Z
 * tBodyAccJerk-std()-X
 * tBodyAccJerk-std()-Y
 * tBodyAccJerk-std()-Z
 * tBodyGyro-mean()-X
 * tBodyGyro-mean()-Y
 * tBodyGyro-mean()-Z
 * tBodyGyro-std()-X
 * tBodyGyro-std()-Y
 * tBodyGyro-std()-Z
 * tBodyGyroJerk-mean()-X
 * tBodyGyroJerk-mean()-Y
 * tBodyGyroJerk-mean()-Z
 * tBodyGyroJerk-std()-X
 * tBodyGyroJerk-std()-Y
 * tBodyGyroJerk-std()-Z
 * tBodyAccMag-mean()
 * tBodyAccMag-std()
 * tGravityAccMag-mean()
 * tGravityAccMag-std()
 * tBodyAccJerkMag-mean()
 * tBodyAccJerkMag-std()
 * tBodyGyroMag-mean()
 * tBodyGyroMag-std()
 * tBodyGyroJerkMag-mean()
 * tBodyGyroJerkMag-std()
 * fBodyAcc-mean()-X
 * fBodyAcc-mean()-Y
 * fBodyAcc-mean()-Z
 * fBodyAcc-std()-X
 * fBodyAcc-std()-Y
 * fBodyAcc-std()-Z
 * fBodyAccJerk-mean()-X
 * fBodyAccJerk-mean()-Y
 * fBodyAccJerk-mean()-Z
 * fBodyAccJerk-std()-X
 * fBodyAccJerk-std()-Y
 * fBodyAccJerk-std()-Z
 * fBodyGyro-mean()-X
 * fBodyGyro-mean()-Y
 * fBodyGyro-mean()-Z
 * fBodyGyro-std()-X
 * fBodyGyro-std()-Y
 * fBodyGyro-std()-Z
 * fBodyAccMag-mean()
 * fBodyAccMag-std()
 * fBodyBodyAccJerkMag-mean()
 * fBodyBodyAccJerkMag-std()
 * fBodyBodyGyroMag-mean()
 * fBodyBodyGyroMag-std()
 * fBodyBodyGyroJerkMag-mean()
 * fBodyBodyGyroJerkMag-std()

##Sources
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
https://datasciencespecialization.github.io/getclean/