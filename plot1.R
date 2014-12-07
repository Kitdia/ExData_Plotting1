##reading and sub-setting of file

x<-read.table('household_power_consumption.txt',sep=';',header=TRUE,stringsAsFactors=FALSE,na.strings='?',dec=".")
x.sub<-x[x$Date %in% c('1/2/2007', '2/2/2007'), ]

##specify dim of the .png file

png("plot1.png", width=480, height=480)

##plotting

hist(x.sub$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')

dev.off()

