## Plot2
## Reading the data set
EPC <- read.csv("/Users/hamidrezaouni/Documents/exploratory data analysis/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
## converting data to Date calss
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
## subsetting data for 2007-02-01 to 2007-02-02
my_data <- subset(EPC, EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02")

## merging date and time and converting to rigth format
my_data$datetime = as.POSIXct(my_data$datetime)
my_data$datetime <- paste(my_data$Date, my_data$Time)

## plotting data
with(my_data, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab= ""))

## copying the plot as png format
dev.copy(png, file = "plot2.png", height = 480, width=480)
dev.off()
