install.packages("mongolite")
#위에 패키지를 설치할 때는 ""(쌍 따옴표)를 붙여야 한다.
#라이브러리 올릴 때에는 ""를 붙여도 되고 안 붙여도 된다.
library("stringr")
library(mongolite)

#mongodb에 저장하기 위해서는 크롤링해야 한다.
con <- mongo(collection = "crawl",db = "bigdata",url = "mongodb://127.0.0.1")

url <- "https://www.clien.net/service/group/community?&od=T31&po=0"
url_data <- readLines(url,encoding = "UTF-8")
#readLines는 inputStream과 비슷한 기능을 한다.
url_data

#정보확인=====================================
#class(url_data)
#length(url_data)
#head(url_data)
#tail(url_data)
#==============================================
url_data[200]
#조건에 만족하는 데이터를 필터링
#문자열에 패턴을 적용해서 일치여부를 T/F로 리턴
#str_detect(패턴을 검사할 문자열,패턴)
#1. str_detect(패턴을 검사할 문자열,패턴)를 이용해서 패턴을 검사한 후 웹페이지 전체에서 필요한 데이터만 먼저 추출
str_detect(url_data,"subject_fixed")
filter_data <- url_data[str_detect(url_data,"subject_fixed")]
filter_data
#2. 추출한 데이터 전체에서 내가 필요한 문자열만 추출
#str_extract -> 패턴에 일치하는 문자열을 리턴
#후방(?<=),전방(?=) 탐색 정규 표현식식
title <- str_extract(filter_data,"(?<=\">).*(?=</span>)")
title

#위 22~29번째 줄을 이용해 원하는 패턴 추출이가능하다.
####데이터 필터링: hit(조회수)####
hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]
hit_data
#\"이거는 패턴이므로 위와 같이 주어야 한다.
hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")[-1]
hit

####데이터 필터링:url####
str_detect(url_data,"subject_fixed")
#TRUE인 위치들의 값을 뽑아준다.
which(str_detect(url_data,"subject_fixed"))
(which(str_detect(url_data,"subject_fixed"))-3)
myurl <- url_data[(which(str_detect(url_data,"subject_fixed"))-3)]
myurl
url_val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
url_val
#필요없는 문자열을 잘라내기 end = -3 : 뒤에서 3개를 잘라내기
url_val <- str_sub(url_val, end = -3)
url_val
url_val <- paste0("https://www.clien.net",url_val)
url_val

####csv파일로 생성####
title
final_data <- cbind(title,hit,url_val)
final_data
write.csv(final_data,"crawl_data.csv")
#위의 .csv파일로 저장해 읽어들이는 것보다 밑의 .RData로 저장해 읽어들이는 것이 훨씬 빠르다.
save(final_data,file = "crawl_data.RData")
length(title)
length(hit)
length(url_val)
####mongodb에 저장하는 작업####
if(con$count()>0){
  con$drop()
}
class(final_data)
#mongodb에 데이터를 저장하기 위해서 dataframe으로 변환
final_data <- data.frame(final_data)
class(final_data)
con$insert(final_data)



