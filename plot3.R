dataFile <- "C:\\Users\\Thato-JD\\Desktop\\Quize\\Exploratory data analysis\\household_power_consumption.txt"

datafile = read.table(dataFile,header = TRUE,sep = ";",stringsAsFactors = FALSE)
subetdata= datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]
datatime = strptime(paste(subetdata$Date,subetdata$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
globalpoweractive = as.numeric(subetdata$Global_active_power)

submetering1 = as.numeric(subetdata$Sub_metering_1)
submetering2 = as.numeric(subetdata$Sub_metering_2)
submetering3 = as.numeric(subetdata$Sub_metering_3)


png("plot3.png",width = 480,height = 480)
plot(datatime,submetering1,type ="l",ylab = "Energy Submetering",xlab = "")
lines(datatime,submetering2,type = "l",col= "red")
lines(datatime,submetering3,type = "l",col = "blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = 1,lwd = 2.5,col = c("black","red","blue"))

dev.off()
