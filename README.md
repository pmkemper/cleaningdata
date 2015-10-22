###Guide to create the tidy data file
1. Download the run_analysis.R file
2. Place the run_analysis.R file within the raw data folder (so that it is in the same folder as features.txt etc.)
3. Run run_analysis.R by using source() in your R environment:  
```
source("run_analysis.R")
```

You will now find tidy_data.txt in the same directory.


###Guide to read the tidy data file
To read tidy data set, save as tidy_data.txt in your working directory and then use:  
```
data <- read.table("tidy_data.txt", header = TRUE)  
View(data)
```

###Goal of the script
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###How the tidy data file was created
First the script loads the plyr package and reads the raw data files.

Then the test and train data are combined using rbind. In the case of activity and subject files, the data is also named appropriately.

Then grep is used to get the subset of features that contains mean() and std().  
Features containing meanFreq() are not included, since this is not a mean of the measurement, but rather a "Weighted average of the frequency components to obtain a mean frequency".

The feature IDs (first column from features.txt) of the subset extracted in the previous step are used to create a subset of the measurement columns containing only mean() and std().  
Then the feature names (second column from features.txt) are used to name all measurement columns.

Then, subjects, activity and measurements are combined into one table with (cbind).

Activity is labeled by making it into a factor and naming the factor levels according to activity_labels.txt.

Finally, ddply is used to get the average of each measurement per subject per activity, which is written to a text file using write.table().

This generates a tidy data text file according to the specifications required.