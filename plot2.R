## Read data from file
mydata<-fread("./household_power_consumption.txt", na.string="?")

## Select rows for the dates 1/7/2007 and 2/7/2007
newset<-subset(mydata, Date %in% c("1/2/2007","2/2/2007"))


png(file="plot2.png", width=480, height=480)
with(newset, plot(Global_active_power, type="l", 
                  ylab = "Global Active Power (kilowatts)", xlab="", xaxt='n'))
axis(1, at = c(1,0.5*(1+nrow(newset)), nrow(newset)), labels=c("Thu","Fri","Sat"))
dev.off()

