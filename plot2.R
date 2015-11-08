plot2<-function(){
	library(dplyr)
	data<-read.table("household_power_consumption.txt",sep=";",nrows=-1,col.names=c("Date","Time,","Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensit","Sub_Metering_1","Sub_Metering_2","Sub_metering_3"))
	
	
	data<-data[-1,]
	data$Date<-as.Date(data$Date,format="%d/%m/%Y")
	data<-filter(data,Date=="2007-02-01" | Date=="2007-02-02" )
	
	data$DateTime<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
	data$Global_Active_Power<-as.numeric(as.character(data$Global_Active_Power))
	
	png(filename="plot2.png")
	plot(data$DateTime,data$Global_Active_Power,type="l",xlab=" ", ylab="Global Active Power (kilowatts)",col="black")
	dev.off()
		
}