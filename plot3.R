library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, format = "%Y-%m-%d %H:%M:%S")
png(file = "plot3.png")
plot(data$Date, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_1)
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, 
       col = c("black", "red", "blue"))
dev.off()