test1 <- data.frame(id=c(1,2,3,4,5),
                    mid_jumsu = c(77,56,99,100,99))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final_jumsu = c(77,56,99,100,99))
test1
test2
final_data <- left_join(test1,test2,by="id")
final_data

namedata <- data.frame(class=c(1,2,3,4,5),
                teacher=c("kim","lee","park","jang","hong"),
                stringsAsFactors = FALSE)
str(namedata)
exam
exam_new <- left_join(exam,namedata,by="class")
#left_join() 함수 이용
#기준으로 삼을 변수명을 by에 지정
#변수명 앞뒤에 따옴표 입력
#oracle의 exam.class = namedata.class와 같은 의미이다.

exam_new

groupA <- data.frame(id=c(1,2,3,4,5),
                    mid_jumsu = c(77,56,99,100,99))
groupB <- data.frame(id=c(6,7,8,9,10),
                    mid_jumsu = c(77,56,99,100,99))

group_total <- bind_rows(groupA,groupB)
group_total






