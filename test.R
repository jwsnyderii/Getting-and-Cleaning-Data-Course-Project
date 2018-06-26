features <- read.table("UCI HAR Dataset/features.txt", col.names = c("num", "name"),  as.is = TRUE)
features$name <- sub("\\(\\)", "", features$name)

test.x <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$name)