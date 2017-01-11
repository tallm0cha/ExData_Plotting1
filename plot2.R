input_file <- read.delim2('household_power_consumption.txt', sep=';', stringsAsFactors = F)
head(input_file)
input_file$Date <- as.Date(input_file$Date, format='%d/%m/%Y')
workSet <- subset(input_file, Date >= "2007/02/01" & Date<="2007/02/02")
workSet$Global_active_power <- as.numeric(workSet$Global_active_power)

workSet$DateTime <- strptime(paste(workSet$Date,workSet$Time, sep=' '),format = '%Y-%m-%d %H:%M:%S')

png(file='plot2.png',width=480, height=480, units='px', bg='transparent')
plot(workSet$DateTime,workSet$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', main='', type='l')
dev.off()
