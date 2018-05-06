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

1. All necessary packages for this source code will be loaded and any existing objects will be removed from the environment.
2. The directory, where the zipped data should be loaded, is defined ("SamsungData") and if necessary is created.
3. The data from given URL(see above) will be downloaded and unzipped into the directory mentiond in point 2.
4. Different directories and filenames are defined

### Step 1: Merging data sets

1. The different *TEST* data (Subject, X-data, Y-data) are readed from the corresponding directory
2. The different *TRAIN* data (Subject, X-data, Y-data) are readed from the corresponding directory
3. All data readed in point 1 and point 2 are merged to one data set (hereinafter known as *Joint_data*)
4. All unnecessary variables are removed from the environment.

### Step 2: Extracting only measurements on the mean and standard deviation for each measurement

1. The *feature* file is readed and the data labels for the *Joint_data* are set.
2. A subsetted data set is generated (hereinafter known as *Reduced_Data*) from *Joint_data*. This new data set *Reduced_Data* includes only variables which includes mean and standard deviation values, as well as the activities and subjects
3. All unnecessary variables are removed from the environment.

### Step 3: Name activities in data set with help of descriptive activity names

### Step 4: Replace data set labels with appropiate descriptive variable names

### Step 5: Creation of tidy data set with average of each variable for each activity and each subject
