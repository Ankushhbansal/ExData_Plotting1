#importing data
data_full <- read.csv(".../exdata-data-household_power_consumption/household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)
png("plot3.png",width=480, height=480, units = "px",pointsize=12,bg="white",res= NA,restoreConsole= TRUE)

with(data,{ plot(Sub_metering_1~Datetime, type = "l", 
                 ylab = "Energy sub metering", xlab = "")
            lines(Sub_metering_2~Datetime, col='red')
            lines(Sub_metering_3~Datetime, col='blue')
            
            legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                   col = c("Black","Red","Blue"),lty=1) })

dev.off()