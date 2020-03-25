#dataframe만들기 - 1. matrix를 dataframe으로 변환
#2.벡터를 여러 개 만들어서 dataframe을 작성
eng <- c(100,99,90)
math <- c(100,99,100)
mydf1 <- data.frame(eng,math)
mydf1
mean(mydf1$eng)
mean(mydf1$math)
#3.dataframe을 직접 정의하는 방법
mydf2 <- data.frame(eng=c(100,100,100),math=c(90,90,90))
mydf2

제품 <- c("사과","딸기","수박")
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
mydf3 <- data.frame(제품,가격,판매량)
mydf3


mean(mydf3$가격)
mean(mydf3$판매량)
mydf3$제품

#생성이 완료되어 사용중인 matrix, dataframe의 행과 열을 변경
#transpose이용해 행과열을 변경
m <- matrix(1:15,ncol = 3,byrow = T)
m
m <- t(m)
m
d <- data.frame(m)
d
d <- t(d)
d


