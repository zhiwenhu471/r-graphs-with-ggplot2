setwd("D:/R/exercise/box plots")
getwd()

# 删除当前环境中的所有对象
rm(list = ls())

if (!require("pacman")) install.packages("pacman")
p_load(datasets, ggplot2, ggthemes, grid, dplyr, RColorBrewer)
data(airquality)
airquality <- airquality %>%
  mutate(Month = factor(Month,
                        labels = c("May", "Jun", "Jul", "Aug", "Sep")))

# Basic boxplot
p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot()
p10

# Customising axis labels
p10 <- p10 + scale_x_discrete(name = "Month") +
  scale_y_continuous(name = "Mean ozone in parts per billion")
p10

p10 <- p10 + scale_y_continuous(name = "Mean ozone in\nparts per billion")
p10

# Changing axis ticks
p10 <- p10 + scale_y_continuous(name = "Mean ozone in\nparts per billion",
                                breaks = seq(0, 175, 25), limits = c(0, 175))
p10

# Adding a title
p10 <- p10 +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") + 
  theme(plot.title = element_text(hjust = 0.5), # 让主副标题一起居中
        plot.subtitle = element_text(hjust = 0.5))
p10

# Changing the colour of the boxes
fill <- "gold1"; line <- "goldenrod2"

p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot(fill = fill, colour = line) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p10
# other colours
fill <- "#4271AE"; line <- "#1F3552"

p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot(fill = fill, colour = line) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p10
# changing the transparency in the box fill area
p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot(fill = fill, colour = line,
               alpha = 0.7) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p10

p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot(fill = fill, colour = line, alpha = 0.7,
               outlier.colour = "#1F3552", outlier.shape = 20) + # 自定义箱线图中离群值的颜色和形状
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p10

# Using the white theme
p10 <- p10 + theme_bw()
p10

# Using ‘The Economist’ theme
p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot(fill = fill, colour = line) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
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
p10

# Using ‘Five Thirty Eight’ theme
p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot(fill = fill, colour = line) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  theme_fivethirtyeight() + scale_fill_fivethirtyeight() +
  theme(axis.title = element_text(family = "Atlas Grotesk Regular"),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.title = element_text(family = "Atlas Grotesk Regular", size = 10),
        legend.text = element_text(family = "Atlas Grotesk Regular", size = 10),
        plot.title = element_text(family = "Atlas Grotesk Medium"),
        text = element_text(family = "Decima Mono Pro"))
p10

# my own theme
fill <- "#4271AE"; lines <- "#1F3552"
p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot(colour = lines, fill = fill,
               size = 1) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(face = "bold"),
        axis.text.x = element_text(colour = "black", size = 11),
        axis.text.y = element_text(colour = "black", size = 9))
p10

# Boxplot extras
p10 <- p10 + geom_jitter()
p10

p10 <- ggplot(airquality, aes(x = Month, y = Ozone)) +
  geom_boxplot(colour = lines, fill = fill,
               size = 1, notch = TRUE) + 
  # notch = TRUE 参数创建带有凹槽的箱线图时，可以通过观察凹槽是否重叠来
  # 判断中位数之间是否有显著差异
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(face = "bold"),
        axis.text.x = element_text(colour = "black", size = 11),
        axis.text.y = element_text(colour = "black", size = 9))
p10

# Grouping by another variable
airquality_trimmed <- airquality %>%
  filter(Month %in% c("Jul", "Aug", "Sep")) %>%
  mutate(Temp.f = factor(ifelse(Temp > mean(Temp), 1, 0),
                         labels = c("Low temp ", "High temp ")))
p10 <- ggplot(airquality_trimmed, aes(x = Month, y = Ozone)) +
  geom_boxplot(fill = fill, colour = line,
               alpha = 0.7) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 50), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  theme_bw() +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        panel.border = element_rect(colour = "black", fill = NA, size = .5),
        text = element_text(size = 12, family = "Tahoma"),
        axis.title = element_text(face = "bold"),
        axis.text.x = element_text(size = 11)) +
  facet_grid(. ~ Temp.f)
p10

p10 <- ggplot(airquality_trimmed, aes(x = Month, y = Ozone, fill = Temp.f)) +
  geom_boxplot(alpha = 0.7) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  theme_bw() +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        panel.border = element_rect(colour = "black", fill = NA, size = .5),
        text = element_text(size = 12, family = "Tahoma"),
        axis.title = element_text(face = "bold"),
        axis.text.x = element_text(size = 11)) +
  scale_fill_brewer(palette = "Accent")
p10

# Formatting the legend
p10 <- ggplot(airquality_trimmed, aes(x = Month, y = Ozone, fill = Temp.f)) +
  geom_boxplot(alpha = 0.7) +
  scale_y_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_x_discrete(name = "Month") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  theme_bw() +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        panel.border = element_rect(colour = "black", fill = NA, size = .5),
        text = element_text(size = 12, family = "Tahoma"),
        axis.title = element_text(face = "bold"),
        axis.text.x = element_text(size = 11),
        legend.position = "bottom") +
  scale_fill_brewer(palette = "Accent") +
  labs(fill = "Temperature ")
p10





