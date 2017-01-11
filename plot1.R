library(lattice)
library(ggplot2)

input_file <- read.delim2('household_power_consumption.txt', sep=';', stringsAsFactors = F)
head(input_file)
input_file$Date <- as.Date(input_file$Date, format='%d/%m/%Y')

workSet <- subset(input_file, Date >= "2007/02/01" & Date<="2007/02/02")
workSet$Global_active_power <- as.numeric(workSet$Global_active_power)

workSet$Date

windows(480,480)
plot(hist(workSet$Global_active_power),
     col='red', xlab='Global Active Power (kilowatts)', ylab='Frequency', main='Global Active Power')
savePlot('plot1',type='png')
