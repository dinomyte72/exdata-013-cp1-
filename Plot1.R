library(dplyr)
# Read in data
datafile<-"./household_power_consumption.txt"
data<-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter data
data_filtered<-filter(data,Date=="1/2/2007" | Date=="2/2/2007")
# Convert to numeric
x<-as.numeric(data_filtered$Global_active_power)
# Create plot
png("plot1.png", width=480, height=480)
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()