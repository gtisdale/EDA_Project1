#----------------------
#--Set up environment
#----------------------

rm(list = ls())
setwd("C:/Google Drive/71) Education/43) Coursera/Data Science - Johns Hopkins University/04 Exploratory Data Analysis/Project 1")

#----------------------
#--Read Data and Clean
#----------------------

data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
date.time <- paste(data$Date,", ",data$Time,sep="")
date.time.psx <- strptime(date.time, format ="%d/%m/%Y, %H:%M:%S")
data$date.time <- date.time.psx
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data.sub <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

#----------------------
#--Plot 1
#----------------------
#Plot for Screen
par(mfrow = c(1,1))
hist(data.sub$Global_active_power, ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red",main = "Global Active Power")

#Plot for File
png(filename="plot1.png",width=480,height=480)
hist(data.sub$Global_active_power, ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red",main = "Global Active Power")
dev.off()

