install.packages("ggplot2")
library("ggplot2")
mydata <- c("java","spring","bigdata","android")
mydata
qplot(mydata)
qplot(data = mpg,x = hwy)
#hwy는 mpg 데이터 안의 컬럼명이다.
qplot(data = mpg,x = hwy,y = drv)
qplot(data = mpg,x = drv,y = hwy,geom = "line")
qplot(data = mpg,x = drv,y = hwy,geom = "boxplot")
qplot(data = mpg,x = drv,y = hwy,geom = "boxplot",colour=drv)




