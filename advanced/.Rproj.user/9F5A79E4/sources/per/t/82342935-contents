exam <- read.csv("csv_exam.csv")
exam
#전체 레코드의 맨 위에서부터 정의한 갯수만큼 가져오기
head(exam,n = 5)
tail(exam,4) #아래쪽부터 가져오기기
#위와 같이 변수명은 생략해도 된다.
#실제 뷰어로 보기기
View(exam)
#행의 갯수
nrow(exam)
#컬럼의 갯수
ncol(exam)

#행과 열의 갯수를 확인할 수 있는 함수
dim(exam)
#타입확인
class(exam)
#구조확인
str(exam)
#데이터에 대한 요약 정보
summary(exam)


install.packages("dplyr")
library(dplyr)
#rename(data,변경할 컬럼명 = 기존컬럼명)
exam <- rename(exam, eng=english)
exam
table(exam$eng)
qplot(exam$eng)

-------------------------------
d=data("mpg")
d
mpg <- as.data.frame(ggplot::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg) #행,열 출력

df_raw <- data.frame(var1=c(1,2,1),var2=c(2,3,2))
df_raw





