library(reshape2)
library(dplyr)

##Set the current working directory to the folder containing the datasets:
setwd("/Users/sampathsomayajula/Desktop/Modeling/Coursera/Getting_cleaning_data/data/UCI HAR Dataset")

#Extracting the activity labels and converting into character values
act_Lbls<-read.table("activity_labels.txt")
act_Lbls[,2]<-as.character(act_Lbls[,2])

#Extracting features.txt data and converting into character values
ftr_data<-read.table('features.txt')
ftr_data[,2]<-as.character(ftr_data[,2])


#Extracting mean and std values using Regular Expressions from features data:
ftr_index<-grep("[a-zA-Z].mean.*|[a-zA-Z].std.*",ftr_data$V2)
req_ftr_names<-ftr_data[ftr_index,2]
req_ftr_names<-gsub("-mean",'Mean',req_ftr_names)
req_ftr_names<-gsub('-std','Std',req_ftr_names)
req_ftr_names<-gsub('[()-]',"",req_ftr_names)


##loading the train dataset:
train<-read.table('./train/X_train.txt')[ftr_index]
train_actvt<-read.table('./train/y_train.txt')
train_subjcts<-read.table('./train/subject_train.txt')
train<-cbind(train_subjcts,train_actvt,train)

##loading the test datasets:
test<-read.table('./test/X_test.txt')[ftr_index]
test_actvt<-read.table('./test/y_test.txt')
test_subjcts<-read.table('./test/subject_test.txt')
test<-cbind(test_subjcts,test_actvt,test)

##Merging train and test datasets:
mergeData<-rbind(train,test)
colnames(mergeData)<-c('Subject','Activity',req_ftr_names)

##Converting activities column into factors with their lablels:
mergeData$Activity<-factor(mergeData$Activity,levels = act_Lbls[,1],labels = act_Lbls[,2])
mergeData$Subject<-as.factor(mergeData$Subject)

##Installing packages required for summarizing the data 
install.packages("reshape2")
library(reshape2)
melt_data<-melt(mergeData,id=c('Subject','Activity'))
melt_data_stat<-dcast(melt_data,Subject+Activity~variable,mean)
melt_data_stat<-melt_data_stat[order(melt_data_stat$Subject,melt_data_stat$Activity),]

##Writing the required tidy dataset:
write.table(melt_data_stat, "tidy_data.txt", row.names = FALSE, quote = FALSE)
