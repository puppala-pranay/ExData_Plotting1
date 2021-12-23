
## read and subset data

data <- read.table("./datafile/household_power_consumption.txt", sep = ";",header = TRUE)
data$Date_time <- strptime( paste(data$Date, data$Time ,sep=" ") , format = "%d/%m/%Y %H:%M:%S")
data <- data[which(data$Date_time >= "2007-02-01"&data$Date_time < "2007-02-03") ,]

## Plot and copy to png file
par(mfrow=c(1,1))
hist(as.numeric(data$Global_active_power),col = "red" , main = "Global Active Power",
     xlab = "Global Active Power (Kilowatt)" )
dev.copy(png,filename = "plot1.png",width=480,height=480)
dev.off()
