#(In case of any confusion, please just copy and paste the code in R, and execute it). 

#Required Package
library(plyr)
library(lattice)

# Read the source file into NEI
NEI <- readRDS(file.choose())

# Create a subset with Year,Emissions and fips columns
data1 <- subset(NEI, select = c(fips,Emissions,year))

# Create a subset with fips= 24510 (baltimore) 
data2 <-subset(data1,fips=="24510") 
data2$fips <-as.numeric(data2$fips)

# Summarize the data by year
data3 <- ddply(data2, .(year), function (x) sum(x$Emissions))
names(data3) <- c("Year","Emissions")

# Now, plot the graph between and year and Emissions for Baltimore City
# No file specified in questionaire, so nothing mentioned for width and height in png function. 

png("Baltimore : PM2.5 Emissions per Year")

plot(data3$Emissions~data3$Year,xlim=c(1998,2008),type ="l",xlab="Year",ylab="PM2.5 Emissions",main="Baltimore : PM2.5 Emissions per Year(1998 ~ 2008)")

dev.off()
