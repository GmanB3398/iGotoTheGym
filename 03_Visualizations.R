# Visualizations
source("01_Data_Management.R")
source("02_Data_Analysis.R")


library(ggplot2)
library(ggthemes)

ggplot(data) +
 aes(x = dates, y = pickups) +
 geom_line(size = 1L, colour = "#0c4c8a") +
 geom_smooth(method = "lm")

ggplot(data) +
 aes(x = ex, y = pickups) +
 geom_boxplot(fill = "#0c4c8a") +
 theme_minimal()

ggplot(data) +
 aes(x = ex, y = pickups, fill = DayType) +
 geom_boxplot() +
 scale_fill_few() +
 theme_few()

ggplot(data[!is.na(data$pickups),]) +
  stat_summary(aes(x=ex,y=pickups,color=DayType,
                   group=DayType),fun.y=mean,geom="line", size=2)
