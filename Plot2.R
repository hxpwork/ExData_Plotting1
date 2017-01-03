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

png("plot2.png")

plot(datetimes, datas$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
