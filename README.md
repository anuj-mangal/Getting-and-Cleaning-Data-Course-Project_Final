# Getting-and-Cleaning-Data-Course-Project_Final
The repository has  been created to share the final artifacts created as part of this project work

##Script Description
There is a single script as part of this project, named 'run_analysis.R'. The steps below descrive the overall working of the script in tranforming the raw data obtained from UCI's website to a processed data frame named 'final_data'.


##Step 1. 
The reshape2 package is imported in order to bring dcast() and melt() functions to the current working environment.

##Step 2. 
The environment is reset and any previously created variables are removed.

##Step 3.
The input raw data is read into data frames. Raw data comprises of training and test datasets, activity labels, feature names, subject and activity information for both testing and training datasets.

##Step 4a),b) and c) . 
In the following steps, I am merging training and testing datasets for feature values, activities and subjects.

##Step 5. 
The merge of datasets is followed by the assignment of header or variable names to the respective datasets.

##Step 6. 
Next, via the use of grep,the measure names which are related to the calculation of means and standard deviation of variables are extracted.

##Step 7. 
The indices extracted in step 6 are used to limit the data in the data frame "complete_data" to only the selected variables.

##Step 8. 
As part of this step, the activity, subject and complete data are merged to form a consolidated data frame.

##Step 9. 
This step introduces the activity names in the resultant data set by merging the "complete_data" data frame with the "activity_lables" data frame.

##Step 10. 
Multiple steps as part of this step transform the names of the variables to more descriptive ones.

##Step 11. 
As part of the penultimate step, I am melting the data frame and recasting it against activity_id, activity_name and subject_id to calculate the means of the variables.

##Step 12.
The last step is to call the write.table function to write the final data frame i.e. final_data to a text file named "tidy_data.txt".
