# load data from txt file
dataFilePath<-'./MYDSProject/mydata/ExplorityData/Ch1/household_power_consumption.txt'
plotData <- read.table(dataFilePath, header=TRUE, sep=";", na.strings="?")
# filter required data i.e. 1/2/2007" to "2/2/2007"
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# create final dataset
finalData <- cbind(SetTime, finalData)

# Plot 4 
# prepare the PNG 
png(filename = "./MYDSProject/mydata/ExplorityData/Ch1/Plot4.png",width = 480, height = 480, units = "px")

# plot

par(mfrow=c(2,2))

plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

# export to png
dev.off()
