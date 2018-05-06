# GETTING AND CLEANING DATA COURSE - FINAL PROJECT

## PRELIMINARY REMARKS
The R script **run_analysis.R** downloads project data from

*https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip*

and subsequently unzips it. The unzipped project data includes raw data sets with corresponding description files (like meaning of variables, folder structure, ...). Afterwards the different raw data sets of interest will be merged and subsetted the avererage value for each column of interest will be calculated.

The source code is structured in following steps

* Preliminary settings
* Step 1: Merging data sets
* Step 2: Extracting only measurements on the mean and standard deviation for each measurement
* Step 3: Name activities in data set with help of descriptive activity names
* Step 4: Replace data set labels with appropiate descriptive variable names
* Step 5: Creation of tidy data set with average of each variable for each activity and each subject

At the beginning of **run_analysis.R** a short description of goals is given

## SOURCE CODE STRUCTURE

In the following chapters a short description of the source code will be given, to give an overview what will be done in each step. The variables used are defined in described in the code book *CODEBOOK.MD*. 

### Preliminary settings
First of all necessary packages for this source code will be loaded and any existing objects will be removed from the environment.

### Step 1: Merging data sets

### Step 2: Extracting only measurements on the mean and standard deviation for each measurement

### Step 3: Name activities in data set with help of descriptive activity names

### Step 4: Replace data set labels with appropiate descriptive variable names

### Step 5: Creation of tidy data set with average of each variable for each activity and each subject
