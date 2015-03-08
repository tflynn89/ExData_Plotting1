FileName<-"household_power_consumption.txt"


# Breakdown the file to the dates needed
Rehash <- read.delim(FileName, header = TRUE, sep = ';', na.strings="?")

Day1<-subset(Rehash,as.Date(Rehash[,1], format="%d/%m/%Y") == as.Date("1/2/2007", format = "%d/%m/%Y"))
Day2<-subset(Rehash,as.Date(Rehash[,1], format="%d/%m/%Y") == as.Date("2/2/2007", format = "%d/%m/%Y"))
#Making one data set for the files needed
Data <- rbind(Day1, Day2)

#Need Date + Time together for this
Data$Datetime <- strptime(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")


#Plot 2
# Open the Plot (Height and Width set to 480)
png(filename="plot2.png", width=480, height=480)

plot(Data$Datetime,Data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
#Close the Plot
dev.off()
