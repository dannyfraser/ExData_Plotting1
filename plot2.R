# create chart 2
library(readr)
library(dplyr)
library(lubridate)

plot_period <- interval(ymd("2007-02-01"), ymd("2007-02-03"))

power <- read_delim("data/household_power_consumption.txt", delim=";") %>% 
    mutate(DateTime=dmy_hms(paste(Date, Time))) %>% 
    filter(DateTime %within% plot_period)

with(power, 
     plot(
         x=DateTime,
         y=Global_active_power,
         ylab="Global Active Power (kilowatts)",
         xlab="",
         type="l"
     )
)

if (!dir.exists("plots")){
    dir.create("plots")
}

dev.copy(png, file="plots/plot2.png")
dev.off()