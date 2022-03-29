library(dplyr)
#data1<-read.csv("/Users/yubeichen/Desktop/GlobalWarming-all-data1.csv")
#data2<-read.csv("/Users/yubeichen/Desktop/GlobalWarming-all-data2.csv")
data3<-read.csv("/Users/yubeichen/Desktop/ClimateChange-all-data.csv")

#dataAll<-rbind(data1,data2)
dataclean<-distinct(data3,视频名称, .keep_all= TRUE)
Videotitle<-dataclean[,6]
Videotitle<-data.frame(Videotitle)
FileNumber<-1:740
for( i in 1:740){
  n<-Videotitle[i,]
  video<-data3[data3$视频名称 == n,]
  reviewContent<-video$评论内容
  reviewContent<-data.frame(reviewContent)
  reviewContentclean<-distinct(reviewContent)
  names(reviewContentclean)<-"content"
  replyContent<-video$回复内容
  replyContent<-data.frame(replyContent)
  names(replyContent)<-"content"
  all_text<-rbind(reviewContentclean,replyContent)
  all_text$content[all_text$content==""]<-NA
  all_text<-na.omit(all_text)
  filename<-paste("video",FileNumber[i],sep="")
  out_filename1<-paste(filename,".csv",sep="")
  out_filename2<-paste(filename,"review.csv",sep="")
  out_filePath1<-paste("/Users/yubeichen/Desktop/正经脸/研二上/yh&bc冲冲冲/Data/ClimateChange",out_filename1,sep="/")
  out_filePath2<-paste("/Users/yubeichen/Desktop/正经脸/研二上/yh&bc冲冲冲/Data/ClimateChange",out_filename2,sep="/")
  write.csv(video,out_filePath1)
  write.csv(all_text,out_filePath2)
}

df1<-1:740
df1<-data.frame(df1)

for(i in 1:740){
filename<-paste("video",FileNumber[i],sep="")
out_filename2<-paste(filename,"review.csv",sep="")
in_filePath<-paste("/Users/yubeichen/Desktop/正经脸/研二上/yh&bc冲冲冲/Data/ClimateChange",out_filename2,sep="/")
data<-read.csv(in_filePath)
df1[i,2]<-nrow(data)
}

write.csv(df1,"/Users/yubeichen/Desktop/ClimateChangeReviewCount.csv")