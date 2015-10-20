train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
combined <- rbind(test, train)

train_subjects <- read.table("train/subject_train.txt")
test_subjects <- read.table("test/subject_test.txt")
subjects <- rbind(test_subjects, train_subjects)
names(subjects) <- "Subjects"

test_activity <- read.table("test/y_test.txt")
train_activity <- read.table("train/y_train.txt")
activity <- rbind(test_activity, train_activity)
names(activity) <- "Activity"

features <- read.table("features.txt")
means_and_stds <- features[grep("mean\\(\\)|std\\(\\)", features$V2),]

# We extract only the mean() and std() columns from combined using means_and_stds
extracted_data <- combined[,means_and_stds$V1]

# We add labels to the extracted_data
names(extracted_data) <- means_and_stds$V2

# We add activity labels
activity_labels <- read.table("activity_labels.txt")

# Make Activity into a factor
all_data2$Activity <- as.factor(all_data2$Activity)
# Set factor labels to the activity labels
levels(all_data2$Activity) <- activity_labels$V2

# load plyr package so we can use ddply
library(plyr)

# This creates the mean of each column, sorted by subjects and activity
final_output <- ddply(all_data2, c("Subjects", "Activity"), numcolwise(mean))