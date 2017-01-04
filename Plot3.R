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

datetimes <- strptime(paste(datas$Date, datas$Time), format="%d/%m/%Y %H:%M:%S") 

png("plot3.png",width=480, height=480)

plot(datetimes, datas$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(datetimes, datas$Sub_metering_2, col="red")
lines(datetimes, datas$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=c(1,1,1), cex=0.8)

dev.off()
