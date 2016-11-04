# load data from txt file
dataFilePath<-'./MYDSProject/mydata/ExplorityData/Ch1/household_power_consumption.txt'
plotData <- read.table(dataFilePath, header=TRUE, sep=";", na.strings="?")
# filter required data i.e. 1/2/2007" to "2/2/2007"
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
# create final dataset
finalData <- cbind(SetTime, finalData)

# Plot 2 
# prepare the PNG 
png(filename = "./MYDSProject/mydata/ExplorityData/Ch1/Plot2.png",width = 480, height = 480, units = "px")

# plot
plot(finalData$SetTime,finalData$Global_active_power, type="l",col="black",xlab = "", ylab="Global Active Power (kilowatts)")
# export to png
dev.off()
