## PLOT 3

# Load data
full_data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot to file
globalActivePower <- as.numeric(data$Global_active_power)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(data$Datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(data$Datetime, subMetering2, type="l", col="red")
lines(data$Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()