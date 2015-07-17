#plot 4
source("plot1.R")

#start writing png
png(filename='plot4.png',width=480,height=480,units='px')

#format plot
par(mfrow = c(2,2))

#plot 1,1
plot(mergedata$datetime, mergedata$Global_active_power, main = "",xlab = "",
    ylab="Global Active Power", type="l",col="black")

#plot 1,2
plot(mergedata$datetime, mergedata$Voltage,type="l",col="black",main="",
    xlab="datetime",ylab="Voltage")

#plot 2,1
plot(mergedata$datetime, mergedata$Sub_metering_1, col = "black", type = "l",
    xlab = "", ylab = "Energy Sub Metering")
lines(mergedata$datetime, mergedata$Sub_metering_2, col = "red", type = "l")
lines(mergedata$datetime, mergedata$Sub_metering_3, col = "blue", type = "l")
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'), lty = 'solid')

#plot 2,2)
plot(mergedata$datetime, mergedata$Global_reactive_power, xlab = "datetime",
    ylab = "Global_reactive_power", col = "black", main = "", type = "l")

dev.off()
