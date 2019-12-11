# Visualizations
# source("~/Documents/Documents - Griffin’s MacBook Pro/Senior Year/Fall_2019/Experimental Design/iGotoTheGym/Code:Data/00_Assignment_of_Experiment.R")
source("~/Documents/Documents - Griffin’s MacBook Pro/Senior Year/Fall_2019/Experimental Design/iGotoTheGym/Code:Data/01_Data_Management.R")
source("~/Documents/Documents - Griffin’s MacBook Pro/Senior Year/Fall_2019/Experimental Design/iGotoTheGym/Code:Data/02_Data_Analysis.R")

# Load Packages
library(ggplot2)
library(ggthemes)
library(dplyr)
library(visreg)

# Set ggplot Theme
theme_set(theme_solarized())

# Histogram of Pickups
pickup_hist <- ggplot(data)+
  aes(x=pickups)+
  geom_histogram(bins=10)

# Graph of Linear Serial Correlation
ser_cor <- ggplot(data) +
 aes(x = dates, y = pickups) +
 geom_line(size = 1L, colour = "maroon") +
 geom_smooth(method = "lm", color="red2")

# Graph of Quadratic Serial Correlation
ser_cor2 <- ggplot(data) +
  aes(x = dates, y = pickups) +
  geom_line(size = 1L, colour = "maroon") +
  geom_smooth(method = "lm", color="red2", formula = y ~ x + poly(x,2))

# Visualization of Regression Lines by Day Type
reg <- visreg(
  fit = lm_length,
  by = "DayType",
  xvar = "length", gg = T,
  line = list(col = "#7A3E20"),
  fill = list(fill = "#B330606B"))+
  ggtitle("Regression of Length on Pickups by Day Type")

# Interaction Graph
interaction_plot <- ggplot(data[!is.na(data$pickups),]) +
  stat_summary(aes(x=ex,y=pickups,color=DayType,
                   group=DayType),fun.y=mean,geom="line", size=2)
