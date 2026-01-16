setwd("D:/R/exercise/basic graphs")
library(vcd)
counts <- table(Arthritis$Improved)
counts
# 简单条形图
barplot(counts,
        main = "Simple Bar Plot",
        xlab = "Improvement",
        ylab = "Frequency")
# 水平条形图
barplot(counts, 
        main = "Horizontal Bar Plot",
        xlab = "Frequency", ylab = "Improvement", horiz = T)

# 堆砌条形图和分组条形图
counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts

barplot(counts, 
        main = "Stacked Bar Plot",
        xlab = "Treatment", ylab = "Frequency",
        col = c("red", "yellow", "green"),
        legend = rownames(counts))

barplot(counts, 
        main = "Stacked Bar Plot",
        xlab = "Treatment", ylab = "Frequency",
        col = c("red", "yellow", "green"),
        legend = rownames(counts), beside = T) # beside=T便是分组条形图
legend("topright", inset = .05)
