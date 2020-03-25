####외부데이터 읽어오기####
####csv 파일읽기####

install.packages("splitstackshape")
library("splitstackshape")

#readLines를 이용하면 데어터가 커도 어떤 구성인지 확인하기 편하다
#readLines를 이용해 3줄을 읽어들인다.
dfimport <- readLines("01_csv.csv",n = 3)
dfimport
#csv파일이므로 ,로 구분이 되어 있지만 사용자가 원하는 구분자를 적용해서 작성한 문자열인 경우
#01_csv.csv읽은 내용을 가공해서 dataframe을 작성
dfcsv <- data.frame(num=1:3,mydata = dfimport,stringsAsFactors = FALSE)
#mydata = dfimport를 통해 모든 데이터를 하나의 컬럼에 집어넣었다.
dfcsv$num
dfcsv$mydata #컬럼안의 문자열이, 가 추가
#,로 분리는 되지만 list로 결과가 리턴되어 불편
strsplit(dfcsv$mydata,split = ",")
strsplit(dfcsv$mydata,split = ",")[[1]]
strsplit(dfcsv$mydata,split = ",")[[2]]
#문자열 분리해주는 작업이다.
#문자열을 분리해주기 위한 package
#하나의 컬럼안에 구분자로 텍스트가 구성된 경우 분리한다.
library("splitstackshape")
dfcsv2 <- cSplit(indt = dfcsv,splitCols = "mydata", sep = ",")
dfcsv2
class(dfcsv2)

#alt +를 눌렀을 때
#ｓｄｆｓｄｆｓｄｆｓｄｆ
#alt +를 안 눌렀을 때
#adsfasdfsdfsfd

#타입변경
#as의 함수들을 이용해서 변경as는 ~~~가 아닌 것을 ~~~로 변경한다는 의미 - data.table과 data.frame의 속성을 가지고 있는 dfcsv2를 data.frame으로 변경
dfcsv2 <- as.data.frame(dfcsv2)
class(dfcsv2) #타입을 확인
class(dfcsv2$num)
class(dfcsv2$mydata_1)
class(dfcsv2$mydata_2)
class(dfcsv2$mydata_3)
class(dfcsv2$mydata_4)
class(dfcsv2$mydata_5)
class("dd")
dfcsv2
str(dfcsv2) #전체 데이터의구조를 확인
#변환한 데이터들의 타입이 Factor
#Factor는 순서와 명목형
#1,2,3,.......의 값이 어떤 순서를 의미하는 경우: 컬럼의 데이터가 순서형 #class 컬럼 1,2,3,4.....:순서를 의미하지 않고 1반,2반,3반.....
#순서가 적용되도록 정의된 Factor타입을 char로 변경
#1번 컬럼을 뺀 나머지 컬럼의 타입을 char로 변환
for(i in 2:ncol(dfcsv2)){
  dfcsv2[,i] = as.character(dfcsv2[,i])
  
}

str(dfcsv2)

####tsv파일읽기####
#tab으로 구분된 파일(\t)
df3 <- read.delim("02_tsv.txt",sep="\t")
head(df3)
#StringTokenizer와 같은 역할


####xml파일읽기####
install.packages("XML")
library("XML")
?xmlTreeParse
dfxml = xmlTreeParse("03_xml.xml")
#밑에 실행하기 전에 먼저 윗 줄에서 parsing을 해 주어야 한다.
dfxml
#아래의 xmlRoot를 실행하면 태그만 남고 밑의 다른 내용(파일에 대한 정보)들은 다 사리진다.
#root element와 하위엘리먼트만 추출
dfxml <- xmlRoot(dfxml)
dfxml

#xml에 있는 모든 태그의 name과 value를 추출한다.
#-xxxApply함수는 for문 대신으로 사용할 수 있는 함수
dfxml <- xmlSApply(dfxml,function(x){
    xmlSApply(x,xmlValue)
})
dfxml
dfxml <- data.frame(t(dfxml),row.names = NULL)
dfxml
#xmlSApply는 xml에 대해서 뭔가 반복적으로 작업을 해줄 수 있게 해주는 함수이다.

####xlsx파일읽기####
install.packages("readxl")
library(readxl)
dfxlsx <- read_xlsx("07_xlsx.xlsx")
dfxlsx #tibble => data.frame과 비슷한 다른 종류의 라이브러리
