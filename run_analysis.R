# load plyr package so we can use ddply
library(plyr)

# read all files we'll use
# NOTE: THIS ASSUMES THE run_analysis.R FILE IS INSIDE THE FOLDER WITH DATA
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
train_subjects <- read.table("train/subject_train.txt")
test_subjects <- read.table("test/subject_test.txt")
train_activity <- read.table("train/y_train.txt")
test_activity <- read.table("test/y_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

#combine test and train data
combined <- rbind(test, train)

# combine subjects and activity data and add names
subjects <- rbind(test_subjects, train_subjects)
names(subjects) <- "Subjects"
activity <- rbind(test_activity, train_activity)
names(activity) <- "Activity"

# use grep to get all features containing mean() and std()
means_and_stds <- features[grep("mean\\(\\)|std\\(\\)", features$V2),]

# We extract only the mean() and std() columns from combined using means_and_stds
extracted_data <- combined[,means_and_stds$V1]

# We add labels to the extracted_data, using the names from features.txt
names(extracted_data) <- means_and_stds$V2

# We combine subjects, activity and extracted_data into one table
all_data <- cbind(subjects, activity, extracted_data)

# Make Activity into a factor and use the activity descriptions as level names
all_data$Activity <- as.factor(all_data$Activity)
levels(all_data$Activity) <- activity_labels$V2

# This creates the mean of each column, sorted by subjects and activity
final_output <- ddply(all_data, c("Subjects", "Activity"), numcolwise(mean))

# Write the tidy data to a text file
write.table(final_output, "tidy_data.txt", row.names=FALSE)