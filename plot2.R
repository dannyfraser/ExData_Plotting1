# create chart 2
library(readr)
library(dplyr)
library(lubridate)

plot_period <- interval(ymd("2007-02-01"), ymd("2007-02-03"))

power <- read_delim("data/household_power_consumption.txt", delim=";") %>% 
    mutate(DateTime=dmy_hms(paste(Date, Time))) %>% 
    filter(DateTime %within% plot_period)

png(filename="plot2.png", height=480, width=480)

with(power, 
     plot(
         x=DateTime,
         y=Global_active_power,
         ylab="Global Active Power (kilowatts)",
         xlab="",
         type="l"
     )
)

dev.off()