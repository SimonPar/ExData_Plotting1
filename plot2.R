getwd()
setwd("/Users/Simon/Coursera_R_programming/Course project 1 - Plotting")

filename <- "/Users/Simon/Coursera_R_programming/Course project 1 - Plotting/household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

# this is a massive dataset, so we subset because we only need two days
useful.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# call str to have a sense of how the data looks -- looks great
str(useful.data)

# build plot 2
datetime <- strptime(paste(useful.data$Date, useful.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") # don't really understand this function
globalactivepower <- as.numeric(useful.data$Global_active_power) # the first time I did it it said "x must be numeric". After that, I made it numeric
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(datetime, globalactivepower, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

# don't forget to turn off the graphics device!
dev.off()

