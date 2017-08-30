### This repository contains script which derives data from "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" and does some manipulation on the same

Script data_manipulator.R reads data and the joins multiple part of complete data set and the groups together multiple parts of them.
In the end it creates independent tidy data set with the average of each variable for each activity and each subject.

features_info.txt file is a modified version of what is available on the link posted above and defines what data you will get after doing manipulation on the data. 

features.txt has the names of featured which get created after manipulation by data_manipulator.R
avtivity_lables.txt has names of activities which were recorded for experimentation

