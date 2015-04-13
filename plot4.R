library(dplyr)
# Read in data
datafile<-"./household_power_consumption.txt"
data<-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter data
data_filtered<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
# Create plotting variables
x<-strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
v<-as.numeric(data_filtered$Global_active_power)
w<-as.numeric(data_filtered$Global_reactive_power)
y<-as.numeric(data_filtered$Voltage)
z1<-as.numeric(data_filtered$Sub_metering_1)
z2<-as.numeric(data_filtered$Sub_metering_2)
z3<-as.numeric(data_filtered$Sub_metering_3)
# Create plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(x, v, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(x, y, type="l", xlab="datetime", ylab="Voltage")
plot(x, z1, type="l", ylab="Energy sub metering", xlab="")
lines(x, z2, type="l", col="red")
lines(x, z3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(x, w, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()