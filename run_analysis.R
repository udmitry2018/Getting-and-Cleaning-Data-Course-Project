#load the tables from files

trainDataX<-read.table("./data/run_analysis/UCI HAR Dataset/train/X_train.txt")
subjectTrain<-read.table("./data/run_analysis/UCI HAR Dataset/train/subject_train.txt")
trainDataY<-read.table("./data/run_analysis/UCI HAR Dataset/train/Y_train.txt")

testDataX<-read.table("./data/run_analysis/UCI HAR Dataset/test/X_test.txt")
subjectTest<-read.table("./data/run_analysis/UCI HAR Dataset/test/subject_test.txt")
testDataY<-read.table("./data/run_analysis/UCI HAR Dataset/test/Y_test.txt")

features<-read.table('./data/run_analysis/UCI HAR Dataset/features.txt')
actLabels<-read.table('./data/run_analysis/UCI HAR Dataset/activity_labels.txt')

#Merging the training and the test data sets
mDataX<-rbind(trainDataX,testDataX)
mDataY<-rbind(trainDataY,testDataY)
mSubjects<-rbind(subjectTrain,subjectTest)


#features ended up with the second col having the var name and the feature name, 
FeatureNames<-features[[2]]

#Uses descriptive activity names to name the activities in the data set
names(mDataX)<-FeatureNames
names(mDataY)<-c("ActId")
names(mSubjects)<-c("Subject")
#will want to join these to merged data by ActId
names(actLabels)<-c("ActId","ActName")

#Extracts only the measurements on the mean and standard deviation for each measurement.
relevantFeatureNames<-grep("mean|std",FeatureNames)
relevantMData<-mDataX[,relevantFeatureNames]

#labels the data set with descriptive variable names.
mFinalActs<-merge(actLabels,mDataY,"ActId")
relevantMData$Activity<-mFinalActs$ActName
relevantMData$Subject<-mSubjects$Subject

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#the final two cols are act and subject
finalColToAgg<-dim(relevantMData)[2]-2
res<-aggregate(relevantMData[,1:finalColToAgg],list(act = relevantMData$Activity, subJ=relevantMData$Subject),mean, na.rm=TRUE)


write.table(res,"./data/run_analysis/result.txt",row.name = FALSE)