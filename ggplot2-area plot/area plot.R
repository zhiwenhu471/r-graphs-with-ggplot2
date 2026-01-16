getwd()
setwd("D:R/exercise/ggplot2-area plot")
getwd()

# basic graph
if (!require("pacman")) install.packages("pacman")
p_load(ggplot2, ggthemes, dplyr, readr, forcats)
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

p2 <- ggplot(aes(y = export, x = year, fill = product), data = exports_data) +
  geom_area()
p2

p2 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_area()
p2

# adjusting legend position
p2 <- p2 + theme(legend.position = "bottom", legend.direction = "horizontal",
                 legend.title = element_blank())
p2

# changing variables display
exports_data <- exports_data %>%
  mutate(product = factor(product, levels = c("copper","others"),
                          labels = c("Copper ","Pulp wood, Fruit, Salmon & Others")))
p2 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_area() +
  theme(legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_blank()) +
  guides(fill = guide_legend(reverse = T))
p2

# Adjusting x-axis scale
p2 <- p2 + scale_x_continuous(breaks = seq(2006,2015,1))
p2

# Adjusting axis labels & adding title
p2 <- p2 +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million")
p2

# Adjusting color palette
fill <- c("#E1B378","#5F9EA0")
p2 <- p2 + scale_fill_manual(values = fill)
p2

# Using the white theme
p2 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_area() +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  scale_fill_manual(values = fill) +
  theme_bw() +
  theme(legend.position = "bottom",
        legend.direction = "horizontal",
        legend.title = element_blank()) +
  guides(fill = guide_legend(reverse = T))
p2

# Using system fonts(以下字体未安装，因此无效)
p_load(showtext)
font_add("Tahoma","Tahoma.ttf")
font_add("XKCD","xkcd-Regular.otf")
font_add("Roboto Condensed", "RobotoCondensed-Regular.ttf")
font_add("Decima Mono Pro","DecimaMonoPro.otf")
font_add("Atlas Grotesk Regular","AtlasGrotesk-Regular.otf")
font_add("Atlas Grotesk Medium","AtlasGrotesk-Medium.otf")
showtext_auto()

# Creating an XKCD style chart
fill <- c("#b2d183","#40b8d0")
p2 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_area() +
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
        text = element_text(family = "XKCD")) +
  guides(fill = guide_legend(reverse = T))
p2

# Using ‘The Economist’ theme
fill <- c("#00a3dc","#01526d")
p2 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_area() +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  theme_economist() + scale_fill_manual(values = fill) +
  theme(axis.line.x = element_line(size = .5, colour = "black"),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.title = element_blank(),
        plot.title = element_text(family = "Roboto Condensed"),
        text = element_text(family = "Roboto Condensed")) +
  guides(fill = guide_legend(reverse = T))
p2

# Using ‘Five Thirty Eight’ theme
fill <- c("#f80a1c","#338cd3")
p2 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_area() +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  theme_fivethirtyeight() + scale_fill_manual(values = fill) +
  theme(axis.title = element_text(family = "Atlas Grotesk Regular"),
        legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_blank(),
        plot.title = element_text(family = "Atlas Grotesk Medium"),
        legend.text = element_text(family = "Atlas Grotesk Regular"),
        text = element_text(family = "Decima Mono Pro")) +
  guides(fill = guide_legend(reverse = T))
p2

# Creating your own theme
fill <- c("#b2d183","#40b8d0")
p2 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_area() +
  scale_x_continuous(breaks = seq(2006,2015,1)) +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  scale_fill_manual(values = fill) +
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
        text = element_text(family = "Tahoma")) +
  guides(fill = guide_legend(reverse = T))
p2

