## In order to use the dcast function that was shown in the course, I had to install this package
## called "reshape2". Researching I found it wasn't the only method of dcasting, where I could've
## used the "tidyr" package, but I wanted to use functions specifically mentioned in the course.
install.packages("reshape2")
library(reshape2)
## Sets the directory where my folder and datasets are.
setwd("C:/Users/bulga/Desktop/Test/UCI_HAR_Dataset")

## Why it is that I read the features set first was because I kept having difficulty trying to 
## capture the means of only the data we care about, specifically being the variables representing
## the mean and standard deviation that were collected and given to us. What makes it difficult is 
## that there's 561 variables in the TrainSet and TestSet by default, each one being a feature
## that's collected by the smartphone on the subjects' wrists. Initially I attempted loading all the
## features to then filter them later, but personally it was harder to assign the feature names  
## within the TrainSet/TestSet to the feature name within the separate features.txt file. So I found 
## that when reading the Train/Test sets, I could filterout the columns representing the data we 
## wanted (for the mean and standard deviation), by first reading the features and then utilizing 
## the grep function to pick out the numbers for rows containing the keywords "mean" and/or (using 
## the alternative metacharacter "|") "std".
FeaturesSet <- read.table("./features.txt")
Features <- FeaturesSet[grep(".*mean.*|.*std.*",FeaturesSet[,2]),2]

## Here I use the grep function again when reading the Train/Test set as mentioned above which reads
## specifically the columns/features from the train/set set that coincide with the number row from the 
## features file containing the keywords we searched for. 
TrainSet <- read.table("./train/X_train.txt")[grep(".*mean.*|.*std.*",FeaturesSet[,2])]
TestSet <- read.table("./test/X_test.txt")[grep(".*mean.*|.*std.*",FeaturesSet[,2])]

## This contains the labels for the activities ranging from numbers 1-6, labeled as "ClassLabels" 
## later on, which will be used to factor the data accordingly by activity.
TrainLabels <- read.table("./train/y_train.txt")
TestLabels <- read.table("./test/y_test.txt")

## This contains two data sets of subjects so that we are able to assign the activities performed
## with all the filtered features collected by the smartphone, to the respective subjects.
TrainSubjects <- read.table("./train/subject_train.txt")
TestSubjects <- read.table("./test/subject_test.txt")

## The following two assigned variables are to combine the filtered features, labels for the 
## activities, and then subjects, by assigning the subjects and training label columns first followed
## by the thousands of cells for feature data.
TrainData <- cbind(TrainSubjects,TrainLabels,TrainSet)
TestData <- cbind(TestSubjects,TestLabels,TestSet)

## This file contains the lables of the activities and the class of the activities. Within the 
## [Train/Test]Labels are the numbers ranging from 1-6 that coincide with the activity names
## assigned within the second column of this much smaller table, consisting of just 6 numbers 
## and 6 activity names/lables.
ActivityLabels <- read.table("./activity_labels.txt")
colnames(ActivityLabels) <- c("ClassLabels","ActivityNames")

## Adding the 30% of data that was randomly partitioned to a "test" data set 
## mentioned in the README.txt, to the "train" data set.
TotalData <- rbind(TrainData,TestData)
## Renaming the columns so it's followable and coherent.
colnames(TotalData) <- c("Subject","Activity",Features)

## These two factoring functions allow us to factor out both the activity labels (the numbers 1-6)
## with their respective activity name along with factoring out the subjects within the data set
## so they could be organized once reshaped which is coming up. The purpose behind the factoring 
## is so that R recognizes the different subjects as their own levels along with the activities
## having their own respective levels.
TotalData$Activity <- factor(TotalData$Activity, levels = ActivityLabels[,"ClassLabels"], labels = ActivityLabels[,"ActivityNames"])
TotalData$Subject <- as.factor(TotalData$Subject)

## Here we are going to pass the TotalData data frame through the melt function where
## the columns "Subject" and "Activity" are "id variables" which essentially pair each
## particular subject with an activity so that it could ultimately be reshaped in the
## following dcast function.
MeltedTotal <- melt(TotalData, id = c("Subject", "Activity"))
## Utilizing the dcast function allows us to recast the dataset into a new shape, where
## we are able to see the subject and the activity organized by rows with their respective 
## summarized data that was taken the mean of, in the following columns on the right hand side.
MeanTotal <- dcast(MeltedTotal, Subject + Activity ~ variable, mean)

## This is the function for the last step of this project, being to write a new independent tidy
## data set with the average of each variable for each activity and each subject. It's important
## to point out that within the parameters of this function, 'row.names = FALSE', 'col.names = TRUE',
## and 'quote = FALSE' are essential in creating the correct data table because by default this 
## function assigns TRUE to all of the mentioned parameters and that wouldn't generate a table
## like how we have put together within MeanTotal. 'quote = TRUE' would have surrounded any 
## character or factor columns (like the activity ccolumn and subject column) to be surrounded
## by double quotes, exactly not what we want.
write.table(MeanTotal, "tidy.txt", row.names = FALSE, col.names = TRUE, quote = FALSE)