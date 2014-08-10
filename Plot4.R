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

Draw Plot 4 and export to PNG
par(mfrow=c(2,2))

windows()

#sub plot 1
plot(edata$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)",ylim=c(0,10),xaxt="n",xlab=" ")
axis(1, at=c(0,1500,2800),labels=c("Thu","Fri","Sat"), col.axis="black", las=1)

#subplot 2
plot(edata$Voltage,type="l",ylab="Voltage",xlab="datetime",ylim=c(232,248),xaxt="n")
axis(1, at=c(0,1500,2800),labels=c("Thu","Fri","Sat"), col.axis="black", las=1)

#subplot 3
plot(edata$Sub_metering_1,type="l",ylim=c(0,45),col="black",xaxt="n",ylab="Energy Sub meterring",xlab=" ")
lines(edata$Sub_metering_2,type="l",ylim=c(0,45),col="red")
lines(edata$Sub_metering_3,type="l",ylim=c(0,45),col="blue")
axis(1, at=c(0,1500,2800),labels=c("Thu","Fri","Sat"),col.axis="black",las=1)
legend("topleft",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(0.5,0.5,0.5),col=c("black","red","blue"),cex=0.6)

#subplot 4
plot(edata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",ylim=c(0.0,0.5),xaxt="n")
axis(1, at=c(0,1500,2800),labels=c("Thu","Fri","Sat"), col.axis="black", las=1)

dev.off()
