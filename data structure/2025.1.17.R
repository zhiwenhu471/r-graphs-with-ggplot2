# 显示工作目录
getwd()
# 更改工作目录
setwd("")
options()
options(degits=3)
x <- runif(20)
summary(x)
hist(x)
pdf("histogram of X.pdf")

# 显示library所在的位置
.libPaths()
library()

lm(mpg~wt, data = mtcars)
lm.fit <- lm(mpg~wt, data = mtcars)
summary(lm.fit)
plot(lm.fit)

install.packages("vcd")
help(package="vcd")
library(vcd)
help("Arthritis")
Arthritis
example("Arthritis")
q()
y

install.packages("compareGroups")
library(compareGroups)
data("regicor")
dim(regicor)
str(regicor)

install.packages("survival")
library(survival)

y <- matrix(1:20, nrow = 5, ncol = 4)
y
z <- matrix(1:20, nrow = 5, ncol = 4, byrow = T)

# 导入示例csv数据
getwd()
mydata <- read.table("example.csv", header = T, sep = ",")
mydata
str(mydata)
mydata <- edit(mydata)
mydata

