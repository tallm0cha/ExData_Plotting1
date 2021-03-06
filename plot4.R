input_file <- read.delim2('household_power_consumption.txt', sep=';', stringsAsFactors = F)
head(input_file)
input_file$Date <- as.Date(input_file$Date, format='%d/%m/%Y')
workSet <- subset(input_file, Date >= "2007/02/01" & Date<="2007/02/02")
workSet$Global_active_power <- as.numeric(workSet$Global_active_power)
workSet$Global_reactive_power <- as.numeric(workSet$Global_reactive_power)
workSet$Voltage <- as.numeric(workSet$Voltage)
workSet$Sub_metering_1 <- as.numeric(workSet$Sub_metering_1)
workSet$Sub_metering_2 <- as.numeric(workSet$Sub_metering_2)
workSet$Sub_metering_3 <- as.numeric(workSet$Sub_metering_3)

workSet$DateTime <- strptime(paste(workSet$Date,workSet$Time, sep=' '),format = '%Y-%m-%d %H:%M:%S')

png(file='plot4.png',width=480, height=480, units='px', bg='transparent')
par(mfrow=c(2,2))
#Plot 1
plot(workSet$DateTime,workSet$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', main='', type='l')

#Plot 2
plot(workSet$DateTime,workSet$Voltage, xlab='datetime', ylab='Voltage', main='', type='l')

#Plot 3
plot(workSet$DateTime,workSet$Sub_metering_1, ylim=c(0, max(workSet$Sub_metering_1)), xlab='', ylab='Energy sub metering', main='', type='l')
par(new=T)
plot(workSet$DateTime,workSet$Sub_metering_2, ylim=c(0, max(workSet$Sub_metering_1)), xlab='', ylab='Energy sub metering', col='red', type='l')
par(new=T)
plot(workSet$DateTime,workSet$Sub_metering_3, ylim=c(0, max(workSet$Sub_metering_1)), xlab='', ylab='Energy sub metering', col='blue', type='l')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c('black','red','blue'), lty=1)

#Plot 4
plot(workSet$DateTime,workSet$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', main='', type='l')

dev.off()
