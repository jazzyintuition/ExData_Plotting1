## Creating Plot 2
### I saw a discussion about whether or not the code should be a function and there didn't seem to
### be a conclusive answer. Because lectures did not include making all of this into
### a function, the code below can be highlighted and then run by clicking on the "Run" button
### in RStudio. 

data <- fread("household_power_consumption.txt", colClasses = "character") ### reading data into R
data[data == "?"] <- NA                         ### cleaning up data in 2 steps to subset
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- subset(data, Date == as.Date("2007-02-01"))  ## subsetting data and formatting smaller dataset
data3 <- subset(data, Date == as.Date("2007-02-02"))
feb12data <- rbind(data2, data3)
DateTime <- paste(feb12data$Date, feb12data$Time)
datetime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")
feb12data <- cbind(feb12data, as.data.frame(datetime))
png(filename = "ExData_Plotting1/plot2.png", width = 480, height = 480) ### creating plot2
plot(feb12data$datetime, feb12data$Global_active_power, xlab = "", ylab = paste("Global Active Power (kilowatts)"), type = "n")
lines(feb12data$datetime, feb12data$Global_active_power)
dev.off()