# load data from txt file
dataFilePath<-'./MYDSProject/mydata/ExplorityData/Ch1/household_power_consumption.txt'
plotData <- read.table(dataFilePath, header=TRUE, sep=";", na.strings="?")
# filter required data i.e. 1/2/2007" to "2/2/2007"
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# create final dataset
finalData <- cbind(SetTime, finalData)

# Plot 3 
# prepare the PNG 
png(filename = "./MYDSProject/mydata/ExplorityData/Ch1/Plot3.png",width = 480, height = 480, units = "px")

# plot

plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, col="blue")
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=labels, col=columnlines, lty="solid")

# export to png
dev.off()
