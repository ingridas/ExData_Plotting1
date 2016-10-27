data <- read.csv("household_power_consumption.txt", sep=";")
data1 <- subset(data,Date =="1/2/2007" | Date =="2/2/2007")
# combine date and time
data1$Time <- strptime(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")
data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1$Global_reactive_power <- as.numeric(as.character(data1$Global_reactive_power))
data1$Voltage <- as.numeric(as.character(data1$Voltage))

png(file="plot4.png",width=480,height=480)
par(bg=NA)
par(mfrow = c(2,2))
# figure 1
with(data1,plot(Time,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
# figure 2
with(data1,plot(Time,Voltage,type="l",ylab="Voltage",xlab="datetime"))
# figure 3
with(data1,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering", xlab=""))
with(data1,points(Time,Sub_metering_2,type="l",col="Red"))
with(data1,points(Time,Sub_metering_3,type="l",col = "Blue"))
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), box.lty=0)
# figure 4
with(data1,plot(Time,Global_reactive_power,type="l",xlab="datetime"))
dev.off()
