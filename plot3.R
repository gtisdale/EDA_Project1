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
#--Plot 3
#----------------------
#Plot for Screen
par(mfrow = c(1,1))
plot(data.sub$date.time,data.sub$Sub_metering_1, ylab="Energy sub metering"
     , xlab=""
     , type = "n"
)
lines(data.sub$date.time,data.sub$Sub_metering_1)
lines(data.sub$date.time,data.sub$Sub_metering_2, col="red")
lines(data.sub$date.time,data.sub$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot for File
png(filename="plot3.png",width=480,height=480)
plot(data.sub$date.time,data.sub$Sub_metering_1, ylab="Energy sub metering"
     , xlab=""
     , type = "n"
)
lines(data.sub$date.time,data.sub$Sub_metering_1)
lines(data.sub$date.time,data.sub$Sub_metering_2, col="red")
lines(data.sub$date.time,data.sub$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


