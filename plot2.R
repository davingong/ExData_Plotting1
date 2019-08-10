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
png("plot2.png", width = 480, height = 480)

with(dataset, plot(DateTime, Global_active_power, type = "l", 
        xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()