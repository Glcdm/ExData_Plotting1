setwd("C:/Users/Gauthier/Documents/R Working Directory/Exploratory Data Analysis/")
file<-"./data/household_power_consumption.txt"
##Create PNG file
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
##Load data
data<-read.table(file, sep = ";", na.strings = "?",header=T)
##Transform Date field
data$Date<-strptime(as.character(data$Date),format='%d/%m/%Y')
data<-subset(data, data$Date==strptime(as.character("2007-02-01"), "%Y-%m-%d") | data$Date==strptime(as.character("2007-02-02"), "%Y-%m-%d"))
##Create Tot_Date as a concatenation of Data & Time
data$Tot_Date<-strptime(as.character(paste(data$Date,data$Time,sep=" ")),format='%Y-%m-%d %H:%M:%S')
##Create a panel of graph 2 x 2
par(mfrow=c(2,2))
##Plotting graph 1
plot(data$Tot_Date, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
    col="Gray0")
##Plotting graph 2
plot(data$Tot_Date, data$Voltage,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
    col="Gray0")
##Plotting graph 3
plot(data$Tot_Date, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
    col="Gray0")
lines(data$Tot_Date, data$Sub_metering_2,col="Red")
lines(data$Tot_Date, data$Sub_metering_3, col="Blue")
legend("topright", pch="-",col=c("Gray0","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##Plotting graph 4
plot(data$Tot_Date, data3$Global_reactive_power,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
    col="Gray0")
##close device
dev.off()