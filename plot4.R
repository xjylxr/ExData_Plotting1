Sys.setlocale(category = "LC_TIME", locale = "C")
#get data in
datafull<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
datafull$Global_active_power<-as.numeric(datafull$Global_active_power)
datafull$Date<-as.Date(datafull$Date, format="%d/%m/%Y")
dataneed<-datafull[datafull$Date=="2007-02-01" | datafull$Date=="2007-02-02",]
dataneed$datenew<-paste(dataneed$Date,dataneed$Time)
dataneed$datenew2<-strptime(dataneed$datenew,format="%Y-%m-%d %H:%M:%S")
#plot data for 4
dataneed$Sub_metering_1<-as.numeric(dataneed$Sub_metering_1)
dataneed$Sub_metering_2<-as.numeric(dataneed$Sub_metering_2)
dataneed$Voltage<-as.numeric(dataneed$Voltage)
dataneed$Global_reactive_power<-as.numeric(dataneed$Global_reactive_power)
#file create
png("plot4.png")
par(mfrow = c(2, 2))
#gar1
with(dataneed,plot(datenew2, Global_active_power,type = "l", xlab="", ylab="Global Acitve Power"))
#gar2
with(dataneed,plot(datenew2, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
#gar3
with(dataneed,plot(datenew2, Sub_metering_1,type = "l", col="black", xlab="", ylab="Energy sub metering"))
with(dataneed,points(datenew2, Sub_metering_2,type = "l", col="red"))
with(dataneed,points(datenew2, Sub_metering_3,type = "l", col="blue"))
legend("topright", pch="--", col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#gar4
with(dataneed,plot(datenew2, Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()