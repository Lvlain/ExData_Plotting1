dataFull <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataFull)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2,2))

plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", 
ylab = "Global Active Power")

plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", 
ylab = "Voltage")

plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1), lwd = 2, 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5, bty = "n")

plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png")
dev.off()