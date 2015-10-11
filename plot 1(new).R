#plot 1.R
# read in the data
datafile <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"

powerdata <- read.csv(datafile, header = TRUE, sep = ";", na.strings = "?", 
                      stringsAsFactors = FALSE, dec = ".")
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%y")

# subset data for two days only

subSet <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"), ]
# convert dates
datetime <- paste(as.Date(subSet$Date), subSet$Time)
subSet$Datetime <- as.POSIXct(datetime)

# plot 1
globalActivePower <- as.numeric(subSet$Global_active_power)

hist(globalActivePower, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.copy(png, file = "plot1.png", height= 480, width= 480 )
dev.off()