library("stringr")
#패턴
mytext <- "     test$uuuuu"
mytext2 <- "https://cran.r-project.org/"
#패턴과 일치하는 문자열도 리턴
#콜론을 포함한 문자가 나온다.
#패턴과 일치하는 문자열도 리턴
str_extract(mytext2,".+(:)")
#:콜론을 제외한 나머지 문자가 나온다.
#패턴과 일치하는 문자를 찾아 일치 문자 바로 전까지 리턴
str_extract(mytext2,".+(?=:)")

str_extract(mytext2,".+(?<=:)")

str_extract(mytext2,".+(?=:)") #전방탐색(?=)

str_extract(mytext,".+(?=\\$)")
str_extract(mytext,".+(?<=\\$)")

str_extract(mytext,".+(?<=\\$).")

str_extract(mytext,".(?<=\\$).*") #후방탐색(?<=)

#문자열관련 함수
#paste - 벡터를 연결해서 하나의 문자열로 생성
#paste0 - 여러 개를 연결
str <- c("java","hadoop","R","mongodb")
paste(str,collapse = ",")
paste0(mytext,mytext2)
#문자열안의 특정 문자열을 replace
data <- gsub("u","U",mytext)
data
str_trim(data) #공백제거




