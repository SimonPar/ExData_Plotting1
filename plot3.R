getwd()
setwd("/Users/Simon/Coursera_R_programming/Course project 1 - Plotting")

filename <- "/Users/Simon/Coursera_R_programming/Course project 1 - Plotting/household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

# this is a massive dataset, so we subset because we only need two days
useful.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# call str to have a sense of how the data looks -- looks great
str(useful.data)

# build plot 3
datetime <- strptime(paste(useful.data$Date, useful.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") # don't really understand this function
globalactivepower <- as.numeric(useful.data$Global_active_power) # the first time I did it it said "x must be numeric". After that, I made it numeric
submetering1 <- as.numeric(useful.data$Sub_metering_1)
submetering2 <- as.numeric(useful.data$Sub_metering_2)
submetering3 <- as.numeric(useful.data$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(datetime, submetering1, type = "l", ylab="Energy sub metering", xlab="")
lines(datetime, submetering2, col = "red")
lines(datetime, submetering3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"))

# don't forget to turn off the graphics device!
dev.off()