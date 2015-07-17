#Plot 3
source("plot1.R")

#start writing to png device
png(filename = "plot3.png", width = 480, height = 480, units = 'px')

#plot submetering against time
plot(mergedata$datetime, mergedata$Sub_metering_1, col = "black", type = "l", 
    xlab="", ylab="Energy Sub Metering")
lines(mergedata$datetime, mergedata$Sub_metering_2, col = "red", type = "l")
lines(mergedata$datetime, mergedata$Sub_metering_3, col = "blue", type = "l")

#legend
legend('topright', legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col= c ('black','red','blue'), lty = 'solid')

dev.off()
