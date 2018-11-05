
# file download url
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "household_power_consumption.zip"

# check if the file exists - if then don't download it again
if (!file.exists(fileName))
  download.file(fileUrl, "./household_power_consumption.zip")
  unzip("household_power_consumption.zip")
  
  # read the data from file
  data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
  
  # assign the names to the column 
  names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                   "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
  
  # subset the data for the selected dates
  selectedDateData <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
  
  # Plot - 1
  png(filename = "plot1.png", width = 480, height = 480)
  hist(as.numeric(selectedDateData$Global_active_power), xlab="Global Active Power(kilowatts)",
       main="Global Active Power", col="red")
  dev.off()
