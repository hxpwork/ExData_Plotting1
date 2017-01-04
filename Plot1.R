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
        filter( Date == "1/2/2007" | Date =="2/2/2007") %>%
        mutate( Date=dmy(Date), Time = hms(Time) )

png("plot1.png", width=480, height=480)

hist(datas$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")
dev.off()
