library(data.table)
data <- fread("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, colClasses=c("string","string","numeric","numeric","numeric","numeric","integer","integer","ingeter"),data.table=TRUE)
#
# Convert date column from string to date.
data$Date1 <- as.Date(data$Date,format("%d/%m/%Y"))
#
# Select only specific date range between 2007-02-01 and 2007-02-02
#
subdata <- subset(data, Date1 >= '2007-02-01' & Date1 <= '2007-02-02')
subdata$timestamp <- paste(subdata$Date, subdata$Time)
subdata$timestamp1 <- as.POSIXct(strptime(subdata$timestamp, "%d/%m/%Y %H:%M:%S"))
#
# Draw plot2
#
plot(subdata$timestamp1,subdata$Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",type="l")
dev.copy(png,"plot2.png")
dev.off()