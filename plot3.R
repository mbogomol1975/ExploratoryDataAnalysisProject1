## Read data from file
mydata<-fread("./household_power_consumption.txt", na.string="?")

## Select rows for the dates 1/7/2007 and 2/7/2007
newset<-subset(mydata, Date %in% c("1/2/2007","2/2/2007"))


png(file="plot3.png", width=480, height=480)
with(newset, plot(Sub_metering_1, type="l", 
                  ylab = "Energy sub metering", xlab="", xaxt='n'))
with(newset, lines(Sub_metering_2, type="l", col="red"))
with(newset, lines(Sub_metering_3, type="l", col="blue"))
axis(1, at = c(1,0.5*(1+nrow(newset)), nrow(newset)), labels=c("Thu","Fri","Sat"))
legend("topright", col = c("black","red", "blue"), lwd=2, lty = 1, 
       legend=names(newset)[grep("^Sub",names(newset))])
dev.off()

