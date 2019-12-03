# Reading and Cleaning the Data
library(readr)
data <- read_csv("~/Documents/Documents - Griffin’s MacBook Pro/Senior Year/Fall_2019/Experimental Design/iGotoTheGym/Code:Data/data.csv",
  col_types = cols(
    DayType = col_factor(levels = c("MW","TT", "FSS")), 
    X1 = col_skip(), 
    dates = col_date(format = "%m/%d/%y"),
    ex = col_factor(levels = c("0", "1")),
    pickups = col_integer(), 
    tod = col_time(format = "%H:%M")),
  na = "NA")

data$length[is.na(data$length)] <- 0
