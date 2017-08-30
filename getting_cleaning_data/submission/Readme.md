## This repository contains script which derives data from "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" and does some manipulation on the same

Script data_manipulator.R reads data and the joins multiple part of complete data set and the groups together multiple parts of them.
In the end it creates independent tidy data set with the average of each variable for each activity and each subject.

### Steps followed are as below:
1. Reading test and train features
2. Vertical joining the features
3. Finding the columns with names containing means or std
4. Vertical joining the labels
5. Combining features and labels
6. Replaced all the activity index with meaningful names
7. Read and created a new df for subjects
8. grouped as per subjects and activity
9. Created mean of all variables in df

`features_info.txt` file is a modified version of what is available on the link posted above and defines what data is produced after doing manipulation on the data. 

features.txt has the names of featured which get created after manipulation by data_manipulator.R
avtivity_lables.txt has names of activities which were recorded for experimentation

