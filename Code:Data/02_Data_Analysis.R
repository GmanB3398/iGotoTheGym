# Data Analysis
source("01_Data_Management.R")
model_base <- aov(pickups~ex, data=data)
summary(model_base)

lm_base <- lm(pickups~ex, data=data)
summary(lm_base)

model_block <- aov(pickups~ex*DayType, data=data)
summary(model_block)

lm_block <- lm(pickups~ex*DayType, data=data)
summary(lm_block)

model_length <- aov(pickups~length, data=data)
summary(model_length)

lm_length <- lm(pickups~length, data=data)
summary(lm_length)
