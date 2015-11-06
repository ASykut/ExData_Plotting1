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
summary(sData)

##Plot 1
png(file = "plot1.png", bg = "transparent", width = 480,  height = 480)
hist(sData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()