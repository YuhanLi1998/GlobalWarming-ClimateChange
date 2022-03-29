dir("/Users/liyuhan/Desktop/Tsinghua/semester3/preforICApaper/Data/
    wordoccurrencenetwork/GlobalWarming-tidy/Top180VideoComments/")
data <- data.frame() #创建一个空的dataframe以待后面填入数据
for (i in dir("/Users/liyuhan/Desktop/Tsinghua/semester3/preforICApaper/Data/wordoccurrencenetwork/GlobalWarming-tidy/Top180VideoComments/")){
  +     df=readtext(paste("/Users/liyuhan/Desktop/Tsinghua/semester3/preforICApaper/Data/wordoccurrencenetwork/GlobalWarming-tidy/Top180VideoComments/",i,sep=""))
  +     data=rbind(data,df)
  + }
rm(i,df) #移除过程变量，节约内存
dim(data)
write.table(data,file = "merge_GG.csv")
data_delete <- data[,-c(1)] #删除第一列"doc_id"
write.table(data_delete,file = "merge2_GG.csv") #存储删除第一列后的文件