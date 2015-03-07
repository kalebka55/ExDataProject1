library(data.table)
data<-fread("household_power_consumption.txt")
date<-strptime(data$Date, format="%d/%m/%Y")
DT<-data[(date>="2007-02-01") & (date<="2007-02-02"), ]
dateTime <- strptime(paste(DT$Date, DT$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")
png(file="plot2.png",width=480,height=480)
plot(x=dateTime, y=as.numeric(DT$Global_active_power), type='l',
     xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
