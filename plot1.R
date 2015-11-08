plot1<-function(){
	library(dplyr)
	data<-read.table("household_power_consumption.txt",sep=";",nrows=-1,col.names=c("Date","Time,","Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensit","Sub_Metering_1","Sub_Metering_2","Sub_metering_3"))
	
	
	data<-data[-1,]
	data$Date<-as.Date(data$Date,format="%d/%m/%Y")
	data<-filter(data,Date=="2007-02-01" | Date=="2007-02-02" )
	data$Global_Active_Power<-as.numeric(as.character(data$Global_Active_Power))
	
	png(filename="plot1.png")
	hist(data$Global_Active_Power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
	dev.off()
	
	
}