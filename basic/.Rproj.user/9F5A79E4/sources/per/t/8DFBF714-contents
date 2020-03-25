#행렬(매트릭스)
matrix(1:15)
#? matrix
mymat1 <- matrix(1:15,ncol = 3)
mymat1
#1부터 15까지 값을 3개의 열로 표현, row방향 값을 추가
mymat1 <- matrix(1:15,ncol = 3,byrow = T)
mymat1
#matrix에서 원하는 값을 추출하기
mymat1[2,2] #행,열열
mymat1[3,3]
#1행에 1열,2열,3열 데이터 추출하기
mymat1[1,c(1:3)]
#1행의 모든 열 추출하기
mymat1[1,]
#1열의 모든 값 추출하기
mymat1[,1]
#1행과 3행을 뺀 데이터
mymat1[-c(1,3),]
#1행과 3행 데이터
mymat1[c(1,3),]
####미니실습1 -2행부터 4행까지 출력(단,2번 3번 컬럼만)
mymat1[c(2:4),c(2,3)]
mymat1[2:4,c(2,3)]
#cbind는 컬럼을 추가하는 함수 - 값이 부족하면 맨 앞의 값이 채워진다.
#rbind는 row를 추가하는 함수
addmymat1 <- cbind(mymat1,c(1,11,111,1111))
addmymat1
addmymat2 <- rbind(mymat1,c(1,11,111,1111))
addmymat2
colnames(mymat1) <- c("a","b","c")
mymat1
rownames(mymat1) <- c("r1","r2","r3","r4","r5") 
mymat1
mean(mymat1)
#====================matrix exam=========================
m1 <- matrix(c(80,90,70,100),ncol=4,byrow = T)
colnames(m1) <- c("국어","영어","과학","수학")
m1 <- rbind(m1,c(80,99,78,72))
m1 <- rbind(m1,c(90,78,82,78))
m1 <- rbind(m1,c(99,89,78,90))
m1
rownames(m1) <- c("kim","lee","hong","jang")
m1
avg_name <- rowMeans(m1)
avg_name
avg_subject <- colMeans(m1)
avg_subject
#=======================강사님 풀이===========================
myjumsuMat <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90),nrow = 4,byrow = T)
myjumsuMat
colnames(myjumsuMat) <- c("국어","영어","과학","수학")
rownames(myjumsuMat) <- c("kim","lee","hong","jang")
myjumsuMat
#avg_name <- rowMeans(myjumsuMat)
avg_name <- c(mean(myjumsuMat[1,]),mean(myjumsuMat[2,]),mean(myjumsuMat[3,]),mean(myjumsuMat[4,]))
avg_name
#avg_subject <- colMeans(myjumsuMat)
avg_subject <- c(mean(myjumsuMat[,1]),mean(myjumsuMat[,2]),mean(myjumsuMat[,3]),mean(myjumsuMat[,4]))
avg_subject