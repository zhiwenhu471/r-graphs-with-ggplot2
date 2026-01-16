setwd("D:/R/exercise/statistic analysis")
# 使用summary()计算描述性统计量
myvars <- c("mpg", "hp", "wt")
summary(mtcars[myvars])
# 计算数据集data的偏度和峰度
library(moments)
skewness(data) # 计算偏度   
kurtosis(data) # 计算峰度

