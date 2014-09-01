Sys.setlocale(category = "LC_TIME", locale = "C")
#get data in
datafull<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
datafull$Global_active_power<-as.numeric(datafull$Global_active_power)
datafull$Date<-as.Date(datafull$Date, format="%d/%m/%Y")
dataneed<-datafull[datafull$Date=="2007-02-01" | datafull$Date=="2007-02-02",]
dataneed$datenew<-paste(dataneed$Date,dataneed$Time)
dataneed$datenew2<-strptime(dataneed$datenew,format="%Y-%m-%d %H:%M:%S")
#plot data for 2
png("plot2.png")
with(dataneed,plot(datenew2, Global_active_power,type = "l", xlab="", ylab="Global Acitve Power (kilowatts)"))
dev.off()