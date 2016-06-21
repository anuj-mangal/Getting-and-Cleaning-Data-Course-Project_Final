#Import the reshape package

library(reshape2)

# Clear out the existing variables
rm(list=ls())

#Downloading the file and prep for load into R

if(!dir.exists("UCI HAR Dataset")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "project_data")
  unzip("project_data")
}

#Reading the datasets

train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
head(train_data)  # Validation
nrow(train_data)
test_data <-  read.table("UCI HAR Dataset/test/X_test.txt")
head(test_data)   #Validation
nrow(test_data)
feature_names <- read.table("UCI HAR Dataset/features.txt") 
print(feature_names)   #Validation
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt") 
print(activity_labels)   #Validation
test_subject_names  <-  read.table("UCI HAR Dataset/test/subject_test.txt")
print(test_subject_names)   #Validation
train_subject_names  <- read.table("UCI HAR Dataset/train/subject_train.txt")
print(train_subject_names)   #Validation
test_activity_names <-  read.table("UCI HAR Dataset/test/y_test.txt")
print(test_activity_names)   #Validation
train_activity_names <- read.table("UCI HAR Dataset/train/y_train.txt")
print(train_activity_names)   #Validation

#Merging the train and test datasets
complete_data <- rbind(train_data,test_data)
head(complete_data)  # Validation
nrow(complete_data)   #Number of rows in train data + number of rows in test data

#Merging the Activity Data sets for train and test
complete_activity_data <- rbind(train_activity_names,test_activity_names)
head(complete_activity_data)    #Validation
nrow(complete_activity_data)

#Merging the subject data sets for train and test
complete_subject_data <- rbind(train_subject_names,test_subject_names)
head(complete_subject_data)    #Validation
nrow(complete_subject_data)

#Assigning variable names to the complete data from the feature names
names(complete_data) <- feature_names[,2]
names(complete_activity_data) <- "activity_id"
names(complete_subject_data) <- "subject_id"
names(activity_labels)  <-c("activity_id", "activity_name")


# Extracting the indices of mean and sd features
valid_indices_mean <- grep('[Mm]ean.*\\(\\)', feature_names[,2], ignore.case = T)
valid_indices_std <-  grep("[Ss]td.*\\(\\)", feature_names[,2], ignore.case = T)
valid_indices <- c(valid_indices_mean,valid_indices_std)


#Extracting only the mean and sd realted columns
complete_data <- complete_data[,valid_indices]

#Adding activity and subject details to the complete set of data
complete_data <- cbind(complete_activity_data , complete_subject_data, complete_data)
head(complete_data,3)     #Validation
tail(complete_data, 3)
nrow(complete_data)


#Merging Activity ids and names for the complete set of i.e. training and test data combined
complete_data <- merge(activity_labels, complete_data, by.x = "activity_id" , by.y = "activity_id" )

#Using the descriptive names of the variables in the complete data set 

names(complete_data) <- gsub("\\(\\)","", names(complete_data))
names(complete_data) <- gsub("-X$", "_arnd_x-axis",names(complete_data))
names(complete_data) <- gsub("-Y$", "_arnd_y-axis",names(complete_data))
names(complete_data) <- gsub("-Z$", "_arnd_z-axis",names(complete_data))
names(complete_data) <- gsub("^t", "time_domain_", names(complete_data))
names(complete_data) <- gsub("^f", "freq_domain_", names(complete_data))
names(complete_data) <- gsub("std", "stndrd_devtn", names(complete_data))
names(complete_data) <- gsub("[Mm]ag", "_magnitude", names(complete_data))

#Validate the new names of the variables
names(complete_data)

#Calculation of means of the mean and standard deviation fields by activity and subject

data_melt <- melt(complete_data, id.vars = c("activity_id","activity_name", "subject_id"))
final_data <- dcast(data_melt, activity_id + activity_name + subject_id ~ variable , mean)

#Writing the final data onto a text file
write.table(final_data,"tidy_data.txt" , row.names = FALSE )

