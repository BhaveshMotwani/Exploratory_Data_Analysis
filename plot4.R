md<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
head(md)
md$Date<-as.Date(md$Date,"%d/%m/%Y")
g<-subset(md,md$Date=="2007-02-01"|md$Date=="2007-02-02",na.rm=TRUE)
dt<-paste(g$Date,g$Time)
dt<-as.Date(dt)
dt<-strptime(dt,format='%Y-%m-%d %H:%M:%S')
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(dt,g$Global_active_power,type='l',ylab="Global Active Power (watts)",xlab="")
plot(dt,g$Voltage,type='l',xlab="datetime",ylab="Voltage")
plot(dt,g$Sub_metering_1,type='l',ylab='Energy Sub Metering')
lines(dt,g$Sub_metering_2,type='l',col='red')
lines(dt,g$Sub_metering_3,type='l',col='blue')
legend("topright",legend=c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"),col=c("black","red", "blue"),lty=1,bty="n")
plot(dt,g$Global_reactive_power,type='l',ylab="Global Reactive Power (watts)",xlab="datetime")
dev.off()