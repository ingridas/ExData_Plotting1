data <- read.csv("household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
data1 <- subset(data,Date =="2007-02-01" | Date =="2007-02-02")
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

png(file="plot1.png",width=480,height=480)
par(bg=NA)
hist(as.numeric(data1$Global_active_power), main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     border="black", 
     col="red")
dev.off()
