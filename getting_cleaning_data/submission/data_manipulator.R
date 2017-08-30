## Creating all the variables for file locations
file_test <- "~/Documents/datasciencecoursera/git/getting_cleaning_data/UCI HAR Dataset 2/test/X_test.txt"
file_train <- "~/Documents/datasciencecoursera/git/getting_cleaning_data/UCI HAR Dataset 2/train/X_train.txt"
file_featurname_names <- "~/Documents/datasciencecoursera/git/getting_cleaning_data/UCI HAR Dataset 2/features.txt"
file_y_test <- "~/Documents/datasciencecoursera/git/getting_cleaning_data/UCI HAR Dataset 2/test/Y_test.txt"
file_y_train <- "~/Documents/datasciencecoursera/git/getting_cleaning_data/UCI HAR Dataset 2/train/Y_train.txt"
file_subject_test  <- "~/Documents/datasciencecoursera/git/getting_cleaning_data/UCI HAR Dataset 2/test/subject_test.txt"
file_subject_train <- "~/Documents/datasciencecoursera/git/getting_cleaning_data/UCI HAR Dataset 2/train/subject_train.txt"

#reading test and train features
features_test <- read.table(file_test, sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
features_train <- read.table(file_train, sep = "" , header = F ,na.strings ="", stringsAsFactors= F)

#vertical combining the data using rbind
features <- rbind(features_train, features_test)

#names of features read from features file
feature_names <- read.table(file_feature_names, sep = "", header = F,na.strings ="", stringsAsFactors= F)

#giving apt name to the feature_names in features set
names(feature_names) <- c("id","feature_name")
names(features) <- feature_names$feature_name

#creating of the vector of column numbers which will have names as mean or std and selecting those columns
mean_std_columns <- grep("mean|std", feature_names$feature_name)
features_mean_std <- features[,mean_std_columns]

#creating final data_set
data_set <- features_mean_std

#readig labels from test and train and vertically joining them
labels_test <- read.table(file_y_test, sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
labels_train <- read.table(file_y_train, sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
labels <- rbind(labels_train, labels_test)
names(labels) <- c("activity")

#adding column of activity to the final dataset having features
data_set$activity <- labels$activity

#giving names to activities
data_set$activity <- sub("1","walking",data_set$activity)
data_set$activity <- sub("2","walking_upstaird",data_set$activity)
data_set$activity <- sub("3","walking_downstairs",data_set$activity)
data_set$activity <- sub("4","sitting",data_set$activity)
data_set$activity <- sub("5","standing",data_set$activity)
data_set$activity <- sub("6","laying",data_set$activity)

#reading subjects and vertically joining them
subject_test <- read.table(file_subject_test, sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
subject_train <- read.table(file_subject_train, sep = "" , header = F ,na.strings ="", stringsAsFactors= F)
subject <- rbind(subject_train, subject_test)
names(subject) <- c("subject")

#adding subjects as a column in data_set
data_set$subject <- subject$subject

#grouping the dataset together as per activity and subject
data_set_2 <- data_set %>% group_by(activity, subject) 

#creating a new dataset with mean of all the columns
data_set_2 <- summarise_each(data_set_2, funs(mean))
