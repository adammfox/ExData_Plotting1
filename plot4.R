plot4<-function(){
	library(dplyr)
	data<-read.table("household_power_consumption.txt",sep=";",nrows=-1,col.names=c("Date","Time,","Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensit","Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
	
	
	data<-data[-1,]
	data$Date<-as.Date(data$Date,format="%d/%m/%Y")
	data<-filter(data,Date=="2007-02-01" | Date=="2007-02-02" )
	
	data$DateTime<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
	data$Sub_Metering_1<-as.numeric(as.character(data$Sub_Metering_1))
	data$Sub_Metering_2<-as.numeric(as.character(data$Sub_Metering_2))
	data$Sub_Metering_3<-as.numeric(as.character(data$Sub_Metering_3))
	data$Global_Active_Power<-as.numeric(as.character(data$Global_Active_Power))
	data$Voltage<-as.numeric(as.character(data$Voltage))
	data$Global_Reactive_Power<-as.numeric(as.character(data$Global_Reactive_Power))
	
	png(filename="plot4.png")
	par(mfrow=c(2,2))
	with(data, {
		plot(DateTime,Global_Active_Power,type="l",xlab=" ", ylab="Global Active Power (kilowatts)",col="black")
		plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage",col="black")
		plot(DateTime,Sub_Metering_1,type="l",xlab=" ", ylab="Energy sub metering",col="black")
		lines(DateTime,Sub_Metering_2,type="l",col="red")
		lines(DateTime,Sub_Metering_3,type="l",col="blue")
		legend("topright",pch="-",bty = "n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
		plot(DateTime,Global_Reactive_Power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power")
	})
	dev.off()
		
}