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

##Plot 3
png(file = "plot3.png", bg = "transparent", width = 480,  height = 480)
with(sData, plot(SDateTime, sData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
lines(SDateTime, sData$Sub_metering_1, col = "black")
lines(SDateTime, sData$Sub_metering_2, col = "red")
lines(SDateTime, sData$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

