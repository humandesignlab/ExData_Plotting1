df <- read.table("../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows= 1000000, stringsAsFactors=FALSE)
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
dateRange <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
df <- subset(df, Date %in% dateRange)
head(df)

par(mfrow=c(2,2))

# plot 1
plot(df$Time, df$Global_active_power, type = "l", ylab="Global Active Power", xlab="")

# plot 2
plot(df$Time, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3
plot(df$Time, df$Sub_metering_1, type = "l", col = "black", ylab="Energy sub metering", xlab = "")
lines(df$Time, df$Sub_metering_2, type = "l", col = "red")
lines(df$Time, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, box.lwd=0)

# plot 4
plot(df$Time, df$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(df$Time, df$Global_reactive_power)


dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()