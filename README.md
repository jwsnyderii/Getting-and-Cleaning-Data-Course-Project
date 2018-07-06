# Getting-and-Cleaning-Data-Course-Project

This repository contains the following files:

### CodeBook.md
A document which describes the data found in the "Step5-TidyData.txt" file.

### Getting-and-Cleaning-Data-Course-Project.Rproj
An R project file that can used to load the porject into RStudio.  Loading this project into RStudio will ensure that the working directory is properly set.

### README.md
This file

### Step5-TidyData.txt
The output tidy data file created by the run_analysis.R script (see below).  This file can be loaded into R using the following command:

```R
tidy_data <- read.table("Step5-TidyData.txt", header = TRUE)
```
### run_analysis.R
#### Libraries required to run this script
* `dyplr`
* `tidyr`

#### Script Summary
This R script file runs the analysis specified in the [course project instructions](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project): 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The R code that fulfills each of the above analysis requirements are tagged in the script with a comment of the form 

`# **Requirement n**` 

where n equals 1 to 4. 

In addition, the script will download and unzip the [source data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to the working directory if it is not found.

#### Running the script
1. From the command line: `R -f run_analysis.R`
2. From within the R REPL: `source("run_analysis.R")`
3. From RStudio: Load the file and click the "Source" button in the upper right corner of the RStudio text editor window

If no errors occured, the end result of the script will be the creation of the file "Step5-TidyData.txt" in your working directory. 


## References
Online resources I found helpfull during the development of the run_analysis.R script:
* Create a factor out of two other factors: https://stat.ethz.ch/pipermail/r-help/2008-November/178808.html
* Apply a function over rows of a data frame: https://stackoverflow.com/questions/7029800/how-to-run-tapply-on-multiple-columns-of-data-frame-using-r
