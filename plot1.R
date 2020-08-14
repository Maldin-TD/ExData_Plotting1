file = "C:\\Users\\Thato-JD\\Desktop\\Quize\\Exploratory data analysis\\household_power_consumption.txt"
data = read.table(file,header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")

subsetdata = data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivepower = as.numeric(subsetdata$Global_active_power)
png("plot1.png",width = 480,height = 480)
hist(globalActivepower,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")

dev.off()
