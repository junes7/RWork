load(file = "crawl_data.RData")
final_data
url_list <- final_data[,3]
url_list
class(url_list)
url_list <- as.character(url_list)
class(url_list)
contentdata <- readLines(url_list[3],encoding = "UTF-8")
tail(contentdata)
class(contentdata)
#원하는 부분만 가지고 오기
start = which(str_detect(contentdata,"post_content"))
end = which(str_detect(contentdata,"post_ccls"))
start
end
content_filter_data <- contentdata[start:end]
content_filter_data
#데이터 정제하기
#1.벡터로 리턴하므로 한 개로 합치기
content_filter_data <- paste(content_filter_data,collapse = "")
content_filter_data

#불필요한 기호나 태그 없애기
#태그 없애기
content_filter_data <- gsub("<.*?>","",content_filter_data)
content_filter_data <- gsub("\t|&nbsp;|\"| ","",content_filter_data)
content_filter_data

#=======================================================

#final_data의 1번 글의 내용을 출력
url_content <- "https://www.clien.net/service/board/park/14745551?od=T31&po=0&category=&groupCd=community"
url_content
url_data <- readLines(url_content,encoding = "UTF-8")
url_data

str_detect(url_data,"post_subject")
subject_data <- url_data[str_detect(url_data,"post_subject")][2]
subject_data
str_ex
hit_data


filter_content <- url_data[str_detect(url_data,"post_content")]
filter_content

content <- str_extract(filter_content,"(?<=\">).*(?=<div)")
content


str_detect(url_data,"post_content")
which(str_detect(url_data,"<article>"))
myurl <- url_data[(which(str_detect(url_data,"<article>")))]
myurl



