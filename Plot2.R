## Exploratory Data Analysis


## FIGURE 2
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

      # Generating Plot 2 with a width of 480 pixels and a height of 480 pixels
        png("FIGURE1212.png", width = 480, height = 480)
        plot(data$Global_active_power ~ data$Datetime, type = "l",
        ylab = "Global Active Power (kilowatts)", xlab = "")
      # close the PNG device
        dev.off(); 


