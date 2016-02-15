unzip("exdata_data_household_power_consumption.zip", overwrite = T)
datasource <- "household_power_consumption.txt"
data <- read.table(datasource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


globalActivePower <- as.numeric(subData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

