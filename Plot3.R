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

# Draw and save plot 3 as png

windows()

#draw the plot
plot(edata$Sub_metering_1,type="l",ylim=c(0,45),col="black",xaxt="n",xlab=" ",ylab="Energy Sub meterring")
lines(edata$Sub_metering_2,type="l",ylim=c(0,45),col="red")
lines(edata$Sub_metering_3,type="l",ylim=c(0,45),col="blue")
axis(1, at=c(0,1500,2800),labels=c("Thu","Fri","Sat"),col.axis="black",las=1)
legend("topleft",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(0.5,0.5,0.5),col=c("black","red","blue"),cex=0.6)

dev.off()
