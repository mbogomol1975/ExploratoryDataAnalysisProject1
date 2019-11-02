## Read data from file
mydata<-fread("./household_power_consumption.txt", na.string="?")

## Select rows for the dates 1/7/2007 and 2/7/2007
newset<-subset(mydata, Date %in% c("1/2/2007","2/2/2007"))


png(file="plot4.png", width=480, height=480)

par(mfcol=c(2,2))
par(mar=c(4,3,1,1))

## Plot in top left, same as Plot2 
with(newset, plot(Global_active_power, type="l", 
                  ylab = "Global Active Power (kilowatts)", xlab="", xaxt='n'))
axis(1, at = c(1,0.5*(1+nrow(newset)), nrow(newset)), labels=c("Thu","Fri","Sat"))

## plot in lowerr left, same as Plot 3
with(newset, plot(Sub_metering_1, type="l", 
                  ylab = "Energy sub metering", xlab="", xaxt='n'))
with(newset, lines(Sub_metering_2, type="l", col="red"))
with(newset, lines(Sub_metering_3, type="l", col="blue"))
axis(1, at = c(1,0.5*(1+nrow(newset)), nrow(newset)), labels=c("Thu","Fri","Sat"))
legend("topright", col = c("black","red", "blue"), lwd=2, lty = 1, 
       legend=names(newset)[grep("^Sub",names(newset))], cex=.8, bty="n")

## Plot in top right
with(newset, plot(Voltage, type="l", 
                  ylab = "Voltage", xlab="datetime", xaxt='n'))
axis(1, at = c(1,0.5*(1+nrow(newset)), nrow(newset)), labels=c("Thu","Fri","Sat"))

## Plot in lower right
with(newset, plot(Global_reactive_power, type="l",ylab = names(newset$Global_reactive_power), 
                  xlab="datetime", xaxt='n', yaxt='n'))
axis(1, at = c(1,0.5*(1+nrow(newset)), nrow(newset)), labels=c("Thu","Fri","Sat"))
axis(2, at = seq(0.0:0.5, by = 0.1), labels=seq(0.0:0.5, by = 0.1), cex.axis =0.8)

dev.off()

