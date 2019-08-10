library(lubridate)
library(dplyr)

## Gathering and cleaning data
dataset <- read.table("household_power_consumption.txt", sep = ";", 
                      na.strings = "?", header = TRUE)
dataset <- dataset %>% mutate(DateTime = dmy_hms(paste(Date, Time))) %>% 
        mutate(Date = dmy(Date), Time = hms(Time)) %>% 
        filter(Date == "2007-02-01" | Date == "2007-02-02")%>% 
        select(Date, Time, DateTime, everything())

## Creating plot
png("plot3.png", width = 480, height = 480)

with(dataset, plot(DateTime, Sub_metering_1, type = "l", xlab = "", 
        ylab = "Energy sub metering"))
with(dataset, lines(DateTime, Sub_metering_2, col = "red"))
with(dataset, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), col = c("black","red","blue"))

dev.off()
