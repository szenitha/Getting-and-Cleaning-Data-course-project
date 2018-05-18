## Raw data: The folder UCI HAR contains the following files which are used to achieve the goal:
- Train: This folder contains: 
   - X_train.txt: Training data. A matrix with dimension 7352 x 561 (observations x features)
   - y_train.txt: Activity labels for each observation.
   - subject_train: Volunteer label for each obsrvation (Total volunteers considered for the experiment 30)
- Test: this folder contains:
   - X_test.txt: Test data. A matrix with dimension 2947 x 561 (observations x features)
   - y_test.txt: Activity labels for each observation.
   - subject_test: Volunteer label for each obsrvation (Total volunteers considered for the experiment 30)
- features.txt: This file contains the labels for 561 features in train and test data.
- activity_labels.txt: This file contains information about activities. The activities recorded in the files y_train and y_test.txt are numbered 1-6. This file indidicates the activity label associated with each number.

## Sub tasks to achieve goal:

Create an R script called run_analysis.R that does the following:

- 1) Merge training and the test data matrices to create one data frame.
- 2) Extract all features from features.txt and label the columns of the created dataframe.
- 3) Subset the dataframe and only keep the columns on the mean and standard deviation for each measurement.
- 4) Extract and merge the activity labels for train and test data. Do the same for subject labels.
- 5) Add the above created variables as columns to the subsetted dataframe. Map the numeric activity labels to activities using the file activity_labels.txt.
- 6) From the data set in the above step, creates a second, independent tidy data set with the average of each variable for each activity and each subject. To do this, use functions groupby and summarize_all from package dplyr. Group by columns subject and activity and call the function summarize_all with function mean as inout parameter.
