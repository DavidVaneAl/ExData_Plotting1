library(dplyr)
library(data.table)
  
Archive_Zip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Archive_Zip, destfile = "data.zip")
unzip("data.zip")

Sys.setlocale("LC_TIME", "English") 
par(bg = NA) 

EPC <- read.table("household_power_consumption.txt",
                  skip = 1, sep = ";", na.strings = "?")
names(EPC) <- c("Date", "Time" ,"Global_active_power", "Global_reactive_power", "Voltage", 
                "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

EPC1 <- subset(EPC, Date %in% c("1/2/2007","2/2/2007"))
EPC1$Date <- as.Date(EPC1$Date, format="%d/%m/%Y")
datetime <- paste(EPC1$Date, EPC1$Time)
EPC1$Datetime <- as.POSIXct(datetime)

{
with(EPC1, 
     plot(Global_active_power ~ Datetime, type = "l", 
          ylab = "Global Active Power (kilowatts)", xlab = ""))
{
dev.copy (png,"plot2.png", bg = NA, width = 480, height = 480)
dev.off()
}
par(bg = "white")
}
