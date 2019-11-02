## Read data from file
mydata<-fread("./household_power_consumption.txt", na.string="?")

## Select rows for the dates 1/7/2007 and 2/7/2007
newset<-subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

png(file="plot1.png", width=480, height=480)
hist(newset$Global_active_power, main="Glodal Active Power", 
     xlab="Global Active Power (kilowatts)", col="red", breaks=12)
dev.off()

