library(tidyr)
library(dplyr)
library(lubridate)

datas <- read.table("household_power_consumption.txt", 
                    header=T, 
                    sep=";",
                    na.strings = "?",
                    colClasses = list('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
) %>% 
        tbl_df() %>% 
        filter( Date == "1/2/2007" | Date =="2/2/2007") 

datas$DT <- strptime(paste(datas$Date, datas$Time), format="%d/%m/%Y %H:%M:%S") 

png("plot4.png",width=480, height=480)

par(mfrow=c(2,2))
with(datas, {
        plot(DT, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(DT, Voltage, type="l", xlab="", ylab="Voltage")
        plot(DT, Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
        lines(DT, Sub_metering_2, col="red")
        lines(DT, Sub_metering_3, col="blue")
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
               col=c("black","red","blue"), lty=c(1,1,1), cex=0.8)
        plot(DT, Global_reactive_power, type="l", xlab="", ylab="Global reactive power")
})


dev.off()
