# This Code generates a Global Active Power vs. Day plot over the first two days of February 2007

# Read in the data set
data <- read.table("./household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")

# Merge time and date
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, date_time)

# Fix types
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# Get data from Feb 1 2007 and Feb 2 2007
feb <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Generate plot
png("plot2.png", width=480, height=480)
with(feb, plot(date_time, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()