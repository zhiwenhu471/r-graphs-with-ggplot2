getwd()
setwd("D:/R/exercise/spss练习")

# 读取SPSS数据“02-01”
library(Hmisc)
sp02_01 <- spss.get("例02-01.sav", use.value.labels = TRUE)
View(sp02_01)
edit(sp02_01)

hist(sp02_01)
max(sp02_01)
min(sp02_01)
boxplot(sp02_01)

gc()
summary(sp02_01)

# 对sp02_01进行单样本t检验
t.test(sp02_01, alternative = "two.sided", mu=4.1)

# 制作一个骰子
a <- 1:6
a
Sys.time()
