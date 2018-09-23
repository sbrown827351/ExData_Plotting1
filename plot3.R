plot3<- function() {
  
  #Read data and then filter for relevant dates
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  filtered_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Create plot for plot3
  date_time <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  power <- as.numeric(filtered_data$Global_active_power)
  
  sub1 <- as.numeric(filtered_data$Sub_metering_1)
  sub2 <- as.numeric(filtered_data$Sub_metering_2)
  sub3 <- as.numeric(filtered_data$Sub_metering_3)
  
  png("plot3.png", width=480, height=480)
  
  plot(date_time, sub1, type="l", ylab="Energy sub metering", xlab="")
  lines(date_time, sub2, type="l", col="red")
  lines(date_time, sub3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  
  dev.off()
  
}