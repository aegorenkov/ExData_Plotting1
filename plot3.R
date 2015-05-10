# Loading the data
## Note that in this dataset missing values are coded as `?`.
data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", 
                   sep = ';', 
                   header = TRUE,
                   na.string = '?',
)

## You may find it useful to convert the Date and Time variables to
## Date/Time classes in R using the `strptime()` and `as.Date()`
## functions.

library(lubridate)
## We will only be using data from the dates 2007-02-01 and 2007-02-02.
data$Date_time = dmy_hms(paste(data$Date, data$Time))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
upper_date <- as.Date("2007-02-02", format = "%Y-%m-%d")
lower_date <- as.Date("2007-02-01", format = "%Y-%m-%d")
data <- data[data$Date >= lower_date & data$Date <= upper_date,]

# Making the plot
png(filename = "plot3.png", width = 480, height = 480)
par(mfrow = c(1, 1), bg = "transparent")
plot(data$Date_time, data$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering",
     type = 'n')
lines(data$Date_time, data$Sub_metering_1, col = "black")
lines(data$Date_time, data$Sub_metering_2, col = "red")
lines(data$Date_time, data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue")
       )
dev.off()
## Construct the plot and save it to a PNG file with a width of 480
## pixels and a height of 480 pixels.

### Plot description
## lineplot
## Title ""
## y-axis label: "Energy sub metering", range: 0-30 (by 10)
## x-axis label: "", range: ("Thu", "Fri", "Sat")
## Series (sub_metering_1, sub_metering_2, sub_metering_3)
## Legend in upper right corner

## Name each of the plot files as `plot1.png`, `plot2.png`, etc.

## Add the PNG file and R code file to your git repository
