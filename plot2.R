plot2 <- function() {
  
  #Read data and then filter for relevant dates
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  filtered_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Create plot for plot2
  date_time <- strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  power <- as.numeric(filtered_data$Global_active_power)
  png("plot2.png", width=480, height=480)
  plot(date_time, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
  
}