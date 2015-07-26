# Script as part of Course Project of Getting and cleaning data on Coursera 

### Step 0:Preprocessing, read in and prepare data ###

## read in data
# Assuming the course project data is in subfolder named UCI HAR Dataset of working directory

# read feature data
Var_names <- read.csv("./UCI HAR Dataset/features.txt", as.is = TRUE, header =F, sep= " ")
 #transpose Var_names to vector
 Varnames <- t(Var_names$V2)

# read test data
Subject_test <- read.csv("./UCI HAR Dataset/test/subject_test.txt", as.is = TRUE, header =F)
Data_test <- read.csv("./UCI HAR Dataset/test/X_test.txt", as.is = TRUE, header =F, sep= "")
Activity_test <- read.csv("./UCI HAR Dataset/test/Y_test.txt", as.is = TRUE, header =F)

#Rename columns test data
Subject_test <- rename(Subject_test, Subject_ID = V1)
Activity_test <- rename(Activity_test, Activity = V1)
colnames(Data_test) <- Varnames

#Merge all test data with cbind
df_Test <- cbind(Subject_test, Activity_test, Data_test) 

#read training data
Subject_train <- read.csv("./UCI HAR Dataset/train/subject_train.txt", as.is = TRUE, header =F)
Data_train <- read.csv("./UCI HAR Dataset/train/X_train.txt", as.is = TRUE, header =F, sep= "")
Activity_train <- read.csv("./UCI HAR Dataset/train/Y_train.txt", as.is = TRUE, header =F)

#Rename columns training data
Subject_train <- rename(Subject_train, Subject_ID = V1)
Activity_train <- rename(Activity_train, Activity = V1)
colnames(Data_train) <- Varnames

#Merge all training data with cbind
df_Train <- cbind(Subject_train, Activity_train, Data_train)

### step 1: merge the 2 datasets ###

All_data <- rbind(df_Test, df_Train)

### step 2: Extract only the measurements on the mean ("-mean()") and standard deviation ("-std()") for each measurement ###
df_meanstd <- All_data[,c(1,2,grep("-mean()", names(All_data), fixed=T),grep("-std()", names(All_data), fixed=T))]

### step 3: Use descriptive activity names to name the activities in the data set ###
df_meanstd$Activity <- as.character(df_meanstd$Activity)

df_meanstd$Activity[df_meanstd$Activity == "1"] <- "Walking"
df_meanstd$Activity[df_meanstd$Activity == "2"] <- "Walking_Upstairs"
df_meanstd$Activity[df_meanstd$Activity == "3"] <- "Walking_Downstairs"
df_meanstd$Activity[df_meanstd$Activity == "4"] <- "Sitting"
df_meanstd$Activity[df_meanstd$Activity == "5"] <- "Standing"
df_meanstd$Activity[df_meanstd$Activity == "6"] <- "Laying"

### step 4: Appropriately label the data set with descriptive variable names.###
#already done in step 0

### step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.###
# group df by Subject and Activity
df_Sub_Act <- group_by(df_meanstd, Subject_ID, Activity)
# make df that averges each variable per subject & activity
Averages_Sub_Act <- summarise_each(df_Sub_Act, funs(mean))

#write file to text
write.table(Averages_Sub_Act,"Samsung_Av_Subj_Act.txt", row.names=FALSE)

