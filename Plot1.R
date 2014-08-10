# Read the data from source file
p <- read.table(file.choose(),header=T,sep=";")

# do the variable conversion as needed
d1$Global_active_power <- as.numeric(as.character(p$Global_active_power))
d1$Global_active_power <- as.numeric(as.character(p$Global_active_power))
d1$Sub_metering_1 <- as.numeric(as.character(p$Sub_metering_1))
d1$Sub_metering_2 <- as.numeric(as.character(p$Sub_metering_2))
d1$Voltage <- as.numeric(as.character(p$Voltage))

#Subset the data for required dates
part1 <- subset(d1,d1$Date=="2007-02-01")
part2 <- subset(d1,d1$Date=="2007-02-02")

#Join the data into one data frame "edata", use this as source for all plots
edata <- rbind(part1,part2)

# Draw Plot 1 and save it as png 

## saving the plot
png(file = "Plot 1.png", height =480,width=480)

##Drawing plot 1
hist(edata$Global_active_power,ylim=c(0,1400),col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)")

dev.off()
