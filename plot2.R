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

SDate <- as.Date(sData$Date, "%d/%m/%Y")
DayOfWeek <- as.POSIXlt(SDate)$wday
DayOfWeekLabel <- strftime(SDate, "%a")

SDateTime <- strptime(paste(sData$Date, sData$Time), "%d/%m/%Y %H:%M") 

##Plot 2
png(file = "plot2.png", bg = "transparent", width = 480,  height = 480)
plot(SDateTime, sData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(SDateTime, sData$Global_active_power)
dev.off()
