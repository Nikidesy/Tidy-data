# Code Book

## Raw data
The raw data used for the course project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Following is a summary of this full discription:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

All the variables were normalised so they have no measurement units.

## Processing the data

The raw data was processed with the run_analysis.R script in order to get to the tidy dataset. For this several processing steps were taken:
1. Preprocessing: 
* Reading in the file with the features (features.txt) which corresponds to the column names (variable names)
* Reading in the test data (X_test.txt) and the corresponding subjects dataset (subject_test.txt) and activity dataset (Y_test.txt) 
* Reading in the train data (X_train.txt) and the corresponding subjects dataset (subject_train.txt) and activity dataset (Y_train.txt)
* For the test data as well as the train data: attach subject and actvity information to dataset with other variables, use features dataset to attach the column names

2. Merge train and test data to form a single dataset

3.Extract only the measurements on the mean and standard deviation for each measurement: select only those columns that have "-mean()" and "-std()" in their name

4. Uses descriptive activity names to name the activities in the data set: Every activity ID is changed into the corresponding label
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

5. Appropriately labels the data set with descriptive variable names: this step was already done in step 1
 
6. Create a tidy data set with the average of each variable for each activity and each subject:
From the intermediate dataset obtained by the previous steps, a new tidy set was created with the following characteristics:
* The tidy data set contains 180 observations with 81 variables
* The Subject_ID variable is an identifier for the test subject, this variable ranges from 1 to 30
* The Activity variable describes the activity the test subjects were doing during the measurment: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* The other 79 variables are normalized time and frequency domain signal variables. The following table gives an overview of the parts that make up the variable names and their description.

| Code          | Are           |
| ------------- |:-------------:|
| col 3 is      | right-aligned |
| col 2 is      | centered      |
| zebra stripes | are neat      |

| Codes
| -------------   |:-------------:|
| BodyAcc         |
| GravityAcc      |
| BodyAccJerk     |
| BodyGyro        |
| BodyGyroJerk    | 
| BodyAccMag      |
| GravityAccMag   |
| BodyAccJerkMag  |
| BodyGyroMag     | 
BodyGyroJerkMag



 

 



