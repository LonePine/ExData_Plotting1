# plot 2.R
# read in the data
datafile <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"

powerdata <- read.csv(datafile, header = TRUE, sep = ";", na.strings = "?",check.names = FALSE,
                      comment.char = "",quote = '\"', stringsAsFactors = FALSE, dec = ".")
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%y")

# subset data for two days only

subSet <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"), ]
# convert dates
datetime <- strptime(paste(as.Date(subSet$Date), subSet$Time, sep=""), "%d/%m/%y %H:%M:%S:")
subSet$Datetime <- as.POSIXct(datetime)

#plot2

globalActivePower <- as.numeric(subSet$Global_active_power)

plot(globalActivePower~ subSet$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file = "plot2.png", width=480, height=480)
dev.off() 
  