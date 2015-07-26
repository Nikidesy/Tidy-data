# Tidy-data
Getting and cleaning data on Coursera, course project

## Introduction Course project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
You will be required to submit: 

1. a tidy data set as described below, 

2. a link to a Github repository with your script for performing the analysis

3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Content of repository
* README.md: current file, explains background, content of repositury and how to run the script
* Codebook.md: describes final tidy dataset, the raw data and the processing steps
* run_analysis.R: R script to go from raw data to tidy data

## How to run run_analysis.R
Required library: dplyr
1. Set your home directory with setwd() command.
2. Download the [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip raw data], unzip it and make sure the data is in a subfolder, named "UCI HAR Dataset", of the working directory.
3. Run run_analaysis.R script
4. The resulting tidy dataset named Samsung_Av_Subj_Act.csv can be found in your working directory.
