setwd("D:/R/exercise/ggplot2-scatter plot")
getwd()

if (!require("pacman")) install.packages("pacman")
p_load(ggplot2, ggthemes, dplyr, scales, grid)
data(airquality)

aq_trim <- airquality %>%
  filter(Month %in% c(7,8,9)) %>%
  mutate(Month = factor(Month,
                        labels = c("July", "August", "September")))

p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone)) +
  geom_point()
p5

# Changing the shape of the data points
p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone)) + geom_point(shape = 21)
p5

# Adjusting the axis scales
p5 <- p5 + scale_x_continuous(breaks = seq(1, 31, 5))
p5

# Adjusting axis labels & adding title
p5 <- p5 + labs(title = "Air Quality in New York by Day") +
  labs(x = "Day of the month", y = "Ozone (ppb)")
p5

# Adjusting the colour palette
p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone)) +
  geom_point(shape = 21, colour = "mediumvioletred", fill = "springgreen") +
  labs(title = "Air Quality in New York by Day",
       subtitle = "Source: New York State Department of Conservation") +
  labs(x = "Day of the month", y = "Ozone (ppb)") +
  scale_x_continuous(breaks = seq(1, 31, 5))
p5

# change the colours
p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone)) +
  geom_point(shape = 21, colour = "#000000", fill = "#40b8d0") +
  labs(title = "Air Quality in New York by Day",
       subtitle = "Source: New York State Department of Conservation") +
  labs(x = "Day of the month", y = "Ozone (ppb)") +
  scale_x_continuous(breaks = seq(1, 31, 5))
p5

# relationship of three variables
p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone, fill = Temp)) +
  geom_point(shape = 21) +
  labs(title = "Air Quality in New York by Day",
       subtitle = "Source: New York State Department of Conservation") +
  labs(x = "Day of the month", y = "Ozone (ppb)") +
  scale_x_continuous(breaks = seq(1, 31, 5))
p5

p5 <- p5 + scale_fill_continuous(low = "plum1", high = "purple4")
p5

# 根据月份来改变点的颜色
p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone, fill = Month)) +
  geom_point(shape = 21) +
  labs(title = "Air Quality in New York by Day",
       subtitle = "Source: New York State Department of Conservation") +
  labs(x = "Day of the month", y = "Ozone (ppb)") +
  scale_x_continuous(breaks = seq(1, 31, 5))
p5

fill <- c("steelblue", "yellowgreen", "violetred1")
p5 <- p5 + scale_fill_manual(values = fill)
p5

# Adjusting legend position
p5 <- p5 + theme(legend.position = "bottom", legend.direction = "horizontal")
p5

# Using the white theme
p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone, fill = Month)) +
  geom_point(shape = 21) +
  labs(title = "Air Quality in New York by Day",
       subtitle = "Source: New York State Department of Conservation") +
  labs(x = "Day of the month", y = "Ozone (ppb)", fill = "Months ") +
  scale_x_continuous(breaks = seq(1, 31, 5)) +
  scale_fill_manual(values = fill) +
  scale_size(range = c(1, 10)) +
  theme_bw() +
  theme(legend.position = "bottom", legend.direction = "horizontal")
p5

# Using ‘The Economist’ theme
p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone, fill = Month)) +
  geom_point(shape = 21) +
  labs(title = "Air Quality in New York by Day",
       subtitle = "Source: New York State Department of Conservation") +
  labs(x = "Day of the month", y = "Ozone (ppb)", fill = "Months ") +
  scale_x_continuous(breaks = seq(1, 31, 5)) +
  scale_size(range = c(1, 10)) +
  theme_economist() + scale_fill_economist() +
  theme(axis.line.x = element_line(size = .5, colour = "black"),
        axis.title = element_text(size = 12),
        legend.position = "bottom", legend.direction = "horizontal",
        legend.text = element_text(size = 10),
        plot.title = element_text(family = "Roboto Condensed"),
        text = element_text(family = "Roboto Condensed"))
p5

# Using ‘Five Thirty Eight’ theme
p4 <- ggplot(aq_trim, aes(x = Day, y = Ozone, fill = Month)) +
  scale_fill_economist() +
  geom_point(shape = 21) +
  labs(title = "Air Quality in New York by Day",
       subtitle = "Source: New York State Department of Conservation") +
  labs(x = "Day of the month", y = "Ozone (ppb)", fill = "Months ") +
  scale_x_continuous(breaks = seq(1, 31, 5)) +
  scale_size(range = c(1, 10)) +
  theme_fivethirtyeight() + scale_fill_fivethirtyeight() +
  theme(axis.title = element_text(family = "Atlas Grotesk Regular"),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.title = element_text(family = "Atlas Grotesk Regular", size = 10),
        legend.text = element_text(family = "Atlas Grotesk Regular", size = 10),
        plot.title = element_text(family = "Atlas Grotesk Medium"),
        text = element_text(family = "Decima Mono Pro"))
p4

# Creating my own theme
fill <- c("steelblue", "yellowgreen", "violetred1")
p5 <- ggplot(aq_trim, aes(x = Day, y = Ozone, fill = Month)) +
  geom_point(shape = 21) +
  labs(title = "Air Quality in New York by Day",
       subtitle = "Source: New York State Department of Conservation") +
  labs(x = "Day of the month", y = "Ozone (ppb)", fill = "Months ") +
  scale_x_continuous(breaks = seq(1, 31, 5)) +
  scale_size(range = c(1, 10)) +
  scale_fill_manual(values = fill) +
  theme(panel.border = element_rect(colour = "black", fill = NA, size = .5),
        axis.text.x = element_text(colour = "black", size = 9),
        axis.text.y = element_text(colour = "black", size = 9),
        legend.position = "bottom", legend.direction = "horizontal",
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(family = "Tahoma"))
p5

