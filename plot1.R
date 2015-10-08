# create chart 1
library(readr)
library(dplyr)
library(lubridate)

plot_period <- interval(ymd("2007-02-01"), ymd("2007-02-02"))

power <- read_delim("data/household_power_consumption.txt", delim=";") %>% 
    mutate(Date = dmy(Date)) %>% 
    mutate(Time = hms(Time)) %>% 
    filter(Date %within% plot_period)

with(power, 
     hist(
        Global_active_power,
        freq=TRUE,
        col="red",
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)"
    )
)

if (!dir.exists("plots")){
    dir.create("plots")
}

dev.copy(png, file="plots/plot1.png")
dev.off()