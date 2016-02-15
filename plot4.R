
datasource <- "household_power_consumption.txt"
data <- read.table(datasource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

days <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subData$Global_active_power)

globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)

subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(days, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(days, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(days, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(days, subMetering2, type="l", col="red")
lines(days, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(days, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
