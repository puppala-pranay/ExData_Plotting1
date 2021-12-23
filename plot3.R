## read and subset data

data <- read.table("./datafile/household_power_consumption.txt", sep = ";",header = TRUE)
data$Date_time <- strptime( paste(data$Date, data$Time ,sep=" ") , format = "%d/%m/%Y %H:%M:%S")
data <- data[which(data$Date_time >= "2007-02-01"&data$Date_time < "2007-02-03") ,]

## Plot and copy to png file
par(mfrow=c(1,1))
plot(data$Date_time,data$Sub_metering_1,type="n", xlab = "data_time",ylab = "Energy Sub Metering")
lines(data$Date_time, data$Sub_metering_1)
lines(data$Date_time, data$Sub_metering_2,col="red")
lines(data$Date_time, data$Sub_metering_3,col="blue")
legend("topright",legend = c("sub_metering_1","sub_metering_2","sub_metering_3") , col = c("black","red","blue"), lty = 1,lwd = 2 ) 
dev.copy(png,filename = "plot3.png",width=480,height=480)
dev.off()
