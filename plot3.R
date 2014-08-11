# Exploratory Data Analysis Project 1

# Exploratory Data Analysis Project 1

GetData <- function() {
    # Download and extract the data file, then convert the Date and Time columns
    # into a single DateTime column and remove the old Date and Time columns,
    # then extract data from 2007-02-01 and 2007-02-02
    if(!file.exists("household_power_consumption.txt")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      "household_power_consumption.zip",
                      "curl")
        unzip(zipfile = "household_power_consumption.zip")
    }
    
    column.names <- read.csv(file = "household_power_consumption.txt",
                             nrows = 1,
                             sep = ";",
                             header = FALSE
    )
    column.names <- c(t(column.names))
    
    data <- read.csv(file = "household_power_consumption.txt", 
                     na.strings="?",
                     skip = 66636,
                     nrows = 2880,
                     sep = ";",
                     col.names = column.names
    )
    
    DateTime <- strptime(paste(data$Date,data$Time, sep = " "),
                         format = "%d/%m/%Y %H:%M:%S")
    data <- cbind(DateTime, data)
    
    data <- data[,!(names(data) %in% c("Date","Time"))]
    
    data    
    
}

plot3 <- function() {
    data <- GetData()
    
    png(filename = "plot3.png",
        width = 480,
        height = 480)
    
    plot(data$DateTime,
         data$Sub_metering_1, 
         main = "",
         xlab = "",
         ylab = "Energy sub metering",
         type = "l",
         col = "black"
    )
    
    lines(data$DateTime, data$Sub_metering_2, col = "red")
    lines(data$DateTime, data$Sub_metering_3, col = "blue")
    
    legend("topright", 
           lty = c(1,1,1),
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
}