
## setwd("path_goes_here")


## step 1 - Merges the training and the test sets to create one data set.

# Reading the datafiles

test.labels <- read.table("test/y_test.txt", col.names="label")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.data <- read.table("test/X_test.txt")
train.labels <- read.table("train/y_train.txt", col.names="label")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.data <- read.table("train/X_train.txt")

# Merging them into a unified set
data <- rbind(cbind(test.subjects, test.labels, test.data),
              cbind(train.subjects, train.labels, train.data))

## step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

# Reading the feature file
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

# Finding and keeping the features where "mean" and "std" is mentioned
features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# Matching the "mean" and "std" features with the corresponding data
data.mean.std <- data[, c(1, 2, features.mean.std$V1+2)]

## step 3 - Uses descriptive activity names to name the activities in the data set

# Reading the activity labels
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

# Matching the labels and replacing them
data.mean.std$label <- labels[data.mean.std$label, 2]

## step 4 - Appropriately labels the data set with descriptive variable names.

# Retriving raw column names 
good.colnames <- c("subject", "label", features.mean.std$V2)

# Removing non-alphabetic character and converting to lowercase
good.colnames <- tolower(gsub("[^[:alpha:]]", "", good.colnames))

# Matching changed column names to raw data names 
colnames(data.mean.std) <- good.colnames

## step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Calculating the mean for all signals
aggr.data <- aggregate(data.mean.std[, 3:ncol(data.mean.std)],
                       by=list(subject = data.mean.std$subject, 
                               label = data.mean.std$label), mean)

# Writing the data in a separete file
write.table(format(aggr.data, scientific=T), "tidydataset.csv",
            row.names=F, col.names=F, quote=2)
