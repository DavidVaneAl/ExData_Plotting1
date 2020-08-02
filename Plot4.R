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
{
par(mfrow = c(2, 2))
par(mar = c(4.1, 4.1, 3.1, 1.1))
}
{
    # Plot4.1
    {
    datetime <- paste(EPC1$Date, EPC1$Time)
    EPC1$Datetime <- as.POSIXct(datetime)
    with(EPC1, 
         plot(Global_active_power ~ Datetime, type = "l", 
              ylab = "Global Active Power", xlab = ""))
    }
    # Plot4.2
    {
    datetime <- paste(EPC1$Date, EPC1$Time)
    EPC1$Datetime <- as.POSIXct(datetime)
    with(EPC1, 
         plot(Voltage ~ Datetime, type = "l", 
              ylab = "Voltage", xlab = "datetime"))
    }
    # Plot4.3
    {
    datetime <- paste(EPC1$Date, EPC1$Time)
    EPC1$Datetime <- as.POSIXct(datetime)
    with(EPC1,
         plot(Sub_metering_1 ~ Datetime, type = "l",
              ylab = "Global Active Power", xlab = ""))
    lines(EPC1$Sub_metering_2 ~ EPC1$Datetime, col = "Red")
    lines(EPC1$Sub_metering_3 ~ EPC1$Datetime, col = "Blue")
    legend("topright", inset = 0.1, box.lty = 0, cex = 1, lty = 1, lwd = 3, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    }
    # Plot4.4
    {
    datetime <- paste(EPC1$Date, EPC1$Time)
    EPC1$Datetime <- as.POSIXct(datetime)
    with(EPC1, 
         plot(Global_reactive_power ~ Datetime, type = "l", 
              ylab = "Global_reactive_power", xlab = "datetime"))
    }
    {
    dev.copy (png,"plot4.png", bg = NA, width = 480, height = 480, res = 70)
    dev.off()
    }
    par(bg = "white")
    par(mfrow = c(1, 1))
}
