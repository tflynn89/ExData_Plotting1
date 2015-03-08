FileName<-"household_power_consumption.txt"


# Breakdown the file to the dates needed
Rehash <- read.delim(FileName, header = TRUE, sep = ';', na.strings="?")

Day1<-subset(Rehash,as.Date(Rehash[,1], format="%d/%m/%Y") == as.Date("1/2/2007", format = "%d/%m/%Y"))
Day2<-subset(Rehash,as.Date(Rehash[,1], format="%d/%m/%Y") == as.Date("2/2/2007", format = "%d/%m/%Y"))
#Making one data set for the files needed
Data <- rbind(Day1, Day2)

#Need Date + Time together for this
Data$Datetime <- strptime(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")


#Plot 3

# Open the Plot (Height and Width set to 480)
png(filename="plot3.png", width=480, height=480)

plot(Data$Datetime, Data$Sub_metering_1, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(Data$Datetime, Data$Sub_metering_2, type="l",col="red")
lines(Data$Datetime, Data$Sub_metering_3, type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red","blue"))

#Close the Plot
dev.off()
