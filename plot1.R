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

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
upper_date <- as.Date("2007-02-02", format = "%Y-%m-%d")
lower_date <- as.Date("2007-02-01", format = "%Y-%m-%d")
data <- data[data$Date >= lower_date & data$Date <= upper_date,]

# Making the plot

## Construct the plot and save it to a PNG file with a width of 480
## pixels and a height of 480 pixels.

### Plot description
## Histogram
## Title "Global Active Power"
## y-axis label: "Frequency", range: 0-1200
## x-axis label: "Global Active Power (kilowatts)", range: 0-6

## Name each of the plot files as `plot1.png`, `plot2.png`, etc.

## Add the PNG file and R code file to your git repository
