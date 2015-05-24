==================================================================
Getting and Cleaning Data 
MOOC Coursera
==================================================================
Paulo Cirino Ribeiro Neto
==================================================================
In This CodeBook I'll explain all of the variables used in run_analysis.R
I'm sorry for my broken english
==================================================================

LabFileName <- path to the activity_labels.txt file
TestXName <- path to the _test.txt file
TestYName <- path to the y_test.txt file
TestSubjectName <- path to the subject_test.txt file
TrainXName <- path to the X_train.txt file
TrainYName <- path to the y_train.txt file
TrainSubjectName <- path to the subject_train.txt file
FeaturesName <- path to the features.txt  file


LabFile <- object with names of all activitys names
TestXFile <- object with all test imput observations
TestYFile <- object with all test output observations
TestSubjectFile <- objetct with all test subject by observation
TrainXFile <-object with all train imput observations
TrainYFile <- object with all train output observations
TrainSubjectFile <- objetct with all train subject by observation
FeaturesFile <- read.table(FeaturesName,stringsAsFactors=FALSE)

Subjects <- combination of all subject objects 
Data <- Data transformed into tidy data
Colums <- Boolean vector with True positions where there are mean or standart deviation values
Data <- Data[,Colums]

Data5 <- Second Set of tidy Data
size <- size of Second Set of tidy Data

