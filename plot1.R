fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./G&C Data/power.csv", method = "curl")
dateDownloaded <- date()

powerData = read.table("./G&C Data/household_power_consumption.txt", sep = ";", header = TRUE)
head(powerData)
summary(powerData)

##create dataframes of specific dates
feb01 <- powerData[powerData$Date=="1/2/2007",]
feb02 <- powerData[powerData$Date=="2/2/2007",]

#turn into tables and merge
feb02table <- data.table(feb02)
feb01table <- data.table(feb01)
mergedata <- rbind(feb01table, feb02table)

#format
par(mfrow = c(1, 1), mar = c(5, 4, 2, 1))

##plot and fix numericproblem
hist(as.numeric(as.character(mergedata$Global_active_power)), col = "red",main ="Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 15)
