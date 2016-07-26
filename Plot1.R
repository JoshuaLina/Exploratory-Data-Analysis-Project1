## Exploratory Data Analysis


## FIGURE 1
      # reading data
        data <- file("household_power_consumption.txt")
      # data for only 2 days in February 2007
        Data_2007_Feb_0102 <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE),
                                       col.names = c("Date", "Time", "Global_active_power",
                                       "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                                        sep = ";", header = TRUE)


      # Selecting data for histogram fom the Global Active Power variable
        GAP<-Data_2007_Feb_0102$Global_active_power; # GAP = Global Active Power

      # creating a PNG figure with a width of 480 pixels and a height of 480 pixels
        png("FIGURE1.png", width = 480, height = 480)
        hist(GAP, col = "Red", xlab = "  Global active power (Kilowatts)", ylab = "Frequency",
        main="Global Active power for 2007-02-01 to 2007-02-02")
      # close the PNG device
        dev.off(); 

