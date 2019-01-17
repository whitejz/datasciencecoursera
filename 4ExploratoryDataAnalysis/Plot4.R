#Reading Full Data as csv from txt
Data<-read.csv("household_power_consumption.txt", sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dim(Data)
Data$Date<-as.Date(Data$Date, format="%d/%m/%Y")

#Subset
Data1<- subset(Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Data)

#Converting dates
datetime <- paste(as.Date(Data1$Date), Data1$Time)
Data1$Datetime <- as.POSIXct(datetime)

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Data1, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

#Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
