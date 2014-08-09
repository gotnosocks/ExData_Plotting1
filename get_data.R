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
    
    data <- read.csv(file = "household_power_consumption.txt",
             header = TRUE,
             sep = ";",
             na.strings="?")
    
    DateTime <- strptime(paste(data$Date,data$Time, sep = " "),
                              format = "%d/%m/%Y %H:%M:%S")
    data <- cbind(DateTime, data)
    
    data <- data[,!(names(data) %in% c("Date","Time"))]
    
    data
    
    # subset to 1 and 2 Feb 2007
    
    
}

