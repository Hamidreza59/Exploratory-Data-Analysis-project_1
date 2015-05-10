## Plot4
## Reading the data set
EPC <- read.csv("/Users/hamidrezaouni/Documents/exploratory data analysis/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
## converting data to Date calss
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
## subsetting data for 2007-02-01 to 2007-02-02
my_data <- subset(EPC, EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02")

## merging date and time and converting to rigth format
my_data$datetime = as.POSIXct(my_data$datetime)
my_data$datetime <- paste(my_data$Date, my_data$Time)

## Ploting
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(my_data, {
  plot(datetime, Global_active_power, type = "l", ylab="Global Active Power", xlab="")
  plot(datetime, Voltage, type = "l", ylab="Voltage", xlab="")
  plot(datetime, Sub_metering_1, ylab="Energy sub metering", type = "l", xlab="") 
  lines(datetime,Sub_metering_2, col = "red") 
  lines(datetime,Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, lty=1, bty="n",cex = 0.40)
  plot(datetime, Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
})

## copying with png format
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

