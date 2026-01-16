setwd("D:/R/exercise/histogram")
getwd()

if (!require("pacman")) install.packages("pacman")
p_load(datasets, ggplot2, ggthemes, dplyr, grid, RColorBrewer)
data(airquality)

p7 <- ggplot(airquality, aes(x = Ozone)) + geom_histogram()
p7

# Adding a normal density curve
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..density..)) +
  stat_function(fun = dnorm, colour = "red",
                args = list(mean = mean(airquality$Ozone, na.rm = TRUE),
                            sd = sd(airquality$Ozone, na.rm = TRUE)))
p7

# Changing from density to frequency
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..))
p7

# Adjusting binwidth
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5)
p7

# Customising axis labels
# Single line labels
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5) +
  scale_x_continuous(name = "Mean ozone in parts per billion") +
  scale_y_continuous(name = "Count")
p7

# Multiline labels
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion") +
  scale_y_continuous(name = "Count")
p7

# Changing axis ticks
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count")
p7

# Adding a title
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p7

# Changing the colour of the bars
barfill = "gold1"; barlines = "goldenrod2"
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p7

# By HEX code
barfill <- "#4271AE"; barlines <- "#1F3552"
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p7

# Colour gradients
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(fill = ..count..), binwidth = 5) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation")
p7
# 从高到低渐变色
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(fill = ..count..), binwidth = 5) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  scale_fill_gradient("Count", low = "blue", high = "red")
p7

# Using the white theme
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25),
                     limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  theme_bw()
p7

# Using ‘The Economist’ theme
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
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
p7

# Using ‘Five Thirty Eight’ theme
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
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
p7

# Creating my own theme
barfill <- "#4271AE"; barlines <- "#1F3552"
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25),
                     limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
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
p7

# Adding lines
barfill <- "#4271AE"; barlines <- "#1F3552"
p7 <- ggplot(airquality, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 5,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  geom_vline(xintercept = 75, size = 1, colour = "#FF3721",
             linetype = "dashed") +
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
p7

# Multiple histograms
# In panel plots
airquality_trimmed <- airquality %>%
  filter(Month %in% c(5,7)) %>%
  mutate(Month.f = factor(Month,
                          labels = c("May", "July")))
p7 <- ggplot(airquality_trimmed, aes(x = Ozone)) +
  geom_histogram(aes(y = ..count..), binwidth = 10,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  facet_grid(. ~ Month.f, scales = "free") +
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
p7

# In the same plot
p7 <- ggplot(airquality_trimmed, aes(x = Ozone, fill = Month.f)) +
  geom_histogram(aes(y = ..count..), binwidth = 10,
                 position = "identity", alpha = 0.75) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  scale_fill_brewer(palette = "Accent") +
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
p7

# Formatting the legend
p7 <- ggplot(airquality_trimmed, aes(x = Ozone, fill = Month.f)) +
  geom_histogram(aes(y = ..count..), binwidth = 10,
                 position = "identity", alpha = 0.75) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25), limits = c(0, 175)) +
  scale_y_continuous(name = "Count") +
  labs(title = "Frequency histogram of mean ozone",
       subtitle = "Source: New York State Department of Conservation") +
  scale_fill_brewer(palette = "Accent") +
  theme_economist() + 
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
        text = element_text(family = "Tahoma")) +
  labs(fill = "Month ")
p7


