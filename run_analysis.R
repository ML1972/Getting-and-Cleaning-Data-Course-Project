#######################
# GENERAL INFORMATION #
#######################

# Getting and Cleaning Data Course Project
# Developed by: Mario Lechner
# File: run_analysis.R

###############################################################################
# Purpose of Course project:
# Demonstration of ability to collect, work with, and clean a data set.
# The goal is to prepare tidy data that can be used for later analysis.
# Graduation by peers on a series of yes/no questions related to the project.
# What to submit:
# 1) a tidy data set as described below
# 2) a link to a Github repository with your script for performing the analysis
# 3) a code book that describes the variables, the data, and any transformations
#    or work that was performed to clean up the data called CodeBook.md.
#    A README.md in the repo with scripts should also be included. 
# This repo explains how all of the scripts work and how they are connected.

# Task:
# One of the most exciting areas in all of data science right now is wearable
# computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop
# the most advanced algorithms to attract new users. The data linked to from
# the course website represent data collected from the accelerometers from the
# Samsung Galaxy S smartphone. A full description is available at the site
# where the data was obtained:
#     
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# Here are the data for the project:
#     
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# Create one R script called run_analysis.R that does the following.
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for
#    each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
###############################################################################

###############
# SOURCE CODE #
###############

# PRELIMINARY SETTINGS #
########################

# Set packages to use
library(plyr)

# Remove all existing variables in environment
rm(list = ls())

# Define paths
mypath<-getwd()
Datadir<-"SamsungData" # Define data directory
if(!file.exists(Datadir))
{
     dir.create(Datadir)
}
set_zipfname<-"SGS_Data.zip" # Define zip filename
DataZip<-paste(mypath,Datadir,set_zipfname,sep="/")

# Download zip file
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile<-DataZip # Destination of downloaded file
download.file(fileUrl, destfile) # download file
unzip(zipfile=destfile,exdir=paste(mypath,Datadir,sep="/")) # Unzip Zip file

# Set directories
UCI_dir<-paste(paste(mypath,Datadir,sep="/"),"UCI HAR Dataset",sep="/") # UCI HAR Dataset directory
test_dir<-paste(UCI_dir,"test",sep="/") # test directory
train_dir<-paste(UCI_dir,"train",sep="/") # train directory

# Set file names with its path
Feature_fname<-paste(UCI_dir,"features.txt",sep="/")
ActivityLabels_fname<-paste(UCI_dir,"activity_labels.txt",sep="/")
TestSubject_fname<-paste(test_dir,"subject_test.txt",sep="/")
TestX_fname<-paste(test_dir,"X_test.txt",sep="/")
TestY_fname<-paste(test_dir,"y_test.txt",sep="/")
TrainSubject_fname<-paste(train_dir,"subject_train.txt",sep="/")
TrainX_fname<-paste(train_dir,"X_train.txt",sep="/")
TrainY_fname<-paste(train_dir,"y_train.txt",sep="/")


# STEP 1: MERGING DATA SETS #
#############################

# Read test data
TestSubject_data<-read.table(TestSubject_fname)
TestX_data<-read.table(TestX_fname)
TestY_data<-read.table(TestY_fname)

# Read train data
TrainSubject_data<-read.table(TrainSubject_fname)
TrainX_data<-read.table(TrainX_fname)
TrainY_data<-read.table(TrainY_fname)

# Merging data sets
Train_data<-cbind(TrainX_data,TrainY_data, TrainSubject_data) # Train data set
Test_data<-cbind(TestX_data,TestY_data, TestSubject_data) # Test data set

Joint_data<-rbind(Train_data,Test_data) # Merged Train data set and Test data set into one data set (Joint_data)

# Remove all data in the environment which is not any more of use from now on
rm(fileUrl, UCI_dir, train_dir, test_dir, Datadir, DataZip, set_zipfname, destfile)
rm(Test_data, TestX_data, TestY_data, TestSubject_data, TestX_fname, TestY_fname, TestSubject_fname)
rm(Train_data, TrainX_data, TrainY_data, TrainSubject_data, TrainX_fname, TrainY_fname, TrainSubject_fname)


# STEP 2: EXTRACTING ONLY MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT #
################################################################################################

# Read feature file
Feature_data<-read.table(Feature_fname)
Feature_data[,2]<-as.character(Feature_data[,2]) # Convert second columns values from factor to character
Data_Labels<-c(Feature_data$V2,"Activity","Subject") # Define data labels
colnames(Joint_data)<-Data_Labels # Set data labels of the joint data set

# Get only data including mean and standard deviation
Reduced_Labels<-grep("*-mean\\(\\)*|*-std\\(\\)*|Activity|Subject",Data_Labels) # Define labels of interest
Reduced_Data<-Joint_data[,Reduced_Labels] # Set data set where only records appear with the different mean() and std() values, as well as the activity and subject values appear

# Remove all data in the environment which is not any more of use from now on
rm(Feature_fname, Feature_data)
rm(Joint_data, Reduced_Labels, Data_Labels)


# STEP 3: NAME ACTIVITIES IN DATA SET WITH HELP OF DESCRIPTIVE ACTIVITY NAMES #
###############################################################################

# Read activity label file
ActivityLabels_data<-read.table(ActivityLabels_fname)

# Find activity column in Reduced_Data
coi<-grep("Activity", colnames(Reduced_Data)) # Set column of interest (coi)

# Name activities in Reduced_Data with descriptive activity names
Reduced_Data[,coi]<-ActivityLabels_data[Reduced_Data[,coi],2]

# Remove all data in the environment which is not any more of use from now on
rm(ActivityLabels_fname, ActivityLabels_data)
rm(coi)


# STEP 4: REPLACE DATA SET LABELS WITH APPROPRIATE DESCRIPTIVE VARIABLE NAMES #
###############################################################################

# Renaming rules:
# t => Time
# f => Frequency
# Acc => Acceleration
# Gyro => Angular velocity
# Mag => Magnitude
# () will be removed
# Double spaces will be replaced by simple space
# ' -' => '-'
# 'BodyBody' => 'Body'

colnames(Reduced_Data)<-gsub("\\(|\\)","",colnames(Reduced_Data)) # Remove ()
colnames(Reduced_Data)<-gsub("^t","Time ",colnames(Reduced_Data)) # Replace 't' with 'Time '
colnames(Reduced_Data)<-gsub("^f","Frequency ",colnames(Reduced_Data)) # Replace 'f' with 'Frequency '
colnames(Reduced_Data)<-gsub("Acc"," Acceleration ",colnames(Reduced_Data)) # Replace 'Acc' with ' Acceleration '
colnames(Reduced_Data)<-gsub("Gyro"," Angular velocity ",colnames(Reduced_Data)) # Replace 'Gyro' with ' Angluar velocity ' 
colnames(Reduced_Data)<-gsub("Mag"," Magnitude ",colnames(Reduced_Data)) # Replace 'Mag' with ' Magnitude '
colnames(Reduced_Data)<-gsub("BodyBody","Body",colnames(Reduced_Data)) # Replace 'BodyBody' with 'Body'
colnames(Reduced_Data)<-gsub(" -","-",colnames(Reduced_Data)) # Replace ' -' with '-'
colnames(Reduced_Data)<-gsub("  "," ",colnames(Reduced_Data)) # Replace double space with simple space


# STEP 5: CREATION OF TIDY DATA SET WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT #
######################################################################################################

# Find activity column in Reduced_Data (since activity column was the first column added after the feature table)
coi<-grep("Activity", colnames(Reduced_Data)) # Set column of interest (coi)
lastcoi<-coi-1 # last column of interest to be analysed
firstcoi<-1 # first column of interest to be analysed

# Calculation of mean value for each activity and each subject (grouped first by activity and then by subject)
groupmean<-ddply(Reduced_Data,.(Activity, Subject), function(x) colMeans(x[, firstcoi:lastcoi]))

# Define Result directory and output file
Resultdir<-"Result"
if(!file.exists(Resultdir))
{
     dir.create(Resultdir)
}

output_fname<-"Mean_Data_Set.dat"
destfile<-paste(mypath,Resultdir,output_fname,sep="/")

write.table(groupmean,file = destfile,row.names = FALSE)

# Remove all data in the environment which is not any more of use from now on
rm(coi, firstcoi,lastcoi)
rm(Resultdir, output_fname, destfile, mypath)
