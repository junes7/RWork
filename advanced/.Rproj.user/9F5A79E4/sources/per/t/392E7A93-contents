library("dplyr")
exam <- read.csv("csv_exam.csv")
exam
# %in%기호는 변수의 값이 지정한 조건 목록에 해당하는지 확인하는 기능이다.
#filter : 조건을 정의
exam %>%
  filter(class==1) %>%
  filter(math>=50)

#select - 추출하고 싶은 변수를 정의
#select에서 여러개 나열해서 조건으로 걸러줄 수 있다.
exam %>% select(-math)
exam %>% select(id,math,english)

exam %>% 
  filter(class==1) %>% 
  select(id,math,science)

exam <- rename(exam,eng=english)

#arrange
exam %>% arrange(id)
exam %>% arrange(desc(id))
exam %>% arrange(class,desc(english))

#mutate - 파생변수 추가하기 (원본에 없는 컬럼 추가)
exam %>% 
  mutate(total=math+english+science,
         mean = total/3,
         info = ifelse(science>=70,"통과","재시험"))
exam
  
exam %>%
  group_by(class) %>% 
  summarise(math_sum = sum(math),
            math_mean = mean(math),
            math_median = median(math),
            math_count = n())

#-----------------------------------------  


