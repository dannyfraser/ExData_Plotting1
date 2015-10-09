# create chart 4
library(readr)
library(dplyr)
library(lubridate)

plot_period <- interval(ymd("2007-02-01"), ymd("2007-02-03"))

power <- read_delim("data/household_power_consumption.txt", delim=";") %>% 
    mutate(DateTime=dmy_hms(paste(Date, Time))) %>% 
    filter(DateTime %within% plot_period)

png(filename="plot4.png", height=480, width=480)

#plot 2x2
par(mfrow = c(2,2))

#Top Left plot - same as plot2
with(power, 
     plot(
         x=DateTime,
         y=Global_active_power,
         ylab="Global Active Power (kilowatts)",
         xlab="",
         type="l"
     )
)

#Top Right plot
with(power, 
     plot(
         x=DateTime,
         y=Voltage,
         ylab="Voltage",
         xlab="datetime",
         type="l"
     )
)

#Bottom left plot - same as plot3
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

#Bottom right plot
with(power, 
     plot(
         x=DateTime,
         y=Global_reactive_power,
         ylab="Global_reactive_power",
         xlab="datetime",
         type="l"
     )
)

dev.off()