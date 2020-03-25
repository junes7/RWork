#1부터 10까지 순서가 랜덤하게 숫자가 발생되어 들어간다.
#size=5는 숫자 개수가 5개 들어간다는 말이다.
#replace는 중복허용 유무이다.
#replace = FALSE는 중복을 허용하지 않는다.
#replace = TRUE는 중복을 허용하고 기존에 사용했던걸 다시 사용할 수 있다.
#set.seed는 값이 바뀌지 말라고 설정해 놓은 것이다.
set.seed(121)#1222는 랜덤한 수를 찾아가게 만들어주는 key값이다.
a <- sample(1:10,size = 5,replace=FALSE)
a
#if문의 역할을 하는 함수 - ifelse
set.seed(1221)
ifdf <- data.frame(mynum=1:6,
                   myval=sample(c("spring","bigdata"),
                                size = 6,
                                replace = TRUE))
ifdf
#myval의 값이 spring이면 프로젝트완료, bigdata이면 할꺼야
for(i in 1:nrow(ifdf)){
  if(ifdf[i,"myval"]=="spring"){
    ifdf[i,"info"] <- "프로젝트완료"
  } else {
    ifdf[i,"info"] <- "할꺼야"
  }
}
ifdf

#위 작업을 함수를 이용해서 할것 - info2
#excel에서 쓰는 ifelse와 동일하다
ifdf[,"info2"] <- ifelse(test=ifdf$myval=="spring",
                         yes="쉽다",
                         no="할꺼다")
ifdf

#조건이 두 개 이상인 경우 처리
ifdf[,"info3"] <- ifelse(test=ifdf$myval=="spring",
                         yes="쉽다",
                         no=ifelse(test=ifdf$myval=="bigdata",
                                   yes = "머신셋팅"),
                                   no="device셋팅완료"))
ifdf

#ifdf[,"info4"] <- "쉽다"
#ifdf
#ifdf[,"info4"] <- ifelse(test=ifdf$myval=="spring",
#                         yes="쉽다",
#                         no=ifelse(test=ifdf$myval=="bigdata",
#                                 yes = "머신셋팅"),
#                        no="device셋팅완료"))
#ifdf















