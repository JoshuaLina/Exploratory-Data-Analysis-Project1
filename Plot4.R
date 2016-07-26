## Exploratory Data Analysis

## FIGURE 4
           # Reading data
             PowerData <- read.csv("household_power_consumption.txt", 
                      header = TRUE, sep = ';', 
                      na.strings = "?",
                      nrows = 2075259, 
                      check.names = FALSE, 
                      stringsAsFactors = FALSE, 
                      comment.char = "", quote = '\"')
            PowerData$Date <- as.Date(PowerData$Date, format = "%d/%m/%Y")

          # Subsetting the data
            data <- subset(PowerData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
          # Removing object from memory 
            rm(PowerData)
          
          # Converting dates
            datetime <- paste(as.Date(data$Date), data$Time)
            data$Datetime <- as.POSIXct(datetime)

         # Generating Plot 4 with a width of 480 pixels and a height of 480 pixels
             png("FIGURE4.png", width = 480, height = 480)
         # four subplots
            par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
            with(data, {
                      plot(Global_active_power ~ Datetime, type = "l", 
                           ylab = "Global Active Power", xlab = "")
                      plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
                      plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
                           xlab = "")
                      lines(Sub_metering_2 ~ Datetime, col = 'Red')
                      lines(Sub_metering_3 ~ Datetime, col = 'Blue')
                      legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
                             bty = "n",
                             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                     plot(Global_reactive_power ~ Datetime, type = "l", 
                           ylab = "Global_rective_power", xlab = "datetime")
                    })

             
        # close the PNG device
          dev.off(); 
             