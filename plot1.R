##Read in the data file as a readable table
alldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

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
mydata <- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))

##Format the dates in the table 
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

##Open a PNG file
png("plot1.png", width = 480, height = 480)

##Create the plot
hist(mydata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Close the PNG device
dev.off()
