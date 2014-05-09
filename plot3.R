## 1. Read the file, skip the first 66,637 
##    Take two days (1/2/2007 - 2/2/2007) worth of data --nrows 2880(2*24*60)    
    epcdata <- read.table("household_power_consumption.txt"
                          ,sep       = ";"
                          ,skip      = 66637
                          ,nrows     = 2880
                          ,col.names = colnames(read.table("household_power_consumption.txt"
                                                           ,nrow   = 1
                                                           ,header = TRUE
                                                           ,sep    =";")))

## 2. Create a Date_Time column of Date/Time class, a concatenation of Date and Time
    epcdata$Date_Time <- strptime(paste(epcdata$Date,epcdata$Time), "%d/%m/%Y %H:%M:%S")

## 3. Create a PNG file 480x480 where the plot be placed directly
    png("plot3.png", 480, 480)    
    
## 4. Construct the plot
## a. Submetering 1 series       
    plot(epcdata$Date_Time
         ,epcdata$Sub_metering_1
         ,type = "l"
         ,xlab = ""
         ,ylab = "Energy sub metering")

## b. Add a line for Submetering 2 
    lines(epcdata$Date_Time
          ,epcdata$Sub_metering_2
          ,col = "red")

## c. Add a line for Submetering 3
    lines(epcdata$Date_Time
          ,epcdata$Sub_metering_3
          ,col = "blue")

## d. Add a legend
    legend("topright"
           ,legend      = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
           ,col         = c("black", "red", "blue")
           ,lty         = 1)
    
## 5. Close the PNG device
    dev.off()
