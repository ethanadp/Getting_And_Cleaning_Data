# The Getting_And_Cleaning_Data Project

## The "run_analysis.R" script
1. This script first reads the data provided from an archive for Machine Learning Datasets
2. Filters the variables provided within the train/test features data sets for just the [mean/standard deviation]-related variables
3. Combines the subject, activity, and features data sets into one dataset for the respective train/test data set.
4. Merges the train data set and test data set by adding the test data to the rows of the train data set.
5. Appropriately names all the columns of the data set to describe the subject, activity, and features of the data.
6. Calculates the average of each variable/feature for each respective activity for each respective subject.
7. Creates a whole new tidy data set (called `"tidy.txt"` within this repository) with all the data calculated and arranged in the steps prior.
- The entire script would be pasted here (as suggested by the project instructions) but the comments that were added between the functions used would mess with the markdown file due to the hashtags also representing the size of headers within a markdown file.

## The "tidy.txt" file
- First column states the subject being analyzed.
- Second column states the activity that the following features were recording during.
- The following columns/variables are the features that the smartphone capturing during their respective activity by their respective subject.

## The "CodeBook.md" file 
- The list of activities
- The list of subjects
- The data (list of features/variables used in the project)
- Small description of how the data was utilized/organized

