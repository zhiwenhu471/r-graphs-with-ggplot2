setwd("D:/R/exercise/ggplot2-bar plot")
getwd()

# basic graph 
if (!require("pacman")) install.packages("pacman")

p_load(ggplot2, ggthemes, dplyr, readr, scales, forcats)

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

p3 <- ggplot(aes(y = export, x = year, fill = product), data = exports_data) +
  geom_col()
p3

p3 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_col()
p3

# Adding data labels
exports_data <- exports_data %>%
  mutate(export_label = paste(round(export/1000000000,2), "B"))
p3 = p3 + geom_text(data = exports_data, aes(x = year, y = export,
                                             label = export_label), size = 3)
p3

# Adjusting data labels position
p3 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_col()
p3 <- p3 +
  geom_text(aes(label = export_label), position = position_stack(vjust = 0.5),
            size = 3)
p3

# Adjusting legend position
p3 <- p3 + theme(legend.position = "bottom", legend.direction = "horizontal",
                 legend.title = element_blank())
p3

# Changing variables display
exports_data <- exports_data %>%
  mutate(product = factor(product, levels = c("copper","others"),
                          labels = c("Copper ","Pulp wood, Fruit, Salmon & Others")))
p3 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_col() +
  geom_text(aes(label = export_label), position = position_stack(vjust = 0.5),
            size = 3, show.legend = F) +
  theme(legend.position = "bottom", legend.direction = "horizontal",
        legend.title = element_blank()) +
  guides(fill = guide_legend(reverse = T))
p3

# Adjusting x-axis scale
p3 <- p3 + scale_x_continuous(breaks = seq(2006,2015,1))
p3

# Adjusting axis labels & adding title
p3 <- p3 +
  labs(title = "Composition of Exports to China ($)",
       subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million")
p3

# Adjusting color palette
fill <- c("#E1B378","#5F9EA0")
p3 <- p3 + scale_fill_manual(values = fill)
p3

# Using the white theme
p3 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_col() +
  geom_text(aes(label = export_label), position = position_stack(vjust = 0.5),
            size = 3, show.legend = F) +
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
p3

# Using ‘The Economist’ theme
fill <- c("#00a3dc","#01526d")
p3 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_col() +
  geom_text(aes(label = export_label), position = position_stack(vjust = 0.5),
            colour = "white", size = 3, family = "Roboto Condensed",
            show.legend = F) +
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
p3

# Using ‘Five Thirty Eight’ theme
fill <- c("#f80a1c","#338cd3")
p3 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_col() +
  geom_text(aes(label = export_label), position = position_stack(vjust = 0.5),
            colour = "white", size = 2.5, family = "Decima Mono Pro",
            show.legend = F) +
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
p3

# Creating my own theme
fill <- c("#b2d183","#40b8d0")
p3 <- ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = exports_data) +
  geom_col() +
  geom_text(aes(label = export_label), position = position_stack(vjust = 0.5),
            colour = "black", family = "Tahoma", size = 3, show.legend = F) +
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
p3

