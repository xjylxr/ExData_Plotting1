Sys.setlocale(category = "LC_TIME", locale = "C")
#get data in
datafull<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
datafull$Global_active_power<-as.numeric(datafull$Global_active_power)
datafull$Date<-as.Date(datafull$Date, format="%d/%m/%Y")
dataneed<-datafull[datafull$Date=="2007-02-01" | datafull$Date=="2007-02-02",]
dataneed$datenew<-paste(dataneed$Date,dataneed$Time)
dataneed$datenew2<-strptime(dataneed$datenew,format="%Y-%m-%d %H:%M:%S")
#plot data for 3
dataneed$Sub_metering_1<-as.numeric(dataneed$Sub_metering_1)
dataneed$Sub_metering_2<-as.numeric(dataneed$Sub_metering_2)
png("plot3.png")
with(dataneed,plot(datenew2, Sub_metering_1,type = "l", col="black", xlab="", ylab="Energy sub metering"))
with(dataneed,points(datenew2, Sub_metering_2,type = "l", col="red"))
with(dataneed,points(datenew2, Sub_metering_3,type = "l", col="blue"))
legend("topright", pch="--", col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()