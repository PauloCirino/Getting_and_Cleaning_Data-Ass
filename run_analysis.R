library("dplyr")
LabFileName <- "./UCI HAR Dataset/activity_labels.txt"
TestXName <- "./UCI HAR Dataset/test/X_test.txt"
TestYName <- "./UCI HAR Dataset/test/y_test.txt"
TestSubjectName <- "./UCI HAR Dataset/test/subject_test.txt"
TrainXName <- "./UCI HAR Dataset/train/X_train.txt"
TrainYName <- "./UCI HAR Dataset/train/y_train.txt"
TrainSubjectName <- "./UCI HAR Dataset/train/subject_train.txt"
FeaturesName <- "./UCI HAR Dataset/features.txt"


LabFile <- read.table(LabFileName)[2]
TestXFile <- read.table(TestXName)
TestYFile <- read.table(TestYName)
TestSubjectFile <- read.table(TestSubjectName)
TrainXFile <- read.table(TrainXName)
TrainYFile <- read.table(TrainYName)
TrainSubjectFile <- read.table(TrainSubjectName)
FeaturesFile <- read.table(FeaturesName,stringsAsFactors=FALSE)

Subjects <- as.factor(rbind(TestSubjectFile,TrainSubjectFile)[[1]]) 
#1-Merges the training and the test sets to create one data set.
Data <- cbind(rbind(TestXFile,TrainXFile),
               as.factor(rbind(TestYFile,TrainYFile)[[1]]) ) 

#4-Appropriately labels the data set with descriptive variable names. 
colnames(Data) <- c(FeaturesFile[[2]],"Activity")

#2-Extracts only the measurements on the mean and standard deviation for
#each measurement. 
#gets all the mean() and std() TRUE positions
Colums <- grepl("mean()",FeaturesFile[[2]]) | grepl("std()",FeaturesFile[[2]]) 
Data <- Data[,Colums]

#3-Uses descriptive activity names to name the activities in the data set
levels(Data$Activity) <- LabFile[[1]]

#5-From the data set in step 4, creates a second, independent tidy data set with
##the average of each variable for each activity and each subject.
Data5 <- cbind(Data,Subjects)
size <- dim(Data5)[2]
Data5 <- aggregate(Data5[,1:(size-2)], by=list(Data5$Activity,Data5$Subjects),
                   FUN=mean)
names(Data5) <- c("Activity","Subjects",names(Data5[3:(dim(Data5)[2])] ))
    
#Writing the Data
write.table(Data5,"Project_Assignment_Data05.txt",row.name=FALSE)
