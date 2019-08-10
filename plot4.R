library(lubridate)
library(dplyr)

## Gathering and cleaning data
dataset <- read.table("household_power_consumption.txt", sep = ";", 
        na.strings = "?", header = TRUE)
dataset <- dataset %>% mutate(DateTime = dmy_hms(paste(Date, Time))) %>% 
        mutate(Date = dmy(Date), Time = hms(Time)) %>% 
        filter(Date == "2007-02-01" | Date == "2007-02-02")%>% 
        select(Date, Time, DateTime, everything())

## Create plot
png("plot4.png", width = 480, height = 480)

### Set 2x2 grid for plots
par(mfcol = c(2,2))

### From plot2
with(dataset, plot(DateTime, Global_active_power, type = "l", 
        xlab = "", ylab = "Global Active Power (kilowatts)"))

### From plot3
with(dataset, plot(DateTime, Sub_metering_1, type = "l", xlab = "", 
        ylab = "Energy sub metering"))
with(dataset, lines(DateTime, Sub_metering_2, col = "red"))
with(dataset, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        lty = c(1,1,1), col = c("black","red","blue"))

### First New Plot
with(dataset, plot(DateTime, Voltage, type = "l", 
        xlab = "datetime"))

### Second New Plot
with(dataset, plot(DateTime, Global_reactive_power, type = "l", 
        xlab = "datetime"))

dev.off()