## step 1
## create a combined data set with column names

## setwd("/Users/jiaxuecong/Documents/Coursera/GettingandCleaningData/CourseProject")
a <- read.table("UCI HAR Dataset/test/X_test.txt")
b <- read.table("UCI HAR Dataset/train/X_train.txt")
data <- rbind(a,b)
name <- read.table("UCI HAR Dataset/features.txt")[,2]
names(data) <- name

## step 2
## create a subset which only contains either mean or standard deviation

pattern <- "mean\\(\\)|std"
idx <- grep(pattern, names(data))
data_sub <- data[,idx]
## head(data_sub)

## step 3
## add activity and subject variables
a1 <- read.table("UCI HAR Dataset/test/Y_test.txt")
a2 <- read.table("UCI HAR Dataset/train/Y_train.txt")

s1 <- read.table("UCI HAR Dataset/test/subject_test.txt")
s2 <- read.table("UCI HAR Dataset/train/subject_train.txt")

datasub <- cbind(data_sub, rbind(a1,a2), rbind(s1,s2))
colnames(datasub)[ncol(datasub)-1]="act_label"
colnames(datasub)[ncol(datasub)]="subject"

## name the activity variable
label <- read.table("UCI HAR Dataset/activity_labels.txt")

library("dplyr")
datasub <- left_join(datasub, label, by=c("act_label"="V1"))

names(datasub)[ncol(datasub)] <- "activity"
datasub1 <- subset(datasub, select=-act_label)

## step 4
## rename variables to make them readable
pattern1 <- "\\(\\)"
name1 <- sub(pattern1,"", names(datasub1))
pattern2 <- "-"
name2 <- sub(pattern2,"", name1)
name3 <- sub("-","", name2)
names(datasub1) <- name3

## step 5 create the tidy dataset
datasub1$activity <- factor(datasub1$activity)
datasub1$subject <- factor(datasub1$subject)
output <- datasub1 %>% group_by(subject, activity) %>% summarize_each(funs(mean)) %>% as.data.frame
write.table(output, file="tidy.txt", row.name=FALSE)

