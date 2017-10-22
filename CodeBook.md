
## Code Book

This codebook describes the variables and the data that were included in the current exercise as well as a short description of the process followed.


### Summary

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Data description

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.



### Process followed

1. The datafiles of interest were loaded and merged into a single data set, and the each column was matched with its appropriate name.
2. All measuerements that were not of interest were excluded from further analysis - only column names containing the strings "mean" and "std" were kept.
3. Descriptive activity names were given to the data set.
4. Each subject was assigned a mean value for each feature for activity, and a separete dataset was created in a CSV format.
