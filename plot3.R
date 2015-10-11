#plot3.R
# read in data
datafile <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"

powerdata <- read.csv(datafile, header = TRUE, sep = ";", na.strings = "?", 
                      stringsAsFactors = FALSE, dec = ".")
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%y")

# subset data for two days only

subSet <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"), ]

# convert dates
datetime <- paste(as.Date(subSet$Date), subSet$Time)
subSet$Datetime <- as.POSIXct(datetime)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#plot3
with(subSet, {
  plot(subMetering1~datetime, type="1", xlab="", ylab="Global Active Power (kilowatts)")
  lines(subMetering2~datetime,type = "1", col= "red")
  lines(subMetering3~datetime, type = "1", col= "blue")
})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off() 
  