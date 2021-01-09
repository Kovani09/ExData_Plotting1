library("data.table")

# Reading the data
data <- data.table::fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting the data
data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# Generating Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data1, {
    plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power", xlab = "")
    plot(Voltage~Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2~Datetime, col = 'Red')
    lines(Sub_metering_3~Datetime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n", cex = .5,
            legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetitme")
})

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
