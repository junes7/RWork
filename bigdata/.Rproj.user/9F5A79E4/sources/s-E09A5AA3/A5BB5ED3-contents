####모두의 광장의 1페이지: 10페이지의 모든 게시글을 크롤링####
#1. 모든 페이지의 title,hit,url,content 추출하기
#2. crawl_result.csv, crawl_result.RData저장
#3. mongodb저장(300개저장)
#4. for문, if문 활용 | 중간에 어떤 문제가 발생하는지 확인해줄것

library(stringr)
library(mongolite)
conn <- mongo(collection = "crawlpage",db = "bigdata",url = "mongodb://127.0.0.1")

# i <- 0
# class(i)
final_data_list=NULL
#urllink <- "https://www.clien.net/service/group/community?&od=T31&po="
for(i in c(0:9)){
  urllinkpage <- paste0("https://www.clien.net/service/group/community?&od=T31&po=",i)


urllinkpage
url_data <- readLines(urllinkpage,encoding = "UTF-8")

filter_data <- url_data[str_detect(url_data,"subject_fixed")]
filter_data
title <- str_extract(filter_data,"(?<=\">).*(?=</span>)")
title <- gsub("\"","",title)
title
hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]
hit_data
hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")[-1]
hit
str_detect(url_data,"subject_fixed")
#TRUE인 위치들의 값을 뽑아준다.
str_detect(url_data,"subject_fixed")
which(str_detect(url_data,"subject_fixed"))
(which(str_detect(url_data,"subject_fixed"))-3)
myurl <- url_data[(which(str_detect(url_data,"subject_fixed"))-3)]
url_val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
url_val
#필요없는 문자열을 잘라내기 end = -3 : 뒤에서 3개를 잘라내기
url_val <- str_sub(url_val, end = -3)
url_val
url <- paste0("https://www.clien.net",url_val)
url

####url을 이용해서 content 항목 추출####
contentlist=NULL #최초 변수 선언 시 null로 초기화
content_data=NULL
for(page in 1:length(url)){
  content <- readLines(url[page],encoding = "UTF-8")
  start = which(str_detect(content,"<article>"))
  end = which(str_detect(content,"</article>"))
  
  content_filter <- content[start:end]
  content_data <- paste(content_filter,collapse = "")
  content_data <- gsub("<.*?>","",content_data)
  content_data <- gsub("\t|&nbsp;|\"| ","",content_data)
  #기존의 저장되어 있는 contentlist의 내용에 추가
  contentlist <- c(contentlist,content_data)
  cat("\n",page)
}
final_data <- cbind(title,hit,url,contentlist)
final_data_list <- rbind(final_data_list,final_data)
#cat("\n","outer:"+i)
}
write.csv(final_data_list,"crawl_data_list.csv")
#위의 .csv파일로 저장해 읽어들이는 것보다 밑의 .RData로 저장해 읽어들이는 것이 훨씬 빠르다.
save(final_data_list,file = "crawl_data_list.RData")

####mongodb에 저장하는 작업####
if(conn$count()>0){
  conn$drop()
}
class(final_data_list)
#mongodb에 데이터를 저장하기 위해서 dataframe으로 변환
final_mongo_data <- data.frame(final_data_list)

conn$insert(final_mongo_data)

