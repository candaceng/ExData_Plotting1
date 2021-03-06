# This Code generates 4 plots simultaneously 

# Read in the data set
data <- read.table("./household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")

# Merge time and date
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, date_time)

# Fix types
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Get data from Feb 1 2007 and Feb 2 2007
feb <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Generate plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
with(feb, plot(date_time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
with(feb, plot(date_time, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(feb, plot(date_time, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(feb$date_time, feb$Sub_metering_2, type="l", col="red")
lines(feb$date_time, feb$Sub_metering_3, type="l", col="blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
with(feb, plot(date_time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()