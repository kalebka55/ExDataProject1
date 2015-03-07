library(data.table)
data<-fread("household_power_consumption.txt")
date<-strptime(data$Date, format="%d/%m/%Y")
DT<-data[(date>="2007-02-01") & (date<="2007-02-02"), ]
dateTime <- strptime(paste(DT$Date, DT$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")
png(file="plot3.png",width=480,height=480)
plot(x=dateTime, y=as.numeric(DT$Sub_metering_1), type='l',
     xlab="", ylab="Energy sub metering", col='black')
lines(x=dateTime, y=as.numeric(DT$Sub_metering_2), type='l',
     xlab="", ylab="Energy sub metering", col='red')
lines(x=dateTime, y=as.numeric(DT$Sub_metering_3), type='l',
      xlab="", ylab="Energy sub metering", col='blue')
legend("topright", col=c('black', 'red', 'blue'), lty=1,
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
