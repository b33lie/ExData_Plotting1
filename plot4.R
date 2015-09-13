## PLOT 4

# Load data
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot to file
globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(data$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(data$Datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$Datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(data$Datetime, subMetering2, type="l", col="red")
lines(data$Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(data$Datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()