library("data.table")

# Reading the data
data <- data.table::fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting the data
data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# Generating Plot 2 
with(data1, {
    plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
})
        
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
