# create chart 1
library(readr)
library(dplyr)
library(lubridate)

plot_period <- interval(ymd("2007-02-01"), ymd("2007-02-02"))

power <- read_delim("data/household_power_consumption.txt", delim=";") %>% 
    mutate(DateTime=dmy_hms(paste(Date, Time))) %>% 
    mutate(Date = dmy(Date)) %>% 
    mutate(Time = hms(Time)) %>% 
    filter(Date %within% plot_period)

png(filename="plot1.png", height=480, width=480, units="px", res=90)

with(power, 
     hist(
        Global_active_power,
        freq=TRUE,
        col="red",
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)"
    )
)

dev.off()
