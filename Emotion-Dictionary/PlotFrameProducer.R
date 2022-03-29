library(reader)
library(ggplot2)
library(grid)
library(GGally)

mydata <- read.xlsx("/Users/liyuhan/Desktop/Tsinghua/semester3/preforICApaper/
                    FrameCode/frameProducerCode/FrameProducerCode.xlsx",2)
mydata$VPcategory[which(mydata$VPcategory =='1')] <- 'Governmental'
mydata$VPcategory[which(mydata$VPcategory =='2')] <- 'Non.Governmental'
mydata$VPcategory[which(mydata$VPcategory =='3')] <- 'Individual'
mydata$VPcategory <- as.character(mydata$VPcategory)
#translate Video Producer code into character vector

mydata$VideoFrame[which(mydata$VideoFrame =='2')] <- 'Impact&Outcome'
mydata$VideoFrame[which(mydata$VideoFrame =='3')] <- 'Scientific'
mydata$VideoFrame[which(mydata$VideoFrame =='4')] <- 'Action'
mydata$VideoFrame[which(mydata$VideoFrame =='5')] <- 'Real OR hoax'
mydata$VideoFrame[which(mydata$VideoFrame =='6')] <- 'Conflict'
mydata$VideoFrame[which(mydata$VideoFrame =='7')] <- 'Political'
mydata$VideoFrame[which(mydata$VideoFrame =='8')] <- 'Other'
mydata$VideoFrame <- as.character(mydata$VideoFrame)
#translate Video Frame code into character vector

mydata$ViewCount <- as.numeric(mydata$ViewCount)
#translate VideoCount into numeric vector

mydf <- data.frame(mydata$VPcategory, mydata$AngerPercent, mydata$ViewCount)
colnames(mydf) <- c("Frame Producer", "Anger Index", "View Count")
ggpairs(data = mydf, columns = 1:3, ggplot2::aes(colour=mydf$"Frame Producer"),
        title = c("Global Warming"), legend = c(1,1))

myplot <- ggplot(data = mydata) +
  geom_point(mapping = aes(x = VideoFrame, y = AngerPercent, color = VPcategory))+
  ylim(0,0.16)+
  labs(title = bquote('Global Warming'))+
  theme(plot.title = element_text(hjust = 0.5))
#3 types of accounts on the AngerPercent

myplot1 <- ggplot(data = mydata) +
  geom_point(mapping = aes(x = VideoFrame, y = AngerPercent, color = VPcategory,
                           size = ViewCount))+
  ylim(0,0.16)+
  labs(title = bquote('Global Warming'))+
  theme(plot.title = element_text(hjust = 0.5))+
  facet_wrap(~ VPcategory, nrow = 3)
#3 types of accounts on the AngerPercent

myplot2 <- ggplot(data = mydata) +
  geom_point(mapping = aes(x = VideoFrame, y = DisgustPercent, color = VPcategory,
                           size = ViewCount))+
  ylim(0,0.16)+
  labs(title = bquote('Global Warming'))+
  theme(plot.title = element_text(hjust = 0.5))
#3 types of accounts on the DisgustPercent


### ----------- ClimateChange Frame Producer Plot ----------- ###
### ----------- ClimateChange Frame Producer Plot ----------- ###
### ----------- ClimateChange Frame Producer Plot ----------- ###

mydata1 <- read.xlsx("/Users/liyuhan/Desktop/Tsinghua/semester3/preforICApaper/
                    FrameCode/frameProducerCode/FrameProducerCode.xlsx",1)
mydata1$VPcategory[which(mydata1$VPcategory =='1')] <- 'Governmental'
mydata1$VPcategory[which(mydata1$VPcategory =='2')] <- 'Non.Governmental'
mydata1$VPcategory[which(mydata1$VPcategory =='3')] <- 'Individual'
mydata1$VPcategory <- as.character(mydata1$VPcategory)
#translate Video Producer code into character vector

mydata1$VideoFrame[which(mydata1$VideoFrame =='2')] <- 'Impact&Outcome'
mydata1$VideoFrame[which(mydata1$VideoFrame =='3')] <- 'Scientific'
mydata1$VideoFrame[which(mydata1$VideoFrame =='4')] <- 'Action'
mydata1$VideoFrame[which(mydata1$VideoFrame =='5')] <- 'Real OR hoax'
mydata1$VideoFrame[which(mydata1$VideoFrame =='6')] <- 'Conflict'
mydata1$VideoFrame[which(mydata1$VideoFrame =='7')] <- 'Political'
mydata1$VideoFrame[which(mydata1$VideoFrame =='8')] <- 'Other'
mydata1$VideoFrame <- as.character(mydata1$VideoFrame)
#translate Video Frame code into character vector

mydata1$VPcategory <- as.character(mydata1$VPcategory)

myplot1.1 <- ggplot(data = mydata1) +
  geom_point(mapping = aes(x = AngerPercent, y = ViewCount, color = VPcategory)+
  ylim(0,0.16)+
  labs(title = bquote('Climate Change'))+
  theme(plot.title = element_text(hjust = 0.5))+
  facet_wrap(~ VPcategory, nrow = 2)
#3 types of accounts on the NegativePercent

myplot1.2 <- ggplot(data = mydata1) +
  geom_point(mapping = aes(x = VideoFrame, y = DisgustPercent, color = VPcategory,
                           size = ViewCount))+
  ylim(0,0.16)+
  labs(title = bquote('Climate Change'))+
  theme(plot.title = element_text(hjust = 0.5))
#3 types of accounts on the DisgustPercent

mybarplot1 <- ggplot(mydata1, aes(x = VideoFrame, y = AngerPercent, fill = VPcategory))+
  geom_bar(stat ="identity",width = 0.6,position = position_dodge(width=0.8))+
  scale_fill_manual(values = c("#f35e5a","#17b12b","#5086ff"))+
  theme_bw()+
  labs(x = "VideoFrame", y = "AngerPercent")+
  labs(title = bquote(""), size = 1)+
  ylim(0,0.18)+
  theme(plot.title = element_text(hjust = 0.5),
        legend.title = element_blank())# Remove the legend title.

mydf1 <- data.frame(mydata1$VPcategory, mydata1$AngerPercent, mydata1$ViewCount)
colnames(mydf1) <- c("Frame Producer", "Anger Index", "View Count")
ggpairs(data = mydf1, columns = 1:3, ggplot2::aes(colour=mydf1$"Frame Producer"),
        title = c("Climate Change"), legend = c(1,1))

#### -------- line -------- ####
#### -------- line -------- ####
#### -------- line -------- ####

mydata2 <- read.xlsx("/Users/liyuhan/Desktop/Tsinghua/semester3/preforICApaper/
                    FrameCode/frameProducerCode/FrameProducerCode.xlsx",3)

mydata2$VPcategory[which(mydata2$VPcategory =='1')] <- 'Governmental'
mydata2$VPcategory[which(mydata2$VPcategory =='2')] <- 'Non.Governmental'
mydata2$VPcategory[which(mydata2$VPcategory =='3')] <- 'Individual'
mydata2$VPcategory <- as.character(mydata2$VPcategory)

mydata2$VideoFrame[which(mydata2$VideoFrame =='2')] <- 'Impact&Outcome'
mydata2$VideoFrame[which(mydata2$VideoFrame =='3')] <- 'Scientific'
mydata2$VideoFrame[which(mydata2$VideoFrame =='4')] <- 'Action'
mydata2$VideoFrame[which(mydata2$VideoFrame =='5')] <- 'Real OR hoax'
mydata2$VideoFrame[which(mydata2$VideoFrame =='6')] <- 'Conflict'
mydata2$VideoFrame[which(mydata2$VideoFrame =='7')] <- 'Political'
mydata2$VideoFrame[which(mydata2$VideoFrame =='8')] <- 'Other'
mydata2$VideoFrame <- as.character(mydata2$VideoFrame)

mydata2$ViewCount <- as.numeric(mydata2$ViewCount)

mydf2 <- data.frame(mydata2$Theme, mydata2$AngerPercent)
colnames(mydf2) <- c("Theme", "Anger Index")
ggpairs(data = mydf2, columns = 1:3, ggplot2::aes(colour=mydf$"Theme"),legend = c(1,1))