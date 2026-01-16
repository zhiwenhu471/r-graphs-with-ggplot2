setwd("D:/R/exercise/density plot")
getwd()

if (!require("pacman")) install.packages("pacman")
p_load(datasets, ggplot2, ggthemes, dplyr, RColorBrewer, grid)
data(airquality)

p8 <- ggplot(airquality, aes(x = Ozone)) + geom_density()
p8

# Customising axis labels
p8 <- p8 + scale_x_continuous(name = "Mean ozone in parts per billion") +
  scale_y_continuous(name = "Density")
p8

p8 <- p8 + scale_x_continuous(name = "Mean ozone in\nparts per billion")
p8

# Changing axis ticks
p8 <- p8 + scale_x_continuous(name = "Mean ozone in\nparts per billion",
                              breaks = seq(0, 200, 25), limits = c(0, 200))
p8

# Adding a title
p8 <- p8 +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p8

# Changing the colour of the curves
fill <- "gold1"; line <- "goldenrod2"
p8 <- ggplot(airquality, aes(x = Ozone)) +
  geom_density(fill = fill, colour = line) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p8
# 改变颜色
fill <- "#4271AE"; line <- "#1F3552"
p8 <- ggplot(airquality, aes(x = Ozone)) +
  geom_density(fill = fill, colour = line) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p8

p8 = ggplot(airquality, aes(x = Ozone)) +
  geom_density(fill = fill, colour = line, alpha = 0.6) + # alpha 0-1 透明度
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p8

# Using the white theme
p8 <- p8 + theme_bw()
p8

# Using ‘The Economist’ theme
p8 <- ggplot(airquality, aes(x = Ozone)) +
  geom_density(fill = fill, colour = line) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
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
p8

# Using ‘Five Thirty Eight’ theme
p8 <- ggplot(airquality, aes(x = Ozone)) +
  geom_density(fill = fill, colour = line) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
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
p8

# Creating my own theme
fill <- "#4271AE"; lines <- "#1F3552"
p8 <- ggplot(airquality, aes(x = Ozone)) +
  geom_density(colour = lines, fill = fill, size = 1) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        axis.text.x = element_text(colour = "black", size = 9),
        axis.text.y = element_text(colour = "black", size = 9),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.key = element_blank(),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"))
p8

# Adding lines
p8 <- p8 + geom_vline(xintercept = 75, size = 1, colour = "#FF3721",
                      linetype = "dashed")
p8

# Multiple densities
airquality_trimmed <- airquality %>%
  filter(Month %in% c(5,6,7)) %>%
  mutate(Month.f = factor(Month,
                          labels = c("May", "June", "July")))
p8 <- ggplot(airquality_trimmed, aes(x = Ozone)) +
  geom_density(fill = fill, colour = line, alpha = 0.6) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 50), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  facet_grid(. ~ Month.f) +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"))
p8
# 小提琴图
p8 <- ggplot(airquality_trimmed, aes(x = Ozone)) +
  stat_density(aes(ymax = ..density.., ymin = -..density..),
               geom = "ribbon",
               fill = fill, colour = line, alpha = 0.6,
               position = "identity") +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density",
                     breaks = seq(-0.03, 0.03, 0.03)) +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  facet_grid(. ~ Month.f) +
  coord_flip() +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"))
p8

p8 <- ggplot(airquality_trimmed, aes(x = Ozone, fill = Month.f)) +
  geom_density(position = "identity", alpha = 0.6) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  scale_fill_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"))
p8

p8 <- ggplot(airquality_trimmed, aes(x = Ozone, fill = Month.f)) +
  geom_density(position = "stack", alpha = 0.6) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  scale_fill_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"))
p8

p8 <- ggplot(airquality_trimmed, aes(x = Ozone, colour = Month.f)) +
  geom_density(position = "identity", fill = NA, size = 1) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  scale_colour_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"))
p8

# Formatting the legend
p8 <- ggplot(airquality_trimmed, aes(x = Ozone, colour = Month.f)) +
  geom_density(position = "identity", fill = NA, size = 1) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 200, 25), limits = c(0, 200)) +
  scale_y_continuous(name = "Density") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  scale_colour_brewer(palette = "Accent") +
  labs(colour = "Month ") +
  theme_bw() +
  theme(legend.position = "bottom",
        panel.border = element_rect(colour = "black", fill = NA, size = .5),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"))
p8

