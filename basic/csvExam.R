mydatar <- read.csv("csv_exam.csv")
mydatar
mydata <- data.frame(mydatar)
mydata
mydataresult <-mydata[mydata$science>=80,]
mydataresult
#method0
mydataresult$mytotal <- as.numeric(mydataresult$math + mydataresult$english + mydataresult$science)
mydataresult
mydataresult$myavg <- round(as.numeric(mydataresult$mytotal/3),2)
mydataresult

#method1
mytotal <- c(mydataresult$math)+c(mydataresult$english)+c(mydataresult$science)

myavg <- round((c(mydataresult$math)+c(mydataresult$english)+c(mydataresult$science))/3,2)
myavg <- round(mytotal/3,2)
#--------------------
mydataresult["mytotal"]=cbind.data.frame(mytotal);
mydataresult["myavg"]=cbind.data.frame(myavg);

#method2
mytotal <- rowSums(mydataresult[,(3:5)])
myavg <- rowMeans(mydataresult[,(3:5)])
#-------------------
mydataresult=data.frame(mydataresult,mytotal,myavg);

#method3
mydataresult$mytotal <- mydataresult$math+mydataresult$english+mydataresult$science
mydataresult$mytotal
mydataresult$myavg <- mydataresult$mytotal/3

#컬럼 지울때 사용
mydataresult <- mydataresult[,-7]
mydataresult
#처리한 파일을 저장
write.csv(mydataresult,file="result1.csv")
