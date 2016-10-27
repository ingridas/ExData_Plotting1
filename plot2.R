data <- read.csv("household_power_consumption.txt", sep=";")
data1 <- subset(data,Date =="1/2/2007" | Date =="2/2/2007")
# combine date and time
data1$Time <- strptime(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

png(file="plot2.png",width=480,height=480)
par(bg=NA)
plot(data1$Time,data1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()