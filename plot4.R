dataFile <- "C:\\Users\\Thato-JD\\Desktop\\Quize\\Exploratory data analysis\\household_power_consumption.txt"

datafile = read.table(dataFile,header = TRUE,sep = ";",stringsAsFactors = FALSE)
subetdata= datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]
datatime = strptime(paste(subetdata$Date,subetdata$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
globalpoweractive = as.numeric(subetdata$Global_active_power)
globalReactivePower = as.numeric(subetdata$Global_reactive_power)
voltage = as.numeric(subetdata$Voltage)

submetering1 = as.numeric(subetdata$Sub_metering_1)
submetering2 = as.numeric(subetdata$Sub_metering_2)
submetering3 = as.numeric(subetdata$Sub_metering_3)

png("plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))

plot(datatime,globalActivepower,type = "l",xlab = "",ylab = "Global Active Power",cex = 0.2)
plot(datatime,voltage,type = "l",xlab = "datetime",ylab = "Voltage")

plot(datatime,submetering1,type ="l",ylab = "Energy Submetering",xlab = "")
lines(datatime,submetering2,type = "l",col= "red")
lines(datatime,submetering3,type = "l",col = "blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = 1,lwd = 2.5,col = c("black","red","blue"),bty = "o")

plot(datatime,globalReactivePower,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()