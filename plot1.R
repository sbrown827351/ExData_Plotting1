plot1 <- function() {
  
  #Read data and then filter for relevant dates
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  filtered_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Create histogram for plot1
  power <- as.numeric(filtered_data$Global_active_power)
  png("plot1.png", width=480, height=480)
  hist(power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  dev.off()
  
  
}