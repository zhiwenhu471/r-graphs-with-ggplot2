setwd("D:/R/exercise/linear regression plot")
getwd()

rm(list = ls())

if (!require("pacman")) install.packages("pacman")
p_load(ggplot2, ggthemes, grid, dplyr, HistData)
p_load_gh("sinhrks/ggfortify") # 从 GitHub 上的 sinhrks 用户仓库中安装并加载 ggfortify 包
Galton <- as_tibble(Galton)

# Trend line plot
# Basic trend line plot
fit <- lm(child ~ parent, data = Galton)
summary(fit)

p11 <- ggplot(Galton, aes(x = parent, y = child)) +
  geom_point(shape = 1) + geom_smooth(method = lm)
p11
# se = F 不显示平滑曲线的置信区间，=T就是显示
p11 <- ggplot(Galton, aes(x = parent, y = child)) +
  geom_point(shape = 1) + geom_smooth(method = lm, se = FALSE)
p11

# Customising axis labels
p11 <- p11 + scale_x_continuous(name = "Parent height") +
  scale_y_continuous(name = "Child height")
p11

# Adding a title
p11 <- p11 +
  labs(title = "Galton regression line",
       subtitle = "Source: R Core Team")
p11

# Using the white theme
p11 <- p11 + theme_bw()
p11

# Using ‘The Economist’ theme
p11 <- ggplot(Galton, aes(x = parent, y = child)) +
  geom_point(shape = 1) + geom_smooth(method = lm, se = FALSE) +
  labs(title = "Galton regression line",
       subtitle = "Source: R Core Team") +
  scale_x_continuous(name = "Parent height") +
  scale_y_continuous(name = "Child height") +
  theme_economist() + scale_fill_economist() +
  theme(axis.line.x = element_line(size = .5, colour = "black"),
        axis.title = element_text(size = 12),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.text = element_text(size = 10),
        text = element_text(family = "Roboto Condensed"),
        plot.title = element_text(family = "Roboto Condensed"))
p11

# Using ‘Five Thirty Eight’ theme
p11 <- ggplot(Galton, aes(x = parent, y = child)) +
  geom_point(shape = 1) + geom_smooth(method = lm, se = FALSE) +
  labs(title = "Galton regression line",
       subtitle = "Source: R Core Team") +
  scale_x_continuous(name = "Parent height") +
  scale_y_continuous(name = "Child height") +
  theme_fivethirtyeight() + scale_fill_fivethirtyeight() +
  theme(axis.title = element_text(family = "Atlas Grotesk Regular"),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.title = element_text(family = "Atlas Grotesk Regular", size = 10),
        legend.text = element_text(family = "Atlas Grotesk Regular", size = 10),
        plot.title = element_text(family = "Atlas Grotesk Medium"),
        text = element_text(family = "Decima Mono Pro"))
p11

# my own
p11 <- ggplot(Galton, aes(x = parent, y = child)) +
  geom_point(shape = 1) + geom_smooth(method = lm, se = FALSE) +
  labs(title = "Galton regression line",
       subtitle = "Source: R Core Team") +
  scale_x_continuous(name = "Parent height") +
  scale_y_continuous(name = "Child height") +
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
p11

# Regression diagnostics plots
# Basic diagnostics plots
autoplot(fit, label.size = 3)

# Using the white theme
autoplot(fit, label.size = 3) + theme_bw()

# Using ‘The Economist’ theme
autoplot(fit, label.size = 3) + theme_economist() +
  theme(panel.border = element_rect(colour = "black",
                                    fill = NA, size = .5),
        axis.text.x = element_text(colour = "black", size = 9),
        axis.text.y = element_text(colour = "black", size = 9),
        panel.background = element_blank(),
        plot.title = element_text(family = "Roboto Condensed"),
        text = element_text(family = "Roboto Condensed"))

# Using ‘Five Thirty Eight’ theme
autoplot(fit, label.size = 3) + theme_fivethirtyeight() +
  theme(axis.title = element_text(family = "Atlas Grotesk Regular"),
        axis.text.x = element_text(colour = "black", size = 9),
        axis.text.y = element_text(colour = "black", size = 9),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        plot.title = element_text(family = "Atlas Grotesk Medium", size = 12),
        text = element_text(family = "Decima Mono Pro"))

# my own
autoplot(fit, label.size = 3) +
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

