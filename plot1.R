getwd()
setwd("/Users/Simon/Coursera_R_programming/Course project 1 - Plotting")

filename <- "/Users/Simon/Coursera_R_programming/Course project 1 - Plotting/household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

# this is a massive dataset, so we subset because we only need two days
useful.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# call str to have a sense of how the data looks -- looks great
str(useful.data)

# let's start with plot 1
globalactivepower <- as.numeric(useful.data$Global_active_power) # the first time I did it it said "x must be numeric". After that, I made it numeric
png(filename = "plot1.png", bg = "transparent", width = 480, height = 480, units = "px")
hist(globalactivepower, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

# don't forget to turn off the graphics device!
dev.off()
