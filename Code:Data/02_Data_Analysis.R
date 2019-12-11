# Data Analysis
source("~/Documents/Documents - Griffin’s MacBook Pro/Senior Year/Fall_2019/Experimental Design/iGotoTheGym/Code:Data/01_Data_Management.R")
library(jtools)

# Linear Regression with Blocking and Interaction
lm_block <- lm(pickups~ex*DayType, data=data)
summary(lm_block)
s_block <- summ(lm_block, digits=3)

# Check Serial Correlation
lm_serial <- lm(pickups~day, data=data)
summary(lm_serial)
s_serial <- summ(lm_serial, digits=3)

# Serial Correlation with Non-Linearity
lm_serial_2 <- lm(pickups~day + I(day**2), data=data)
summary(lm_serial_2)
s_serial <- summ(lm_serial, digits=3)

# Include Serial Correlation in Model
lm_block_2 <- lm(pickups~ex*DayType + day, data=data)
summary(lm_block_2)
s_block_2 <- summ(lm_block_2, digits=3)

# Include Non-Linear Serial Correlation in Model
lm_block_22 <- lm(pickups~ex*DayType + day + I(day**2), data=data)
summary(lm_block_22)
s_block_22 <- summ(lm_block_22, digits=3)

# Use Length at Gym instead of Binary Indicator 
lm_length <- lm(pickups~length*DayType + day, data=data)
summary(lm_length)
s_length <- summ(lm_length, digits=3)

# Look at only Gym Days
lm_length_ex <- lm(pickups~length*DayType, data=data[data$ex==1,])
summary(lm_length_ex)
s_length_ex <- summ(lm_length_ex)


