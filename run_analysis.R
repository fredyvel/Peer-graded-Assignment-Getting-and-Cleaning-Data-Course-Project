library(dplyr)

filename <- "Coursera_DS3_Final.zip"
# check if file exists
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# check if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}
# load al data into data table
dat_features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
dat_activities <-read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
dat_subtest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
dat_xtest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = dat_features$functions)
dat_ytest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
dat_subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
dat_xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = dat_features$functions)
dat_ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merges the training and the test sets to create one data set.

X_Data <- rbind(dat_xtrain, dat_xtest)
Y_Data <- rbind(dat_ytrain, dat_ytest)
subject <- rbind(dat_subtrain, dat_subtest)
full_data <- cbind(subject, Y_Data, X_Data)

# Extracts only the measurements on the mean and standard deviation for each measurement.
selected_col<-select(full_data,subject,code,contains("mean"),contains("std"))

# Uses descriptive activity names to name the activities in the data set
full_data$code<-dat_activities[full_data$code, 2]
names(full_data)[2]<-"activity"  

#Step 4: Appropriately labels the data set with descriptive variable names.
names(full_data)<-gsub("Acc", "Accelerometer", names(full_data))
names(full_data)<-gsub("Gyro", "Gyroscope", names(full_data))
names(full_data)<-gsub("Mag", "Magnitude", names(full_data))
names(full_data)<-gsub("-freq()", "Frequency", names(full_data), ignore.case = TRUE)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

AnalizeData<-group_by(full_data,subject, activity) %>%summarise_all(funs(mean))

write.table(AnalizeData, "AnalizeData.txt", row.name=FALSE)

