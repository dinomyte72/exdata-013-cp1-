library(dplyr)
# Read in data
datafile<-"./household_power_consumption.txt"
data<-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter data
data_filtered<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
# Create x and y variables
x<-strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y<-as.numeric(data_filtered$Global_active_power)
# Create plot
png("plot2.png", width=480, height=480)
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()