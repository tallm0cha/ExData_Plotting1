input_file <- read.delim2('household_power_consumption.txt', sep=';', stringsAsFactors = F)
head(input_file)
input_file$Date <- as.Date(input_file$Date, format='%d/%m/%Y')

workSet <- subset(input_file, Date >= "2007/02/01" & Date<="2007/02/02")
workSet$Global_active_power <- as.numeric(workSet$Global_active_power)


png(file='plot1.png',width=480, height=480, units='px', bg='transparent')
plot(hist(workSet$Global_active_power),
     col='red', xlab='Global Active Power (kilowatts)', ylab='Frequency', main='Global Active Power')
dev.off()
