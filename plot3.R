##Read in the data file as a readable table
alldata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

##Correctly format the date and time for this plot
FullTimeDate <- strptime(paste(alldata$Date, alldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
alldata <- cbind(alldata, FullTimeDate)

## change class of all columns to correct class
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
alldata$Time <- format(alldata$Time, format="%H:%M:%S")
alldata$Global_active_power <- as.numeric(alldata$Global_active_power)
alldata$Global_reactive_power <- as.numeric(alldata$Global_reactive_power)
alldata$Voltage <- as.numeric(alldata$Voltage)
alldata$Global_intensity <- as.numeric(alldata$Global_intensity)
alldata$Sub_metering_1 <- as.numeric(alldata$Sub_metering_1)
alldata$Sub_metering_2 <- as.numeric(alldata$Sub_metering_2)
alldata$Sub_metering_3 <- as.numeric(alldata$Sub_metering_3)

##Extract the data needed from the total data set for the purposes of the plotting
subsetdata <- subset(alldata, Date == "2007-02-01" | Date =="2007-02-02")

##Open a PNG file
png("plot3.png", width = 480, height = 480)

##Create the plot
plot(subsetdata$FullTimeDate, subsetdata$Sub_metering_1, type = "l", 
     main = "Plot 3", xlab = "Date", ylab = "Energy Sub Metering")
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_2, type = "l", col = "red")
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_3, type = "l", col = "blue")

##Create a legend for the plot
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

##Close the PNG device
dev.off()