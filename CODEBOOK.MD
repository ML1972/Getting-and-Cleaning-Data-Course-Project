# CODE BOOK

This document describes any variables, data, and any transformations or work performed to clean up the data in the the R script **run_analysis.R**.

## PACKAGES
*plyr*

## VARIABLE DEFINITION
The variable definition are listed in order of appearance.

#### mypath
Is the path of the work directory

#### Datadir
Name of the directory where the raw data is stored ("SamsungData")

#### set_zipfname
Defintion of the zip file name to be downloaded from URL ("SGS_Data.zip")

#### DataZip
Full zip file name including the **mypath**, **Datadir** and **set_zipfnmae**

#### fileUrl
The data URL is stored in this variable

#### destfile
Destination file = **DataZip**

#### UCI_dir
UCI HAR Dataset directory

#### test_dir
Directory of the TEST data set and files

#### train_dir
Directory of the TRAIN data set and files

#### Feature_fname
Filename of file *features.txt* including the path where to find mentioned file

#### ActivityLabels_fname
Filename of file *activity_labels.txt* including the path where to find mentioned file

#### TestSubject_fname
Filename of file *subject_test.txt* including the path where to find mentioned file

#### TestX_fname
Filename of file *X_test.txt* including the path where to find mentioned file

#### TestY_fname
Filename of file *y_test.txt* including the path where to find mentioned file

#### TrainSubject_fname
Filename of file *subject_train.txt* including the path where to find mentioned file

#### TrainX_fname
Filename of file *X_train.txt* including the path where to find mentioned file

#### TrainY_fname
Filename of file *y_train.txt* including the path where to find mentioned file

#### TestSubject_data
Table where data from **TestSubject_fname** is stored

#### TestX_data
Table where data from **TestX_fname** is stored

#### TestY_data
Table where data from **TestY_fname** is stored

#### TrainSubject_data
Table where data from **TrainSubject_fname** is stored

#### TrainX_data
Table where data from **TrainX_fname** is stored

#### TrainY_data
Table where data from **TrainY_fname** is stored

#### Train_data
Merged data set of the raw *TRAIN* data **TrainX_data**, **TrainY_data** and **TrainSubject_data** 

#### Test_data
Merged data set of the raw *TEST* data **TestX_data**, **TestY_data** and **TestSubject_data**

#### Joint_data
Merged raw data built up with **Train data** and **Test data**

#### Feature_data
Table where data from **Feature_fname** is stored

#### Data_Labels
Vector where data labels are stored

#### Reduced_Labels
Vector where only the labels of interest are stored

#### Reduced_Data
Table where only the variables of interes are stored

#### ActivityLabels_data
Table where data from **ActivityLabels_fname** is stored

#### coi
Column of interest

#### lastcoi
Last column of interest

#### firstcoi
First column of interest

#### groupmean
Table where the average of each variable is stored sorted first by activity and then by subject

#### Resultdir
Directory where output file is stored

#### output_fname
Output filename (Mean_Data_Set.txt) where **groupmean** is stored

## FUNCTION
Function *function(x) colMeans(x[, firstcoi:lastcoi])* calculates the average value of each column of range of interest

