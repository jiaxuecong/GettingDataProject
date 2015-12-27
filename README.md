## Getting and Cleaning Data Project
This is the project for Getting and Cleaning Data Class.

### Data Source
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Here are the data for the project.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Step 1. Merges the training and the test sets to create one data set.
Merge two data sets `X_test.txt` and `X_train.txt` into one table `data`. 
Assign column names using `features.txt`.

### Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Create a vector that contains index for those mean and standard deviation columns.
Subset `data` to keep only the necessary columns.

### Step 3. Use descriptive activity names to name the activities in the data set
Add two more columns that have activity and subject information. Name them as `act_label` and `subject`.
Subsitute `act_label` to `activity` which contains the descriptive activity names.

### Step 4. Appropriately label the data set with descriptive activity names.
Use sub function for pattern replacement to clean up the data labels.

### Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Group data from step 4 by `subject` and `activity`. Calculate average value of each variable and write the output to `tidy.txt`.
