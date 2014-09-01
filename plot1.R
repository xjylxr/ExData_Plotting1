#get data in
datafull<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
datafull$Date<-as.Date(datafull$Date, format="%d/%m/%Y")
datafull$Global_active_power<-as.numeric(datafull$Global_active_power)
dataneed<-datafull[datafull$Date=="2007-02-01" | datafull$Date=="2007-02-02",]
#plot data for 1
png("plot1.png")
with(dataneed,hist(Global_active_power,col="red", xlab="Global Acitve Power (kilowatts)", ylab="Frequency",main="Global Active Power"))
dev.off()