#ggplot2패키지에서 제공되는 mpg데이터를 분석
install.packages("ggplot2")
library(ggplot2)
####step1. mpg를 dataframe으로 변경####
mpg <- as.data.frame(mpg)
dim(mpg) #행, 열 갯수 확인
####step2. mpg의 정보를 출력 ####
#행 갯수, 열의 갯수, 위에서 10개, 끝에서 10개 출력
#행 갯수
nrow(mpg)
#컬럼의 갯수
ncol(mpg)
#위에서 10개
head(mpg,n = 10)
#끝에서 10개
tail(mpg,10)
####step3. mpg의 컬럼명을 변경####
# cty => city  hwy => highway
library("dplyr")
mpg <- rename(mpg,city=cty,highway=hwy)
mpg
#####Step4.파생변수 생성하기#####
#total 컬럼을 추가=>cty와 hwy의 합
mpg$total <- mpg$city + mpg$highway
mpg$total
#avg 컬럼을 추가=>cty와 hwy의 평균
mpg$avg <- (mpg$city + mpg$highway)/2
mpg$avg

####Step05.생성된 total을 가지고 요약정보 확인
summary(mpg$total)

#####Step06. info 컬럼 추가####
#total값을 이용해서 평가 - 30이상이면 pass, fail
mpg[,"pass/fail"] <- ifelse(test=mpg$total>=30,
                         yes="pass",
                         no="fail")
mpg
#####Step07. grade 컬럼 추가####
#total값을 이용해서 평가 - 40이상이면 A, 35이상 B, 30이상 C ,나머지 D
mpg[,"grade"] <- ifelse(test=mpg$total>=40,
                        yes="A",
                        no=ifelse(test=mpg$total>=35,
                                  yes = "B",
                        no=ifelse(test=mpg$total>=30,
                                  yes = "c",
                        no="D")))
mpg








