# Code Book for Getting and Cleaning Data Course Project

This document is prepared with an intent to explain the process being adopted in order to get and clean the data for "Getting and cleaning data course project" . The write up below explains the variables used in the script 'run_analysis.R' in transforming the raw data to a processed format as per the requirements of the project.

1)Variable Name: train_data  
Position introduced(line number): 17  
Type: Data Frame  
Purpose: To store the raw data for the training dataset.  
Transformation : Import of data using read.table() function.  

2)Variable Name: test_data  
Position introduced(line number): 20  
Type: Data Frame  
Purpose: To store the raw data for the test dataset.  
Transformation : Import of data using read.table() function.  


3)Variable Name: feature_names  
Position introduced(line number): 23  
Type: Data frame  
Purpose: To store the all the 561 features.  
Transformation : Import of data using read.table() function.

4)Variable Name: activity_labels  
Position introduced(line number): 25  
Type: Data Frame  
Purpose: To store the activity ids and the corresponding activity labels.  
Transformation : Import of data using read.table() function.

5)Variable Name: test_subject_names  
Position introduced(line number): 27  
Type: Data Frame  
Purpose: To store names of the subjects which are a part of test data set.  
Transformation : Import of data using read.table() function.

6)Variable Name: train_subject_names  
Position introduced(line number): 29  
Type: Data Frame  
Purpose: To store names of the subjects which are a part of train data set.  
Transformation : Import of data using read.table() function.

7)Variable Name: test_activity_names  
Position introduced(line number): 31  
Type: Data Frame  
Purpose: To store the ids of the activities performed as part of measurements taken for test data set.  
Transformation : Import of data using read.table() function.

8)Variable Name: train_activity_names  
Position introduced(line number): 33  
Type: Data Frame  
Purpose: To store the ids of the activities performed as part of measurements taken for train data set.  
Transformation : Import of data using read.table() function.

9)Variable Name:complete_data  
Position introduced(line number): 37  
Type: Data Frame  
Purpose: Data frame to store the merged data of train and test measurements.  
Transformation : Row binding train_data and test_data data frames.

10)Variable Name: complete_activity_data  
Position introduced(line number): 42  
Type: Data Frame  
Purpose: To store the activity ids for train and test data in a single data frame.  
Transformation : Row binding train_activity_names and test_activity_names data frames.


11)Variable Name: complete_subject_data  
Position introduced(line number): 47  
Type: Data Frame  
Purpose: To store the activity ids for train and test data in a single data frame.  
Transformation : Row binding train_subject_names and test_subject_names data frames.


12)Variable Name: valid_indices_mean  
Position introduced(line number): 59  
Type: Integer Vector  
Purpose: To store the indices in the features names data frame where the measurement is a mean of a quantity.  
Transformation : Grep applied to search for the patter having the string Mean/mean and having '()' at the end. Because there are a few features where a mean has been passed as an argument but it is not calculated.


13)Variable Name: valid_indices_std  
Position introduced(line number): 60  
Type: Integer Vector  
Purpose: To store the indices in the features names data frame where the measurement is a standard deviation of a quantity.  
Transformation : Grep applied to search for the patter having the string Std/std and having '()' at the end. Because there might be a few features where a standard deviation has been passed as an argument but it is not calculated(like the mean).

14)Variable Name: valid_indices  
Position introduced(line number): 61  
Type: Integer Vector  
Purpose: To store all the indices combined obtained by valid_indices_std and valid_indices_mean in a single vector.  
Transformation : Concatenating valid_indices_mean  and valid_indices_std  data frames.

15)Variable Name: data_melt  
Position introduced(line number): 93  
Type: Data Frame  
Purpose: To store the pivoted down information corresponding to the complete_data data frame. This is an intermediate step in calculating the final data frame   containing the means    of all the mean and SD variables present in the data frame against each activity and subject.  
Transformation : melt function applied on complete_data data frame with id values as activity_id, activity_name and subject_id. Rest of the variables are taken to   be measures by default.

16)Variable Name: final_data   
Position introduced(line number): 94  
Type: Data Frame  
Purpose: To store the finalized processed dataset.  
Transformation : dcast function applied on data_melt data frame with id values as activity_id, activity_name and subject_id. Rest of the variables are taken to be   measures by default and their mean has been calculated.

