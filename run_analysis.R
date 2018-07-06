library(dplyr)
library(tidyr)

#-----------------------------------------------------------------------------#
# If the source dataset doesn't alreayd exist in the project's root
# directory, download it.
if(!file.exists("dataset.zip")) {
    print("Downloading dataset")
     download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                   "dataset.zip")
}

# Unzipping the dateset will create the UCI HAR Dataset folder in the project
# root directory.
if(!dir.exists("UCI HAR Dataset")) {
    print("Unzipping dataset")
    unzip("dataset.zip")
}

# Read in activites and features from root data folder.
activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                         as.is = TRUE)
features <- read.table("UCI HAR Dataset/features.txt", 
                       col.names = c("num", "name"),  as.is = TRUE)
# remove "()" from feature names
features$name <- sub("\\(\\)", "", features$name) 
#-----------------------------------------------------------------------------#

#-----------------------------------------------------------------------------#
# Read in test datasets
# read.table will replace non-alpha numeric characters in the column names 
# with periods (".")

# **Requirement 4** Appropriate labels for the data set with descriptive 
#                   variable names
test.x <- read.table("UCI HAR Dataset/test/X_test.txt", 
                     col.names = features$name) 
test.y <- read.table("UCI HAR Dataset/test/y_test.txt", 
                     col.names = "activity", as.is = TRUE)
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                            col.names = "subject", as.is = TRUE)
# **Requirement 2**  Extract only the measurements on the mean and the 
#                    standard deviation for each measurement
test.x <- test.x[, grep("mean\\.|mean$|std", names(test.x))]
#-----------------------------------------------------------------------------#


#-----------------------------------------------------------------------------#
# Read in train datasets
# read.table will replace non-alpha numeric characters in the column names 
# with periods (".")

# **Requirement 4** Appropriate labels for the data set with descriptive 
#                   variable names
train.x <- read.table("UCI HAR Dataset/train/X_train.txt", 
                     col.names = features$name)
train.y <- read.table("UCI HAR Dataset/train/y_train.txt", 
                     col.names = "activity", as.is = TRUE)
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "subject", as.is = TRUE)
# **Requirement 2**  Extract only the measurements on the mean and the 
#                    standard deviation for each measurement
train.x <- train.x[, grep("mean\\.|mean$|std", names(train.x))]
#-----------------------------------------------------------------------------#

#-----------------------------------------------------------------------------#
# Combine the test and train datasets
# **Requirement 1**  Merge the training and the test sets to create one data set
combined.df <- rbind(test.x, train.x)
combined.activities <- c(test.y$activity, train.y$activity)
combined.subjects <- c(test.subjects$subject, train.subjects$subject)

# Remove train and test data
rm(train.x, train.y, train.subjects, test.x, test.y, test.subjects)
#-----------------------------------------------------------------------------#

#-----------------------------------------------------------------------------#
# Convert activities and subjects into factors
combined.activities <- as.factor(combined.activities)
combined.subjects   <- as.factor(combined.subjects)

# **Requirement 3**  Use descriptive activity names to name the activities in
#                    the data set
levels(combined.activities) <- activities$V2

# Create a factor variable in the combined data frame that combines subjects and activites
combined.df$factor <- interaction(combined.subjects, combined.activities)
#-----------------------------------------------------------------------------#

#-----------------------------------------------------------------------------#
# **Requirement 5**  From the data set in step 4, creates a second, independent 
#                    tidy data set with the average of each variable for each
#                    activity and each subject.
tidy.df <- combined.df %>% group_by(factor) %>% summarise_all(mean)

# Separate the factor variable back into subject and activity
tidy.df <- separate(tidy.df, factor, into = c('subject', 'activity'), sep = "\\.")
tidy.df$subject <- as.factor(tidy.df$subject)
tidy.df$activity <- as.factor(tidy.df$activity)

# Write the tidy data table to a text file
write.table(tidy.df, file = "Step5-TidyData.txt", row.name = FALSE)
#-----------------------------------------------------------------------------#