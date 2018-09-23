plot4<- function() {
  
  #Read data and then filter for relevant dates
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  filtered_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Create plot for plot3
  date_time <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  power <- as.numeric(filtered_data$Global_active_power)
  reactive <- as.numeric(filtered_data$Global_reactive_power)
  voltage <- as.numeric(filtered_data$Voltage)
  
  sub1 <- as.numeric(filtered_data$Sub_metering_1)
  sub2 <- as.numeric(filtered_data$Sub_metering_2)
  sub3 <- as.numeric(filtered_data$Sub_metering_3)
  
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2)) 
  plot(date_time, power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(date_time, sub1, type="l", ylab="Energy sub metering", xlab="")
  lines(date_time, sub2, type="l", col="red")
  lines(date_time, sub3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")
  plot(date_time, reactive, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
  
}