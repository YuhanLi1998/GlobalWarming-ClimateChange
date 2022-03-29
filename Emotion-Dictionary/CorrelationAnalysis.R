#do correlation analysis in Climate Change
mydata <- read.xlsx("/Users/liyuhan/Desktop/Tsinghua/semester3/preforICApaper/
                    Data/CorrelationAnalysis/ClimateChangeResult3.0.xlsx",1)
mydata$VideoFrame[which(mydata$VideoFrame =='2')] <- 'F2'
mydata$VideoFrame[which(mydata$VideoFrame =='3')] <- 'F3'
mydata$VideoFrame[which(mydata$VideoFrame =='4')] <- 'F4'
mydata$VideoFrame[which(mydata$VideoFrame =='5')] <- 'F5'
mydata$VideoFrame[which(mydata$VideoFrame =='6')] <- 'F6'
mydata$VideoFrame[which(mydata$VideoFrame =='7')] <- 'F7'
mydata$VideoFrame[which(mydata$VideoFrame =='8')] <- 'F8'
mydata$VideoFrame <- as.factor(mydata$VideoFrame)
#将字符转换为因子

levels(mydata$VideoFrame)
mydata$VideoFrame <- relevel(mydata$VideoFrame, "F8")
#重新定义参照变量
levels(mydata$VideoFrame)

dummyVF <- model.matrix(~VideoFrame,mydata)
head(cbind(dummyVF,mydata$VideoFrame))
#method1
library("nnet")
dummyVF <- class.ind(mydata$VideoFrame)
head(dummyVF)
#method2
#choose either method1 OR method2
#attention: method1和method2稍有区别，method1生成n-1个变量，method2生成n个变量
#为了避免多重共线性，对于level=n的分类变量只需选取其任意n-1个虚拟变量

summary(model1 <- lm(PositivePercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model2 <- lm(NegativePercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model3 <- lm(AngerPercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model4 <- lm(AnticipationPercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model5 <- lm(DisgustPercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model6 <- lm(FearPercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model7 <- lm(JoyPercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model8 <- lm(SadnessPercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model9 <- lm(SurprisePercent ~ VideoFrame, family = binomial(),
                     data = mydata))
summary(model10 <- lm(TrustPercent ~ VideoFrame, family = binomial(),
                     data = mydata))


#do correlation analysis in Global Warming
mydata2 <- read.xlsx("/Users/liyuhan/Desktop/Tsinghua/semester3/preforICApaper/
                    Data/CorrelationAnalysis/GlobalWarmingResult_4.0.xlsx",1)
mydata2$VideoFrame[which(mydata2$VideoFrame =='2')] <- 'F2'
mydata2$VideoFrame[which(mydata2$VideoFrame =='3')] <- 'F3'
mydata2$VideoFrame[which(mydata2$VideoFrame =='4')] <- 'F4'
mydata2$VideoFrame[which(mydata2$VideoFrame =='5')] <- 'F5'
mydata2$VideoFrame[which(mydata2$VideoFrame =='6')] <- 'F6'
mydata2$VideoFrame[which(mydata2$VideoFrame =='7')] <- 'F7'
mydata2$VideoFrame[which(mydata2$VideoFrame =='8')] <- 'F8'
mydata2$VideoFrame <- as.factor(mydata2$VideoFrame)
#将字符转换为因子

levels(mydata2$VideoFrame)
mydata2$VideoFrame <- relevel(mydata2$VideoFrame, "F8")
#重新定义参照变量
levels(mydata2$VideoFrame)

dummyVF2 <- model.matrix(~VideoFrame,mydata2)
head(cbind(dummyVF,mydata2$VideoFrame))
#method1

summary(model1 <- lm(PositivePercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model2 <- lm(NegativePercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model3 <- lm(AngerPercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model4 <- lm(AnticipationPercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model5 <- lm(DisgustPercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model6 <- lm(FearPercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model7 <- lm(JoyPercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model8 <- lm(SadnessPercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model9 <- lm(SurprisePercent ~ VideoFrame, family = binomial(),
                     data = mydata2))
summary(model10 <- lm(TrustPercent ~ VideoFrame, family = binomial(),
                      data = mydata2))