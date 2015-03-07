library(data.table)
data<-fread("household_power_consumption.txt")
date<-strptime(data$Date, format="%d/%m/%Y")
DT<-data[(date>="2007-02-01") & (date<="2007-02-02"), ]
DT$datetime <- as.vector(strptime(paste(DT$Date, DT$Time, sep=' '), format="%d/%m/%Y %H:%M:%S"))
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(DT,{
  plot(x=dateTime, y=as.numeric(DT$Global_active_power), type='l',
       xlab="", ylab="Global Active Power(kilowatts)")
  plot(x=dateTime, y=as.numeric(DT$Voltage), type='l',
       xlab="", ylab="Voltage")
  plot(x=dateTime, y=as.numeric(DT$Sub_metering_1), type='l',
       xlab="", ylab="Energy sub metering", col='black')
  lines(x=dateTime, y=as.numeric(DT$Sub_metering_2), type='l',
        xlab="", ylab="Energy sub metering", col='red')
  lines(x=dateTime, y=as.numeric(DT$Sub_metering_3), type='l',
        xlab="", ylab="Energy sub metering", col='blue')
  legend("topright", col=c('black', 'red', 'blue'), lty=1, bty='n',
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot(x=dateTime, y=as.numeric(DT$Global_reactive_power), type='l',
       xlab="", ylab="Global_reactive_power")
})
dev.off()
