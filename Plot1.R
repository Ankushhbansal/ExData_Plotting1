#importing data
data_full <- read.csv(".../exdata-data-household_power_consumption/household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)


#plot1 
# create a device connection
png("plot1.png",width=480, height=480, units = "px",pointsize=12,bg="white",res= NA,restoreConsole= TRUE)
with(data, hist(Global_active_power,xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
                col='red', main = "Global Active Power"))

dev.off()
