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
png(filename = "plot2.png", width = 480, height = 480)
data$Date_time = dmy_hms(paste(data$Date, data$Time))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
upper_date <- as.Date("2007-02-02", format = "%Y-%m-%d")
lower_date <- as.Date("2007-02-01", format = "%Y-%m-%d")
data <- data[data$Date >= lower_date & data$Date <= upper_date,]

# Making the plot
par(mfrow = c(1, 1),  bg = "transparent")
plot(data$Date_time, data$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = 'n')
lines(data$Date_time, data$Global_active_power)

dev.off()
## Construct the plot and save it to a PNG file with a width of 480
## pixels and a height of 480 pixels.

### Plot description
## lineplot
## Title ""
## y-axis label: "Global Active Power (kilowatts)", range: 0-6
## x-axis label: "", range: ("Thu", "Fri", "Sat")

## Name each of the plot files as `plot1.png`, `plot2.png`, etc.

## Add the PNG file and R code file to your git repository
