## Activities
- Small list of activities paired with their respective assigned numeric label, collected from `activity_labels.txt` :
    1. **WALKING**
    2. **WALKING_UPSTAIRS**
    3. **WALKING**
    4. **SITTING**
    5. **STANDING**
    6. **LAYING**

## Subjects
- A list of **21 subject id**s that performed the different activities for the *training* set, collected from `subject_train.txt`.
- A list of **9 subject ids** that performed the different activities for the *test* set, collected from `subject_test.txt`.

## Data (Features / Variables) Measured from Smartphone 
_This list is put together from `[X|y]_train.txt` for the train files and `[X|y]_test.txt` for the test files._
- "**tBodyAcc-[mean()|std()]-[X|Y|Z]**"
- "**tGravityAcc-[mean()|std()]-[X|Y|Z]**"
- "**tBodyAccJerk-[mean()|std()]-[X|Y|Z]**"
- "**tBodyGyro-[mean()|std()]-[X|Y|Z]**"
- "**tBodyGyroJerk-[mean()|std()]-[X|Y|Z]**"
- "**tBodyAccMag-[mean()|std()]**"
- "**tGravityAccMag-[mean()|std()]**"
- "**tBodyAccJerkMag-[mean()|std()]**"
- "**tBodyGyroMag-[mean()|std]**"
- "**tBodyGyroJerkMag-[mean()|std()]**"
- "**fBodyAcc-[mean()|std()]-[X|Y|Z]**"
- "**fBodyAcc-meanFreq()-[X|Y|Z]**"
- "**fBodyAccJerk-[mean()|std()]-[X|Y|Z]**"
- "**fBodyAccJerk-meanFreq()-[X|Y|Z]**"
- "**fBodyGyro-[mean()|std()]-[X|Y|Z]**"
- "**fBodyGyro-meanFreq()-[X|Y|Z]**"
- "**fBodyAccMag-[mean()|std()]**"
- "**fBodyAccMag-meanFreq()**"         
- "**fBodyBodyAccJerkMag-[mean()|std()]**"
- "**fBodyBodyAccJerkMag-meanFreq()**" 
- "**fBodyBodyGyroMag-[mean()|std()]**"
- "**fBodyBodyGyroMag-meanFreq()**"    
- "**fBodyBodyGyroJerkMag-[mean()|std()]**"
- "**fBodyBodyGyroJerkMag-meanFreq()**"

_Included with the project were two sets of data (a training set and test set of data), 
along with additional metadata which were used to organize all the data within both sets
according to the activities that spawned the measurements and whom carried them out.
Both sets were then combined, adding the training data to the test data, and used to 
produce a clean data table file, called `tidy.txt`, by melting the total data frame 
and recasting it with different levels for the subjects and activities._
