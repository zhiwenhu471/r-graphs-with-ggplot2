setwd("D:/R/exercise/ggplot2")
getwd()

library(ggplot2)
ggplot(data = mpg, aes(x = cty, y = hwy))

b <- ggplot(seals, aes(x = long, y = lat))
b
b <- b + geom_blank()
b

if (!require("pacman")) install.packages("pacman")
p_load(ggplot2, ggthemes, dplyr, readr)

# 快捷添加注释 ctrl+shift+c

# 初画图形
chilean_exports <- "year,product,export,percentage
2006,copper,4335009500,81
2006,others,1016726518,19
2007,copper,9005361914,86
2007,others,1523085299,14
2008,copper,6907056354,80
2008,others,1762684216,20
2009,copper,10529811075,81
2009,others,2464094241,19
2010,copper,14828284450,85
2010,others,2543015596,15
2011,copper,15291679086,82
2011,others,3447972354,18
2012,copper,14630686732,80
2012,others,3583968218,20
2013,copper,15244038840,79
2013,others,4051281128,21
2014,copper,14703374241,78
2014,others,4251484600,22
2015,copper,13155922363,78
2015,others,3667286912,22
"
exports_data <- read_csv(chilean_exports)
p1 <- ggplot(aes(y = export, x = year, colour = product), data = exports_data) +
  geom_line()
p1

# 调整线条宽度
p1 <- ggplot(aes(y = export, x = year, colour = product), data = exports_data) +
  geom_line(size = 1.5)
p1

# 改变变量显示方式
# mutate()函数：用于添加新的变量或修改现有变量
exports_data <- exports_data %>%
  mutate(product = factor(product, levels = c("copper","others"),
                          labels = c("Copper ","Pulp wood, Fruit, Salmon & Others")))
p1 <- ggplot(aes(y = export, x = year, colour = product),
             data = exports_data) +
  geom_line(size = 1.5) +
  theme(legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_blank())
p1

# na.rm=T的作用是在计算时忽略缺失值（NA）

# 调整X轴坐标间距（scale）
p1 <- p1 + scale_x_continuous(breaks = seq(2006,2015,1))
p1

# 调整坐标轴标签以及添加标题
p1 <- p1 +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million")
p1

# 调整颜色画板
colour <- c("#5F9EA0", "#E1B378")
p1 <- p1 + scale_colour_manual(values = colour)
p1

# 使用白色主题
p1 <- ggplot(aes(y = export, x = year, colour = product),
             data = exports_data) +
  geom_line(size = 1.5) +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  scale_colour_manual(values = colour) +
  theme_bw() + # 使用theme_bw()函数
  theme(legend.position = "bottom",
        legend.direction = "horizontal",
        legend.title = element_blank())
p1

# 更改字体
install.packages("showtext")
p_load(showtext) #p_load 是 R 语言中的一个函数，来自 pacman 包,可以实现自动
# 安装缺失的包，一次性加载多个包，检查包的版本，从GitHub加载包
font_add("Tahoma","Tahoma.ttf")
font_add("XKCD","xkcd-Regular.otf")
font_add("Roboto Condensed", "RobotoCondensed-Regular.ttf")
font_add("Decima Mono Pro","DecimaMonoPro.otf")
font_add("Atlas Grotesk Regular","AtlasGrotesk-Regular.otf")
font_add("Atlas Grotesk Medium","AtlasGrotesk-Medium.otf")
showtext_auto()

# 创造一张XKCD风格的表格
fill <- c("#40b8d0","#b2d183")
p1 <- ggplot(aes(y = export, x = year, colour = product),
             data = exports_data) +
  geom_line(size = 1.5) +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  scale_fill_manual(values = fill) +
  theme(axis.line.x = element_line(size = .5, colour = "black"),
        axis.line.y = element_line(size = .5, colour = "black"),
        axis.text.x = element_text(colour = "black", size = 10),
        axis.text.y = element_text(colour = "black", size = 10),
        legend.key = element_rect(fill = "white", colour = "white"),
        legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), panel.border = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(family = "XKCD"),
        text = element_text(family = "XKCD"))
p1

# 使用经济学人的主题
p1 <- ggplot(aes(y = export, x = year, colour = product),
             data = exports_data) +
  geom_line(size = 1.5) +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  theme_economist() + scale_colour_economist() +
  theme(axis.line.x = element_line(size = .5, colour = "black"),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.title = element_blank(),
        plot.title = element_text(family = "Roboto Condensed"),
        text = element_text(family = "Roboto Condensed"))
p1

# 使用“five thirty eight”主题
p1 <- ggplot(aes(y = export, x = year, colour = product),
             data = exports_data) +
  geom_line(size = 1.5) +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  theme_fivethirtyeight() + scale_colour_fivethirtyeight() +
  theme(axis.title = element_text(family = "Atlas Grotesk Regular"),
        legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_blank(),
        plot.title = element_text(family = "Atlas Grotesk Medium"),
        legend.text = element_text(family = "Atlas Grotesk Regular"),
        text = element_text(family = "Decima Mono Pro"))
p1

# 创造属于自己的主题
colour <- c("#40b8d0", "#b2d183")
p1 <- ggplot(aes(y = export, x = year, colour = product),
             data = exports_data) +
  geom_line(size = 1.5) +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  scale_colour_manual(values = colour) +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        axis.text.x = element_text(colour = "black", size = 10),
        axis.text.y = element_text(colour = "black", size = 10),
        legend.key = element_rect(fill = "white", colour = "white"),
        legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_blank(),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"))
p1
# 在图形中增加标记的点
colour <- c("#40b8d0", "#b2d183")
p1 <- ggplot(aes(y = export, x = year, colour = product),
             data = exports_data) +
  geom_line(size = 1.5) +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  scale_colour_manual(values = colour) +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        axis.text.x = element_text(colour = "black", size = 10),
        axis.text.y = element_text(colour = "black", size = 10),
        legend.key = element_rect(fill = "white", colour = "white"),
        legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_blank(),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"),
        legend.key.size = unit(2, 'lines')) +
  geom_point(size = 3)
p1
