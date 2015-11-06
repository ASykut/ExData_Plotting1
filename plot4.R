setwd("C:/Coursera/Explore/Project1/ExData_Plotting1")

##download and extract data file##
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "hpc.zip")
data <- read.csv(unz("hpc.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
unlink("hpc.zip")

head(data$Date)
FormattedDate <- as.Date(data$Date, "%d/%m/%Y")
sData1 <- subset(data, FormattedDate == "2007-02-01")
sData2 <- subset(data, FormattedDate == "2007-02-02")
sData <- rbind(sData1, sData2)
head(sData)
SDate <- as.Date(sData$Date, "%d/%m/%Y")
DayOfWeek <- as.POSIXlt(SDate)$wday
DayOfWeekLabel <- strftime(SDate, "%a")

SDateTime <- strptime(paste(sData$Date, sData$Time), "%d/%m/%Y %H:%M") 

##Plot 4
png(file = "plot4.png", bg = "transparent", width = 480,  height = 480)
par(mfrow = c(2,2))
with(sData, {
     
plot(SDateTime, sData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(SDateTime, sData$Global_active_power)

plot(SDateTime, sData$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(SDateTime, sData$Voltage)

plot(SDateTime, sData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(SDateTime, sData$Sub_metering_1, col = "black")
lines(SDateTime, sData$Sub_metering_2, col = "red")
lines(SDateTime, sData$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(SDateTime, sData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(SDateTime, sData$Global_reactive_power)
}
            
)
dev.off()

