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
#--Plot 2
#----------------------
#Plot for Screen
par(mfrow = c(1,1))
plot(data.sub$date.time,data.sub$Global_active_power, ylab="Global Ative Power (kilowatts)"
                                                    , xlab=""
                                                    , type = "n"
     )
lines(data.sub$date.time,data.sub$Global_active_power)

#Plot for File
png(filename="plot2.png",width=480,height=480)
plot(data.sub$date.time,data.sub$Global_active_power, ylab="Global Ative Power (kilowatts)"
     , xlab=""
     , type = "n"
)
lines(data.sub$date.time,data.sub$Global_active_power)
dev.off()

