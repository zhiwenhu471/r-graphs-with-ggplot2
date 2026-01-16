rm(list = ls())

setwd("D:/R/exercise/LOWESS plots")
getwd()

if (!require("pacman")) install.packages("pacman")
p_load(datasets, ggplot2, ggthemes, grid, RColorBrewer)
data(airquality)

# 画LOWESS图
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  stat_smooth(method = "loess")
p12

p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  geom_smooth(method = lm)
p12

m1 <- summary(lm(Ozone ~ Temp, data = airquality))
m1$adj.r.squared

p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point(shape = 1) +
  stat_smooth(method = "lm", formula = y ~ x + I(x^2))
p12

m2 <- summary(lm(Ozone ~ Temp + I(Temp^2), data = airquality))
m2$adj.r.squared

# Changing the width of the bins
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  geom_smooth(method = "loess", n = 5)
p12

# Customising axis labels
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  stat_smooth(method = "loess") +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in parts per billion")
p12

p12 <- p12 + scale_y_continuous(name = "Mean ozone in\nparts per billion")
p12

# Changing axis ticks
p12 <- p12 + scale_y_continuous(name = "Mean ozone in\nparts per billion",
                                breaks = seq(0, 150, 25), limits = c(0, 150))
p12

# Adding a title
p12 <- p12 +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12

# Changing the colour and size of the LOWESS curve
fill <- "gold1"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  geom_smooth(method = "loess", colour = fill) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12
# 颜色再变
fill <- "#4271AE"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  geom_smooth(method = "loess", colour = fill) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12

fill <- "#4271AE"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  geom_smooth(method = "loess", colour = fill, size = 1.5) + # 增加线条厚度
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12

# Changing the appearance of the confidence interval，改变透明度
fill <- "#4271AE"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  geom_smooth(method = "loess", colour = fill, size = 1.5, alpha = 0.2) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12

fill <- "#4271AE"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  geom_smooth(method = "loess", colour = fill, size = 1.5,
              alpha = 0.2, fill = fill) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12

fill <- "#4271AE"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point() +
  geom_smooth(method = "loess", colour = fill, size = 1.5, se = FALSE) + # 不显示置信区间
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12

# Changing the appearance of the scatterplot
fill <- "#4271AE"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point(shape = 21, colour = "darkblue") +
  geom_smooth(method = "loess", colour = fill, size = 1.5,
              alpha = 0.2, fill = fill) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12

fill <- "#4271AE"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_smooth(method = "loess", colour = fill, size = 1.5,
              alpha = 0.2, fill = fill) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 125, 25), limits = c(0, 125)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation")
p12

# Using the white theme
fill <- "#4271AE"
p12 <- ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point(shape = 21, colour = "darkblue") +
  geom_smooth(method = "loess", colour = fill, size = 1.5,
              alpha = 0.2, fill = fill) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation") +
  theme_bw()
p12

# Using ‘The Economist’ theme
p12 = ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point(shape = 21, colour = "#1F3552") +
  geom_smooth(method = "loess", colour = "#4271AE", size = 1.5,
              alpha = 0.2, fill = "#4271AE") +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation") +
  theme_economist() + scale_fill_economist() +
  theme(axis.line.x = element_line(size = .5, colour = "black"),
        axis.title = element_text(size = 12),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.text = element_text(size = 10),
        text = element_text(family = "Roboto Condensed"),
        plot.title = element_text(family = "Roboto Condensed"))
p12

# Using ‘Five Thirty Eight’ theme
p12 = ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point(shape = 21, colour = "red") +
  geom_smooth(method = "loess", colour = "dodgerblue", size = 1.5,
              alpha = 0.2, fill = "dodgerblue") +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation") +
  theme_fivethirtyeight() + scale_fill_fivethirtyeight() +
  theme(axis.title = element_text(family = "Atlas Grotesk Regular", size = 12),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.title = element_text(family = "Atlas Grotesk Regular", size = 8),
        legend.text = element_text(family = "Atlas Grotesk Regular", size = 8),
        plot.title = element_text(family = "Atlas Grotesk Medium", size = 16),
        text = element_text(family = "Decima Mono Pro"))
p12

# my own
fill = "#4271AE"
p12 = ggplot(airquality, aes(x = Temp, y = Ozone)) +
  geom_point(shape = 21, colour = "darkblue") +
  geom_smooth(method = "loess", colour = fill, size = 1.5,
              alpha = 0.2, fill = fill) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 150, 25), limits = c(0, 150)) +
  labs(title = "LOWESS plot of mean ozone by month",
       subtitle = "Source: New York State Department of Conservation") +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 13, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(face = "bold", size = 10),
        axis.text.x = element_text(colour = "black", size = 8),
        axis.text.y = element_text(colour = "black", size = 8))
p12

