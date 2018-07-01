library(dplyr)
library(tidyr)

if(!file.exists("dataset.zip")) {
    print("Downloading dataset")
     download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                   "dataset.zip")
}
print("Unzipping dataset")
unzip("dataset.zip")

# Read in activites and features from root data folder
activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                         as.is = TRUE)
features <- read.table("UCI HAR Dataset/features.txt", 
                       col.names = c("num", "name"),  as.is = TRUE)
features$name <- sub("\\(\\)", "", features$name)

# Read in test datasets
test.x <- read.table("UCI HAR Dataset/test/X_test.txt", 
                     col.names = features$name)
test.y <- read.table("UCI HAR Dataset/test/y_test.txt", 
                     col.names = "activity", as.is = TRUE)
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                            col.names = "subject", as.is = TRUE)
test.x <- test.x[, grep("mean\\.|mean$|std", names(test.x))]


# Read in train datasets
train.x <- read.table("UCI HAR Dataset/train/X_train.txt", 
                     col.names = features$name)
train.y <- read.table("UCI HAR Dataset/train/y_train.txt", 
                     col.names = "activity", as.is = TRUE)
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "subject", as.is = TRUE)
train.x <- train.x[, grep("mean\\.|mean$|std", names(train.x))]

# Combine the test and train datasets
combined.df <- rbind(test.x, train.x)
combined.activities <- c(test.y$activity, train.y$activity)
combined.subjects <- c(test.subjects$subject, train.subjects$subject)

# Remove train and test data
rm(train.x, train.y, train.subjects, test.x, test.y, test.subjects)

# Convert activities and subjects into factors
combined.activities <- as.factor(combined.activities)
combined.subjects   <- as.factor(combined.subjects)

# Use descriptive names for activities
levels(combined.activities) <- activities$V2

# Create a factor variable in the combined data frame that combines subjects and activites
combined.df$factor <- interaction(combined.subjects, combined.activities)

# Step 5: create the tidy data frame
tidy.df <- combined.df %>% group_by(factor) %>% summarise_all(mean)

# Separate the factor variable back into subject and activity
tidy.df <- separate(tidy.df, factor, into = c('subject', 'activity'), sep = "\\.")
tidy.df$subject <- as.factor(tidy.df$subject)
tidy.df$activity <- as.factor(tidy.df$activity)

# Write the tidy data table to a text file
write.table(tidy.df, file = "Step5-TidyData.txt", row.name = FALSE)