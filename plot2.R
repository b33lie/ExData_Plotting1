#PLOT 1

# Load data
full_data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Subsetting the data
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_data)

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot  to file
globalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(data$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()