#Read Dataset 
inputFileName <- "./household_power_consumption.txt"
pcData <- read.table(inputFileName, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
#names(pcData)

#filter the subset of data
filteredData <- pcData[pcData$Date %in% c("1/2/2007", "2/2/2007"),]

#summary(filteredData)
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#extract active power 
activePower <- as.numeric(filteredData$Global_active_power)


subMeter1 <- as.numeric(filteredData$Sub_metering_1)
subMeter2 <- as.numeric(filteredData$Sub_metering_2)
subMeter3 <- as.numeric(filteredData$Sub_metering_3)


#open graphic device
png("plot3.png", width=480, height=480)

#plot the chart
plot(datetime, subMeter1, type="l",  xlab="", ylab = "Energy Submetering")
lines(datetime, subMeter2, type="l",  col="red", ylab = "Energy Submetering")
lines(datetime, subMeter3, type="l",  col="blue", ylab = "Energy Submetering")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))
 
#turn off/close 
dev.off()