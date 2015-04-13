library(dplyr)
# Read in data
datafile<-"./household_power_consumption.txt"
data<-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter data
data_filtered<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
# Create x and y variables
x<-strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y1<-as.numeric(data_filtered$Sub_metering_1)
y2<-as.numeric(data_filtered$Sub_metering_2)
y3<-as.numeric(data_filtered$Sub_metering_3)
# Create plot
png("plot3.png", width=480, height=480)
plot(x, y1, type="l", ylab="Energy sub metering", xlab="")
lines(x, y2, type="l", col="red")
lines(x, y3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()