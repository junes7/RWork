install.packages("data.table")
library("data.table")
#install package와 library에 올리는 작업은 가장 위쪽에 해야 한다.

df <- data.frame(mydata1=1:5,
                 mydata2=letters[1:5],
                 mydata3=c("이민호","android","@한글%$@","test","한글"))
df
#####파일 write#####
write.csv(df,"encoding_test.csv",row.names = FALSE)
write.csv(df,"encoding_test_euckr.csv",row.names = FALSE,fileEncoding = "euc-kr")
write.csv(df,"encoding_test_cp949.csv",row.names = FALSE,fileEncoding = "cp949")
write.csv(df,"encoding_test_utf8.csv",row.names = FALSE,fileEncoding = "utf8")

#####깨진파일 처리하기####
read.csv("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv",encoding = "UTF-8")


####data.table - dataframe보다 강력####
dftable <- fread("encoding_test_utf8.csv")
head(dftable)
#fread는 데이터 라이브러리에서 지원되는 function이다.

####인코딩함수####
Encoding(dftable$mydata3) = "UTF-8"
head(dftable)

