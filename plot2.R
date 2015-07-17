#Plot 2
source("plot1.R")

#start writing to png device
png(filename = 'plot2.png', width = 480, height = 480, units ="px")

#plot graphic
plot(mergedata$datetime, mergedata$Global_active_power, type= "l", 
    ylab="Global Active Power (kilowatts)", xlab = "")

dev.off()


