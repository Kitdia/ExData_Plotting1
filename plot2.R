##reading and sub-setting of file

x<-read.table('household_power_consumption.txt',sep=';',header=TRUE,stringsAsFactors=FALSE,na.strings='?',dec=".")
x.sub<-x[x$Date %in% c('1/2/2007', '2/2/2007'), ]

##getting the date time correct so that we can use it in plot() function

datetime <- strptime(paste(x.sub$Date, x.sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##specify dim of the .png file

png("plot2.png", width=480, height=480)

##plotting

plot(datetime, x.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()