##reading and sub-setting of file

x<-read.table('household_power_consumption.txt',sep=';',header=TRUE,stringsAsFactors=FALSE,na.strings='?',dec=".")
x.sub<-x[x$Date %in% c('1/2/2007', '2/2/2007'), ]

##getting the date time correct so that we can use it in plot() function

datetime <- strptime(paste(x.sub$Date, x.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##changing the target variables to numeric format so that we can use it in plot() function

globalActivePower <- as.numeric(x.sub$Global_active_power)
globalReactivePower <- as.numeric(x.sub$Global_reactive_power)
voltage <- as.numeric(x.sub$Voltage)
Sub.Metering.1 <- as.numeric(x.sub$Sub_metering_1)
Sub.Metering.2 <- as.numeric(x.sub$Sub_metering_2)
Sub.Metering.3 <- as.numeric(x.sub$Sub_metering_3)

##specify dim of the .png file

png("plot4.png", width=480, height=480)

##ensure the 4 plots occur in the same picture in 2 by 2 plots arrangement

par(mfrow = c(2, 2))

##plotting (according to the sequence specified by the question)

####first plot

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

####second plot

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

####third plot

######using lines() function to add in the lines
######using lengend() function to specify the location and naming of the legend

plot(datetime, Sub.Metering.1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub.Metering.2, type="l", col="red")
lines(datetime, Sub.Metering.3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

####fourth plot

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()