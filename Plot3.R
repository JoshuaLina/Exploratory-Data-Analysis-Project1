## Exploratory Data Analysis


## FIGURE 3
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

              # Generating Plot 3 with a width of 480 pixels and a height of 480 pixels
                           png("FIGURE3.png", width = 480, height = 480)
                           with(data, {
                                    plot(Sub_metering_1 ~ Datetime, type = "l", 
                                    ylab = "Global Active Power (kilowatts)", xlab = "")
                                    lines(Sub_metering_2 ~ Datetime, col = 'Red')
                                    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
                                     })

                        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
                               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   
              # close the PNG device
                dev.off(); 
