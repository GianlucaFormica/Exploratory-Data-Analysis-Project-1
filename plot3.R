## Code below requires that household_power_consumption.txt is in the working directory
system.time ( hpc <- read.csv.sql(file = "household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep = ";") )
datetime<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(1, 1))

##plot3
plot(datetime,hpc$Sub_metering_1,type="n",ylab = "Energy sub metering", xlab = "")
lines(datetime, hpc$Sub_metering_1,col="black")
lines(datetime,hpc$Sub_metering_2,col="red")
lines(datetime,hpc$Sub_metering_3,col="blue")
legText<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = legText, lty="solid", col = c(1,2,4))
