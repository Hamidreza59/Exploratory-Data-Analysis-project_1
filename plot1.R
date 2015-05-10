## Plot1
## Reading the data set
EPC <- read.csv("/Users/hamidrezaouni/Documents/exploratory data analysis/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
## converting data to Date calss
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
## subsetting data for 2007-02-01 to 2007-02-02
my_data <- subset(EPC, EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02")

## Histogram 
hist(my_data$Global_reactive_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = "red")

## copying as a png format
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
