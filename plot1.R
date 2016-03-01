setwd("C:/Users/Gauthier/Documents/R Working Directory/Exploratory Data Analysis/")
file<-"./data/household_power_consumption.txt"
##Create PNG file
png(filename = "plot1.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
##Load data
data<-read.table(file, sep = ";", na.strings = "?",header=T)
##Transform Date field
data$Date<-strptime(as.character(data$Date),format='%d/%m/%Y')
data<-subset(data, data$Date==strptime(as.character("2007-02-01"), "%Y-%m-%d") | data$Date==strptime(as.character("2007-02-02"), "%Y-%m-%d"))
##Create Tot_Date as a concatenation of Data & Time
data$Tot_Date<-strptime(as.character(paste(data$Date,data$Time,sep=" ")),format='%Y-%m-%d %H:%M:%S')
##Plotting data
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
##close device
dev.off()