library(lubridate)
library(dplyr)

## Gathering and cleaning data
dataset <- read.table("household_power_consumption.txt", sep = ";", 
        na.strings = "?", header = TRUE)
dataset <- dataset %>% mutate(Date = dmy(Date), Time = hms(Time)) %>% 
        filter(Date == "2007-02-01" | Date == "2007-02-02")

## Creating plot
png("plot1.png", width = 480, height = 480)
hist(dataset[[3]], main = "Global Active Power", col= "red", 
        xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()