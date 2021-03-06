library("stringr")
library("dplyr")
install.packages("rvest")
library("rvest")
library("httr")
install.packages("lubridate")
library("lubridate")
library("ggplot2")
install.packages("psych")
library("psych")
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
####데이터 수집 및 전처리####
prepro<-data.frame()
url <- "https://www.bobaedream.co.kr/cyber/CyberCar.php?sel_m_gubun=ALL&maker_no=49&group_no=5&page=1&order=S11&view_size=100"
readPage <- read_html(url,encoding="utf-8")
readPage %>% html_nodes("li.product-item") -> data
data 

readPage %>% html_nodes(".tit > a") %>% html_attr("title") -> title
company <- str_remove(title," (?<=\\s).*")
model <- str_remove(title,".\\w(?>\\s)")
readPage %>% html_nodes(".mode-cell.year > .text") %>% html_text() -> yy
yy
yy <- paste("20",yy)
yy <- gsub("\\(.*?\\)|&nbsp;| ","", yy)
mm <- gsub(".*/","",yy)
yy <- gsub("/.*","",yy)
yy <- as.integer(yy)
mm <- as.integer(mm)
old <- ((year(now())-yy)*12 + (month(now())-mm))
old

readPage %>% html_nodes(".mode-cell.fuel > .text") %>% html_text() -> fuel
fuel

readPage %>% html_nodes(".mode-cell.km > .text") %>% html_text() -> km
km <- gsub("천","000",km)
km <- gsub("만","0000",km)
km <- gsub("km","",km)
km <- as.numeric(km)
km

readPage %>% html_nodes(".mode-cell.price") -> price
price <- gsub("<.*?>|\r|\n|\t|&nbsp;","", price)
price <- gsub("  ","",price)
price <- gsub("만원|,","",price)
price <- price[-1]
price

result <- data.frame(company,model,old,fuel,km,price, stringsAsFactors = F)
temp <- result[!(result$price == "팔림"),]
temp <- temp[!(temp$price == "계약"),]
temp <- temp[!(temp$price == "할부"),]
temp <- temp[!(temp$price == "만료"),]
temp <- temp[!(temp$price == "운용리스"),]

temp$price <- as.numeric(temp$price)

prepro <- bind_rows(prepro,temp)

#### 결과 확인 ####
#1.요약
summary(prepro)
boxplot(prepro$km)
boxplot(prepro$old)
boxplot(prepro$price)
table(prepro$fuel)

#2.막대그래프-km분포
ggplot(data=prepro, aes(x = prepro$km))+geom_bar()

#3.correlation
cor(prepro[c(2,4,5)])
pairs(prepro[c(2,4,5)])


#### 이상치제거 ####

prepro$old <- ifelse(prepro$old < 0 | prepro$old > 1000, NA, prepro$old)
prepro <- na.omit(prepro)

cor(prepro[c(3,5,6)])
pairs(prepro[c(3,5,6)])

#correlation 확대
#plot(prepro$old, prepro$price)
#plot((prepro$km), prepro$price)


#### regression ####
out = lm(price~old+km, data=prepro)
out
summary(out)
confint.default(out)
plot(out)

pairs(prepro$price~prepro$old+prepro$km, lower.panel = NULL)
pairs.panels(prepro,method = "pearson", density = TRUE, ellipses = TRUE, hist.col = "#00AFBB",scale=TRUE)

prediction <- round(predict(out,prepro,interval = "prediction"),0)
prepro[,"prediction"] <- prediction[,1]
prepro[,"diff"] <- prepro$price - prepro$prediction
prepro<-prepro[order(prepro$title),]

prepro
ggplot(data=prepro[], aes(x=prepro[]$title,y=prepro[]$diff))+ geom_point()

ggplot(data=prepro[], aes(x=prepro[]$price,y=prepro[]$prediction))+geom_point(alpha = 1, aes(color=company))

plot(prediction~price,data = prepro, xlim=c(0,2000), ylim=c(0,2000))
abline(a = 0,b = 1,col="red")


