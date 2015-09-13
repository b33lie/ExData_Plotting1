#PLOT 1

# Load data
full_dataset <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")

# Subsetting the data
data <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_dataset)

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot to file
globalActivePower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()