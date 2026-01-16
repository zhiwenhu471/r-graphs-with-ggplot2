# 删除当前工作环境中的几乎所有对象
rm(list = ls())

# 得到当前工作目录
getwd()
# 更改工作目录
setwd("D:/R/exercise/figures first")
getwd()

# 一条最优拟合曲线
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)

# 病人对不同药物剂量水平的响应情况
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
# 创建图形
plot(dose, drugA, type = "b")
# 修改图形参数，通过par()来指定
# 添加参数 no.readonly=TRUE 可以生成一个可以修改的当前图形参数列表
opar <- par(no.readonly = T)
par(lty = 2, pch = 17)
plot(dose, drugA, type = "b")
par(opar)
plot(dose, drugA, type = "b", lty = 3, lwd = 3, pch = 15, cex = 1)

# 指定颜色
rainbow(10)
install.packages("RColorBrewer")
library(RColorBrewer)
n <- 7
mycolors <- brewer.pal(n, "Set1")
barplot(rep(1, n), col = mycolors)

# 多阶灰度色
n <- 10
mycolors <- rainbow(n)
pie(rep(1, n), labels = mycolors, col = mycolors, radius = 1, 
    main = "pie plot")

# 绘制饼图
mycolors <- c("red", "green", "blue", "yellow")
n <- length(mycolors)
pie(rep(1, n), labels = mycolors, col = mycolors)

pie(rep(1, n), labels = mycolors, col = mycolors, 
    explode = c(0, 0.2, 0, 0), main = "pie plot")

# 自定义坐标轴的示例
# 生成数据
x <- c(1:10)
y <- x
z <- 10/x
z
# 增加边界大小
opar <- par(no.readonly = T)
par(mar = c(5, 4, 4, 8) + 0.1)
# 绘制x对y的图形
plot(x, y, type = "b", pch = 21, col = "red", yaxt = "n", lty = 3, ann = F)
# 添加x对1/x的曲线
lines(x, z, type = "b", pch = 22, col = "blue", lty = 2)
# 绘制自己的坐标轴
axis(2, at = x, labels = x, col.axis = "red", las = 2)
axis(4, at = z, labels = round(z, digits = 2), col.axis = "blue", las = 2,
     cex.axis = 0.7, tck = -.01 )
# 添加标题和文本
mtext("y=1/x", side = 4, line = 3, cex.lab = 1, las = 2, col = "blue")
title("An example of Creative Axes", 
      xlab = "X values",
      ylab = "Y=X")
library(Hmisc)
minor.tick(nx = 2, ny = 2, tick.ratio = 0.5)
# 添加参考线
abline(h = 7, lty = 2, col = "blue")
abline(v = 6, lty = 2, col = "red")
par(opar)

# 保存当前图形参数
opar <- par(no.readonly = TRUE)

# 修改图形参数，例如调整绘图区域大小
par(mfrow = c(2, 2))  # 将绘图区域分成2行2列

# 绘制多个图形
plot(1:10)
hist(rnorm(100))
boxplot(mtcars)
# ...

# 恢复原始图形参数
par(opar)

opar <- par(no.readonly = TRUE)
par(lwd = 2, cex = 1, font.lab = 2)
# 绘制图形
plot(dose, drugA, type = "b",
     pch = 15, lty = 1, col = "red", ylim = c(0,60), 
     main = "DrugA vs. DrugB",
     xlab = "Drug dosage", ylab = "Drug response")
lines(dose, drugB, type = "b",
      pch = 17, lty = 2, col = "blue")
abline(h = c(30), lwd = 1.5, lty = 2, col = "grey")
# 添加次要刻度线
library(Hmisc)
minor.tick(nx = 3, ny = 3, tick.ratio = 0.5)
# 添加图例
legend("topleft", inset = .05, title = "Drug Type", c("A", "B"),
       lty = c(1, 2), pch = c(15, 17), col = c("red", "blue"))
par(opar)

# 添加文本标注
attach(mtcars)
plot(wt, mpg, main = "Mileage vs. Car Weight", 
     xlab = "Weight", ylab = "Mileage",
     pch = 18, col = "blue")
text(wt, mpg, 
     row.names(mtcars),
     cex = 0.6, pos = 4, col = "red")
detach(mtcars)

# 不同字体族
opar <- par(no.readonly = T)
par(cex = 1)
plot(1:7, 1:7, type = "n")
text(3, 3, "Example of default text")
text(4, 4, family = "mono", "Example of mono-spaced text")
text(5, 5, family = "times new roman", "Example of times new roman text")
text(6, 6, family = "serif", "Example of serif text")
