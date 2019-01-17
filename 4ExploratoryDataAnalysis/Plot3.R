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

#Plot 3
with(Data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
