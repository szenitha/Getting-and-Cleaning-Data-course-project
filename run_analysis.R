#Step 1:
#Read training data
train<-read.table(file.choose()) #Read x_train.txt inside folder train
  
#Read test data
test<-read.table(file.choose()) #Read x_test.txt inside folder test
  
#Merge train and test data
total<-rbind(train,test)

#Step 2:
#Extract all feature labels
names<-read.table(file.choose()) #Read feature.txt file.
  
#Label all the features of the dataframe
colnames(total)<-names$V2

#Step3:
#Get indices of columns names with mean and standard deviation
idx<-grep("mean[^F]|std[^F]",names$V2)

#Subset data and pick only columns with mean and standard deviation using indices from above step.
total_sub<-total[,idx]

#Step 4: 

#a)Extract activity labels for training and test data

train_activity<-read.table(file.choose()) #Read y_train.txt file inside folder train
  
test_activity<-read.table(file.choose()) #Read y_test.txt file inside folder test
  
#Merge activity labels for train and test
activity<-rbind(train_activity,test_activity)

#b)Extract subject labels for training and test data
train_sub<-read.table(file.choose())#Read subject_train.txt inside folder train
  
test_sub<-read.table(file.choose())#Read subject_test.txt inside folder test
  
#Merge subjects for training and test
sub<-rbind(train_sub,test_sub)

#Step 5:
#Extract file containing activities associated with numeric activity labels in the previous step (step:4a)
activity_label<-read.table(file.choose()) #Read activity_labels.txt

#Map numeric activity labels to activities extracted in the above step.
activity$V1<-sub(1,activity_label$V2[1],activity$V1)
activity$V1<-sub(2,activity_label$V2[2],activity$V1)
activity$V1<-sub(3,activity_label$V2[3],activity$V1)
activity$V1<-sub(4,activity_label$V2[4],activity$V1)
activity$V1<-sub(5,activity_label$V2[5],activity$V1)
activity$V1<-sub(6,activity_label$V2[6],activity$V1)

#Add the subject and activities variables as columns to dataset
total_sub<-cbind(total_sub,sub,activity)
colnames(total_sub)[67:68]<-c("subject","activity")

#Step 6:
#Create second independent tidy dataset with average for each activity and subject
library(dplyr)

tidy<-tbl_df(total_sub)

tidy<-tidy %>%
  group_by(subject,activity) %>% #Step 6 a) group by activity and subject
  summarize_all("mean")  #Step 6 b) take the average of the measurements pertaining to one subject and activity combination
  
#write the resulting dataframe into a file
write.table(tidy,"D://tidy.txt")
