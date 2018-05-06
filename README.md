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
4. Different directories and filenames are defined.

### Step 1: Merging data sets

1. The different *TEST* data (Subject, X-data, Y-data) are readed from the corresponding directory.
2. The different *TRAIN* data (Subject, X-data, Y-data) are readed from the corresponding directory.
3. All data readed in point 1 and point 2 are merged to one data set (hereinafter known as *Joint_data*).
4. All unnecessary variables are removed from the environment.

### Step 2: Extracting only measurements on the mean and standard deviation for each measurement

1. The *feature* file is readed and the data labels for the *Joint_data* are set.
2. A subsetted data set is generated (hereinafter known as *Reduced_Data*) from *Joint_data*. This new data set *Reduced_Data* includes only data which includes mean and standard deviation values, as well as the activities and subjects.
3. All unnecessary variables are removed from the environment.

### Step 3: Name activities in data set with help of descriptive activity names

1. The activity label data is readed.
2. The column where the activity data is stored in *Reduced_Data* is set (hereinafter known as *coi*).
3. The activity values in the column *coi* of *Reduced_Data* are replaced with the definition stored in the activity label data.
4. All unnecessary variables are removed from the environment.

### Step 4: Replace data set labels with appropiate descriptive variable names
Since the column names in *Reduced_Data* are not easy to read, following suggested *Renaming rules* ro better understanding the column data are applied to the column names, i.e. a column name is renamed according to the *Renaming rules* if the column name fulfils one ore more *Renaming rules*.

* *Renaming rules:* 
  + 't' will be replaced by 'Time '
  + 'f' will be replaced by 'Frequency '
  + 'Acc' will be replaced by ' Acceleration ' 
  + 'Gyro' will be replaced by ' Angular velocity '
  + 'Mag' will be replaced by ' Magnitude '
  + ' -' will be replaced by '-'
  + 'BodyBody' will be replaced by 'Body'
  + '()' will be removed
  + Double spaces will be replaced by simple space

*Example:
'fBodyBodyGyroJerkMag-mean()' will be 'Frequency Body Angular velocity Jerk Magnitude-mean'*

### Step 5: Creation of tidy data set with average of each variable for each activity and each subject
In the last step of the source code the average value for each activity and each subject is calculated. Since *Reduced_data* includes as alos the activity and the subject values as forelast and last column respectively and has to be exluded from the column average calculation the first column (*firstcoi*) and last column (*lastcoi*) of the range of interest for the calculation will be defined.

1. *firstcoi* and *lastcoi* of the range of interest are set.
2. The average value for each activity and each subject is calculated.
3. A *Result* directory is created and the output file *Mean_Data_Set.dat* will be saved in there.
4. All unnecessary variables are removed from the environment.

After executing **run_analysis.R** only *Reduced_Data* and the variable *mypath* (see CODEBOOK.MD) are stored in the environment
