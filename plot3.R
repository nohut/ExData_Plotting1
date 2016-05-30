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
# Draw plot3
#
png(filename="plot3.png")
plot(subdata$timestamp1,subdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(subdata$timestamp1,subdata$Sub_metering_2,col="red")
lines(subdata$timestamp1,subdata$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()