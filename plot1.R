library("data.table")

# Reading the data
data <- data.table::fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subsetting the data
data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

# Generating Plot 1
hist(data1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

png("plot1.png", width = 480, height = 480)
dev.off()
