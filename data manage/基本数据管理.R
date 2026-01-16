getwd()
setwd("D:/R/exercise/data manage")
getwd()

# 删除当前工作环境中的几乎所有对象
rm(list = ls())

# 创建leadership数据框
manager <- c(1,2,3,4,5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "M", "F", "M")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
leadership <- data.frame(manager, date, country, gender, age, q1, 
                         q2, q3, q4, q5, stringsAsFactors = T)

# 创建新变量
mydata <- data.frame(x1 = c(2, 2, 6, 4),
                     x2 = c(3, 4, 2, 8))
mydata <- transform(mydata, 
                    sumx = x1 + x2,
                    meanx = (x1 + x2)/2)
mydata

# 变量的重编码
leadership$age[leadership$age == 99] <- NA
leadership <- within(leadership, {
  agecat <- NA
  agecat[age > 75] <- "Elder"
  agecat[age >= 55 & age <= 75] <- "middle aged"
  agecat[age <55] <- "Young"
})
# 变量的重命名
fix(leadership)
leadership

# 缺失值，使用is.na()函数
is.na(leadership[,6:10])

# 使用na.omit()删除不完整的观测
leadership
newdata <- na.omit(leadership)
newdata

myformat <- "%m/%d/%Y"
leadership$date <- as.Date(leadership$date, myformat)
leadership

# 返回当天的日期
Sys.Date()
date()

# 日期计算
# 我
startdate <- as.Date("2003-08-04")
nowdate <- as.Date("2025-1-22")
days <- nowdate - startdate
days
# 涵涵
startdate1 <- as.Date("2004-03-07")
nowdate1 <- as.Date("2025-1-22")
days1 <- nowdate1 - startdate1
days1
days - days1

newdata <- leadership[order(leadership$age), ]
newdata
