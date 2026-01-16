# 设置工作目录
setwd("D:/R/exercise/新建文件夹")

# 加载需要用到的包
library(overlap)
library(readxl)
library(activity)
library(openxlsx)

# 导入并查看数据
data <- read_excel("panda日活动节律.xlsx")
View(data)

timeRad <- data$Time*2*pi
panda1 <- timeRad[data$Season == 'winter' & data$Species == 'panda']
rawdata <- read.xlsx("panda日活动节律.xlsx", sheet = 1)
str(rawdata)
range(rawdata$Time)
timerad <- rawdata$Time*2*pi
str(rawdata)
panda <- timerad[rawdata$Species == 'panda']
png("panda.png")
densityPlot(panda, adjust=1, rug=TRUE, 
            main="大熊猫活动节律图", xlab="时间 time", ylab="密度 density",
            col=1, lwd=2, ylim=c(0, 0.5))
legend('topright', c("大熊猫 panda"), lwd=1, col="black", bty='n')
