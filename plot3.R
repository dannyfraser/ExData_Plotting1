# create chart 3
library(readr)
library(dplyr)
library(lubridate)

plot_period <- interval(ymd("2007-02-01"), ymd("2007-02-03"))

power <- read_delim("data/household_power_consumption.txt", delim=";") %>% 
    mutate(DateTime=dmy_hms(paste(Date, Time))) %>% 
    filter(DateTime %within% plot_period)

png(filename="plot3.png", width=480, height=480, res=90)

with(power, 
     {plot(
         x=DateTime,
         y=Sub_metering_1,
         col="black",
         ylab="Energy sub metering",
         xlab="",
         type="l"
     )
     lines(x=DateTime, y=Sub_metering_2, col="red")
     lines(x=DateTime, y=Sub_metering_3, col="blue")
     }
)


legend("topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"), 
    lty=1
)


dev.off()
