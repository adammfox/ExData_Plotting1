plot3<-function(){
	library(dplyr)
	data<-read.table("household_power_consumption.txt",sep=";",nrows=-1,col.names=c("Date","Time,","Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensit","Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
	
	
	data<-data[-1,]
	data$Date<-as.Date(data$Date,format="%d/%m/%Y")
	data<-filter(data,Date=="2007-02-01" | Date=="2007-02-02" )
	
	data$DateTime<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
	data$Sub_Metering_1<-as.numeric(as.character(data$Sub_Metering_1))
	data$Sub_Metering_2<-as.numeric(as.character(data$Sub_Metering_2))
	data$Sub_Metering_3<-as.numeric(as.character(data$Sub_Metering_3))
	
	png(filename="plot3.png")
	plot(data$DateTime,data$Sub_Metering_1,type="l",xlab=" ", ylab="Energy sub metering",col="black")
	lines(data$DateTime,data$Sub_Metering_2,type="l",col="red")
	lines(data$DateTime,data$Sub_Metering_3,type="l",col="blue")
	legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	dev.off()
		
}