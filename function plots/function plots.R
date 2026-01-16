setwd("D:/R/exercise/function plots")
getwd()

if (!require("pacman")) install.packages("pacman")
p_load(ggplot2, ggthemes, grid, tidyverse)

# basic normal curve
p9 <- ggplot(tibble(x = c(-4, 4)), aes(x = x)) +
  stat_function(fun = dnorm) # tribble()函数在tidyverse包或者tibble包中
p9

# Basic t-curve
p9 <- ggplot(tibble(x = c(-4, 4)), aes(x = x)) + # tibble（R中现代版本的数据框）
  stat_function(fun = dt, args = list(df = 8))
p9

# my own function 
cubefun <- function(x){
  x^3*0.5
}

p9 <- ggplot(tibble(x = c(-4, 4)), aes(x = x)) +
  stat_function(fun = cubefun)
p9

# Plotting multiple functions on the same graph
p9 = ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1)) +
  stat_function(fun = dnorm, args = list(0.7, 0.05))
p9

# Customising axis labels
p9 <- p9 + scale_x_continuous(name = "Probability") +
  scale_y_continuous(name = "Frequency")
p9

# Changing axis ticks
p9 <- p9 + scale_x_continuous(name = "Probability",
                              breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency")
p9

# Adding a title
p9 <- p9 + labs(title = "Normal function curves of probabilities") 
p9

p9 <- p9 + labs(title = "Normal function curves of probabilities") +
  theme(plot.title = element_text(hjust = 0.5)) # 让标题居中对齐
p9

# 改变曲线的颜色
p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                colour = "deeppink") +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                colour = "dodgerblue3") +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities")
p9
# 颜色还可以用数字编码表示
p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                colour = "#4271AE") +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                colour = "#1F3552") +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities")
p9

# 添加图例
p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                aes(colour = "Group 1 ")) +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                aes(colour = "Group 2 ")) +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities") +
  scale_colour_manual("Groups ", values = c("deeppink", "dodgerblue3"))
p9

p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                aes(colour = "Group 1 ")) +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                aes(colour = "Group 2 ")) +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities") +
  labs(colour = "Groups ") +
  scale_colour_brewer(palette = "Accent")
p9

# Changing the size of the lines
p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                aes(colour = "Group 1 "), size = 1.5) +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                aes(colour = "Group 2 "), size = 1.5) +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities") +
  labs(colour = "Groups ") +
  scale_colour_brewer(palette = "Accent")
p9

# Using the white theme
p9 <- p9 + theme_bw()
p9

# Using ‘The Economist’ theme
p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                aes(colour = "Group 1 "), size = 1.5) +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                aes(colour = "Group 2 "), size = 1.5) +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities") +
  scale_colour_manual("Groups ", values = c("#4271AE", "#1F3552")) +
  theme_economist() + scale_fill_economist() +
  theme(axis.line.x = element_line(size = .5, colour = "black"),
        axis.title = element_text(size = 12),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.text = element_text(size = 10),
        text = element_text(family = "Roboto Condensed"),
        plot.title = element_text(family = "Roboto Condensed", hjust = 0.5))
p9

# Using ‘Five Thirty Eight’ theme
p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                aes(colour = "Group 1 "), size = 1.5) +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                aes(colour = "Group 2 "), size = 1.5) +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities") +
  scale_colour_manual("Groups ", values = c("#4271AE", "#1F3552")) +
  theme_fivethirtyeight() + scale_fill_fivethirtyeight() +
  theme(axis.title = element_text(family = "Atlas Grotesk Regular"),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.title = element_text(family = "Atlas Grotesk Regular", size = 10),
        legend.text = element_text(family = "Atlas Grotesk Regular", size = 10),
        plot.title = element_text(family = "Atlas Grotesk Medium"),
        text = element_text(family = "Decima Mono Pro"))
p9

# my own theme
p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                aes(colour = "Group 1 "), size = 1.5) +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                aes(colour = "Group 2 "), size = 1.5) +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities") +
  labs(colour = "Groups ") +
  scale_colour_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        axis.text.x = element_text(colour = "black", size = 9),
        axis.text.y = element_text(colour = "black", size = 9),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"))
p9

# Adding areas under the curve
funcShaded <- function(x) {
  y <- dnorm(x, mean = 0.2, sd = 0.1)
  y[x < 0.2 | x > (0.2 + 4 * 0.1)] <- NA
  return(y)
}
p9 <- p9 + stat_function(fun = funcShaded, geom = "area", fill = "#84CA72", 
                         alpha = 0.2) # alpha是透明度
p9

# Formatting the legend
p9 <- ggplot(tibble(x = c(0, 1)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(0.2, 0.1),
                aes(colour = "Group 1 "), size = 1.5) +
  stat_function(fun = dnorm, args = list(0.7, 0.05),
                aes(colour = "Group 2 "), size = 1.5) +
  stat_function(fun = funcShaded, geom = "area", fill = "#84CA72", alpha = 0.2) +
  scale_x_continuous(name = "Probability",
                     breaks = seq(0, 1, 0.2), limits = c(0, 1)) +
  scale_y_continuous(name = "Frequency") +
  labs(title = "Normal function curves of probabilities") +
  labs(colour = "Groups ") +
  scale_colour_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        axis.text.x = element_text(colour = "black", size = 9),
        axis.text.y = element_text(colour = "black", size = 9),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"))
p9
