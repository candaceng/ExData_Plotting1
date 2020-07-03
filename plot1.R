# This Code generates a Frequency vs. Global Active Power plot over the first two days of February 2007
  
# Read in the data set
data <- read.table("./household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")

# Fix types
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# Get data from Feb 1 2007 and Feb 2 2007
feb <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Generate plot
png("plot1.png", width=480, height=480)
hist(feb$Global_active_power, col="red", border="black", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()