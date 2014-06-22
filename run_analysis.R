# R script for Course Project - Getting and Cleaning Data
# Last modified 2014-06-21
# Created by Ulf Rosén

# Uses Package reshape2
library(reshape2)

# Load files used by both training and test data
# Load Names of measurements
features <- read.csv("./Data/features.txt", sep="", header=FALSE)
names(features) <- c("id", "measureName")
# Load Activity labels
activity <- read.csv("./Data/activity_labels.txt", sep="", header=FALSE)
names(activity) <- c("activityId", "LabelActivity")

# Load test data
x_test <- read.csv("./Data/test/X_test.txt", sep="", header=FALSE)
y_test <- read.csv("./Data/test/y_test.txt", sep="", header=FALSE)
subject_test <- read.csv("./Data/test/subject_test.txt", sep="", header=FALSE)

# Load training data
x_train <- read.csv("./Data/train/X_train.txt", sep="", header=FALSE)
y_train <- read.csv("./Data/train/y_train.txt", sep="", header=FALSE)
subject_train <- read.csv("./Data/train/subject_train.txt", sep="", header=FALSE)

# Concatenate test and training data sets
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

# Add column names
names(x_all) <- features$measureName
names(y_all) <- "activityId"
names(subject_all) <- "subjectId"


# Remove measures not related to mean or standard deviation
# also excluding MeanFrequency
x_all_meanstd <- x_all[,grepl('mean\\(|std',names(x_all))]

# Add columns for activity id and subject id
x_all_meanstd$activityId <- y_all$activityId
x_all_meanstd$subjectId <- subject_all$subjectId


#Merge with Activity Labels to get descriptive label
x_all_complete <- merge(activity,x_all_meanstd)
# Remove ActivityId
x_all_complete <- x_all_complete[,!(colnames(x_all_complete) %in% "activityId")]


# Second part - new tidy data set

myMelt <- melt(x_all_complete, id.vars=c("LabelActivity","subjectId"))
tidyDF <- dcast(myMelt, LabelActivity + subjectId ~ variable,mean)

# Export tidy data frame
write.csv(tidyDF,file="tidyDF.csv", row.names=FALSE)

