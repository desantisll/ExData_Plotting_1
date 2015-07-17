library(data.table)

##download zip and read
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/exdata-data-household_power_consumption.zip", method = "curl")
dateDownloaded <- date()
txt <- unzip("./data/exdata-data-household_power_consumption.zip")

powerData = read.table(txt, sep = ";", header = TRUE, na.strings = "?")

##create dataframes of specific dates
feb01 <- powerData[powerData$Date=="1/2/2007",]
feb02 <- powerData[powerData$Date=="2/2/2007",]
#turn into tables and merge
feb02table <- data.table(feb02)
feb01table <- data.table(feb01)
mergedata <- rbind(feb01table, feb02table)

#format date
df <- as.Date(mergedata$Date, format("%d/%m/%Y"))
mergedata$Date <- df
#make date and time column 
mergedata$datetime <- as.POSIXct(paste(mergedata$Date, mergedata$Time), format="%Y-%m-%d %H:%M:%S")

#format
par(mfrow = c(1, 1), mar = c(5, 4, 2, 1))

##open 
png(filename = "plot1.png", width=480, height=480, units="px")

##plot and fix numeric problem
hist(as.numeric(as.character(mergedata$Global_active_power)), col = "red",main ="Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 15)

dev.off()


