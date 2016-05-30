library(data.table)
data <- fread("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, colClasses=c("string","string","numeric","numeric","numeric","numeric","integer","integer","ingeter"),data.table=TRUE)
#
# Convert date column from string to date.
#
data[,Date:=as.Date(Date,format("%d/%m/%Y"))]
#
# Select only specific date range between 2007-02-01 and 2007-02-02
#
subdata <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')
#
# Draw plot1
#
hist(subdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,"plot1.png")
dev.off()