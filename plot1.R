# Exploratory Data Analysis Project 1

DownloadData <- function() {
    # Download and extract the data file
    if(!file.exists("household_power_consumption.txt")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      "household_power_consumption.zip",
                      "curl")
        unzip(zipfile = "houehold_power_consumption.zip")
    }
}


