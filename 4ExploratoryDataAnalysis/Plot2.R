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

#Plot 2
plot(Data1$Global_active_power~Data1$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
	 
	 
#Saving data	 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
