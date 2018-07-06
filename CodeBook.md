---
title: "CodeBook.md"
author: "John Snyder"
date: "June 25, 2018"
output: html_document
---
# Summary
This document describes the data found in the "Step5-TidyData.txt" file, refered to from here as the data file.

The data file is a whitespace delimited ASCII text file with a header row, 180 observations (rows), and 68 variables (columns).  The data file was created by applying the "run_analysis.R" script to the original **Human Activity Recognition Using Smartphones Data Set**

From the 'features_info.txt' file included with the [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):

>### Feature Selection 
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The following transforms were applied the original data to create the "Step5-TidyData.txt" file:

1. The training and the test sets were merged to create one data set with 30 subjects.
2. Analysis was performed only on the measurements of the mean and standard deviation for each measurement in the original dataset.
3. Descriptive activity names were used to name the activities in the data set
4. Feature labels were modified relative to the original data set
    * Parentheses, "()", were removed.
    * Non-alphanumeric characters were replaced with periods.
5. The average of each variable (feature) for each activity and each subject was calculated and stored as the variable values in the "Step5-TidyData.txt" file.

# Variables
__*[index] variable name*__


**[01] subject**<br/>
    .Identifier assigned to each test subject<br/>
    1..30 
    
**[02] activity**<br/>
    .Activity subject was engaged in at time of observation<br/>
    
    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING
     
**[03] tBodyAcc.mean.X**<br/>
     .Floating Point Value
 
**[04] tBodyAcc.mean.Y**<br/>
     .Floating Point Value
 
**[05] tBodyAcc.mean.Z**<br/>
     .Floating Point Value
 
**[06] tBodyAcc.std.X**<br/>
     .Floating Point Value
 
**[07] tBodyAcc.std.Y**<br/>
     .Floating Point Value
 
**[08] tBodyAcc.std.Z**<br/>
     .Floating Point Value
 
**[09] tGravityAcc.mean.X**<br/>
     .Floating Point Value
 
**[10] tGravityAcc.mean.Y**<br/>
     .Floating Point Value
 
**[11] tGravityAcc.mean.Z**<br/>
     .Floating Point Value
 
**[12] tGravityAcc.std.X**<br/>
     .Floating Point Value
 
**[13] tGravityAcc.std.Y**<br/>
     .Floating Point Value
 
**[14] tGravityAcc.std.Z**<br/>
     .Floating Point Value
 
**[15] tBodyAccJerk.mean.X**<br/>
     .Floating Point Value
 
**[16] tBodyAccJerk.mean.Y**<br/>
     .Floating Point Value
 
**[17] tBodyAccJerk.mean.Z**<br/>
     .Floating Point Value
 
**[18] tBodyAccJerk.std.X**<br/>
     .Floating Point Value
 
**[19] tBodyAccJerk.std.Y**<br/>
     .Floating Point Value
 
**[20] tBodyAccJerk.std.Z**<br/>
     .Floating Point Value
 
**[21] tBodyGyro.mean.X**<br/>
     .Floating Point Value
 
**[22] tBodyGyro.mean.Y**<br/>
     .Floating Point Value
 
**[23] tBodyGyro.mean.Z**<br/>
     .Floating Point Value
 
**[24] tBodyGyro.std.X**<br/>
     .Floating Point Value
 
**[25] tBodyGyro.std.Y**<br/>
     .Floating Point Value
 
**[26] tBodyGyro.std.Z**<br/>
     .Floating Point Value
 
**[27] tBodyGyroJerk.mean.X**<br/>
     .Floating Point Value
 
**[28] tBodyGyroJerk.mean.Y**<br/>
     .Floating Point Value
 
**[29] tBodyGyroJerk.mean.Z**<br/>
     .Floating Point Value
 
**[30] tBodyGyroJerk.std.X**<br/>
     .Floating Point Value
 
**[31] tBodyGyroJerk.std.Y**<br/>
     .Floating Point Value
 
**[32] tBodyGyroJerk.std.Z**<br/>
     .Floating Point Value
 
**[33] tBodyAccMag.mean**<br/>
     .Floating Point Value
 
**[34] tBodyAccMag.std**<br/>
     .Floating Point Value
 
**[35] tGravityAccMag.mean**<br/>
     .Floating Point Value
 
**[36] tGravityAccMag.std**<br/>
     .Floating Point Value
 
**[37] tBodyAccJerkMag.mean**<br/>
     .Floating Point Value
 
**[38] tBodyAccJerkMag.std**<br/>
     .Floating Point Value
 
**[39] tBodyGyroMag.mean**<br/>
     .Floating Point Value
 
**[40] tBodyGyroMag.std**<br/>
     .Floating Point Value
 
**[41] tBodyGyroJerkMag.mean**<br/>
     .Floating Point Value
 
**[42] tBodyGyroJerkMag.std**<br/>
     .Floating Point Value
 
**[43] fBodyAcc.mean.X**<br/>
     .Floating Point Value
 
**[44] fBodyAcc.mean.Y**<br/>
     .Floating Point Value
 
**[45] fBodyAcc.mean.Z**<br/>
     .Floating Point Value
 
**[46] fBodyAcc.std.X**<br/>
     .Floating Point Value
 
**[47] fBodyAcc.std.Y**<br/>
     .Floating Point Value
 
**[48] fBodyAcc.std.Z**<br/>
     .Floating Point Value
 
**[49] fBodyAccJerk.mean.X**<br/>
     .Floating Point Value
 
**[50] fBodyAccJerk.mean.Y**<br/>
     .Floating Point Value
 
**[51] fBodyAccJerk.mean.Z**<br/>
     .Floating Point Value
 
**[52] fBodyAccJerk.std.X**<br/>
     .Floating Point Value
 
**[53] fBodyAccJerk.std.Y**<br/>
     .Floating Point Value
 
**[54] fBodyAccJerk.std.Z**<br/>
     .Floating Point Value
 
**[55] fBodyGyro.mean.X**<br/>
     .Floating Point Value
 
**[56] fBodyGyro.mean.Y**<br/>
     .Floating Point Value
 
**[57] fBodyGyro.mean.Z**<br/>
     .Floating Point Value
 
**[58] fBodyGyro.std.X**<br/>
     .Floating Point Value
 
**[59] fBodyGyro.std.Y**<br/>
     .Floating Point Value
 
**[60] fBodyGyro.std.Z**<br/>
     .Floating Point Value
 
**[61] fBodyAccMag.mean**<br/>
     .Floating Point Value
 
**[62] fBodyAccMag.std**<br/>
     .Floating Point Value
 
**[63] fBodyBodyAccJerkMag.mean**<br/>
     .Floating Point Value
 
**[64] fBodyBodyAccJerkMag.std**<br/>
     .Floating Point Value
 
**[65] fBodyBodyGyroMag.mean**<br/>
     .Floating Point Value
 
**[66] fBodyBodyGyroMag.std**<br/>
     .Floating Point Value
 
**[67] fBodyBodyGyroJerkMag.mean**<br/>
     .Floating Point Value
 
**[68] fBodyBodyGyroJerkMag.std**<br/>
     .Floating Point Value