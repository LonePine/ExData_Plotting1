#plot4.R
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
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
  
#plot4    

par(mfrow = c(2, 2), mar= c(4,4,2,1), oma= c(0,0,2,0)) 

with(subSet, {
  
plot( globalActivePower~datetime, type="l", xlab="", ylab="Global Active Power(kilowatts)", cex=0.2)

  plot(voltage~datetime, type="l", xlab="", ylab="Voltage(volts)")

  plot(subMetering1~datetime, type="l", xlab="", ylab="Energy Submetering")
lines(subMetering2~datetime, type="l", col="red")
lines(subMetering3~datetime, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"), bty="n")

plot( globalReactivePower~datetime, type="l", xlab="", ylab="Global_reactive_power(kilowatts)")
})
dev.copy(png, file= "plot4.png", width=480, height=480)
dev.off() 
  