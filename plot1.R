library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, format = "%Y-%m-%d %H:%M:%S")
png(file = "plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()