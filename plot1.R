#Read Dataset 
inputFileName <- "./household_power_consumption.txt"
pcData <- read.table(inputFileName, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
#names(pcData)

#filter the subset of data
filteredData <- pcData[pcData$Date %in% c("1/2/2007", "2/2/2007"),]

#summary(trimmedData)
#extract active power 
activePower <- as.numeric(filteredData$Global_active_power)

#open graphic device
png("plot1.png", width=480, height=480)

#plot the chart
hist(activePower, col="red", main="Global Active Power", xlab = "Global Active Power (Kilowatts)")

#turn off/close 
dev.off()


