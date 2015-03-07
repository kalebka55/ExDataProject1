library(data.table)
data<-fread("household_power_consumption.txt")
date<-strptime(data$Date, format="%d/%m/%Y")
DT<-data[(date>="2007-02-01") & (date<="2007-02-02"), ]
png(file="plot1.png",width=480,height=480)
hist(as.numeric(DT$Global_active_power),
     main="Global active power", xlab="Global Active Power(kilowatts)", ylab="Frequency",
     col='red', ylim=c(0,1200))
dev.off()


