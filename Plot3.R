data <- read.csv("household_power_consumption.txt", sep=";")
data1 <- subset(data,Date =="1/2/2007" | Date =="2/2/2007")
# combine date and time
data1$Time <- strptime(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")

data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))

png(file="plot3.png",width=480,height=480)
par(bg=NA)
with(data1,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering", xlab=""))
with(data1,points(Time,Sub_metering_2,type="l",col="Red"))
with(data1,points(Time,Sub_metering_3,type="l",col = "Blue"))
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex = 0.8)

dev.off()
