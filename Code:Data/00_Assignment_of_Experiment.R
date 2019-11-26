# Randomly Assigning Days for Exercise:
library(dplyr)
library(randomizr)

dates <- seq(as.Date("2019-10-10"),as.Date("2019-11-25"),1)
weekdays <- weekdays(dates)

df <- data.frame(dates,weekdays)

df$DayType <- ifelse(df$weekdays %in% c("Monday", "Wednesday"), "MW", 
                     ifelse(df$weekdays %in% c("Tuesday", "Thursday"), "TT",
                            "FSS"))
'%!in%' <- function(x,y)!('%in%'(x,y))
df <- df %>% filter(dates %!in% seq(as.Date("2019-10-17"),as.Date("2019-10-21"),1)) %>% select(-weekdays)


set.seed(1234)
Z <- block_ra(blocks=df$DayType)
table(Z, df$DayType)

df$ex <- Z
df$ex[df$dates=='2019-11-15'] <- 1
df$ex[df$dates=='2019-11-16'] <- 0

df$pickups <- NA
