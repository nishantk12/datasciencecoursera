library(lubridate)
library("dplyr")
electic <- read.csv("~/Documents/coursera/Data-science-spec/4/week1/data/household_power_consumption.txt", sep=";")
electric_req <- electic %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
electric_req$Sub_metering_1 <- as.numeric(as.character(electric_req$Sub_metering_1))
electric_req$Sub_metering_2 <- as.numeric(as.character(electric_req$Sub_metering_2))
electric_req$Sub_metering_3 <- as.numeric(as.character(electric_req$Sub_metering_3))
mid_index <- dim(electric_req)[1]/2L
at_seq <- c(as.double(electric_req$date_time[1]), as.double(electric_req$date_time[mid_index]), as.double(electric_req$date_time[dim(electric_req)[1]]))
plot.ts(electric_req$date_time, electric_req$Sub_metering_3, xy.lines = TRUE, type="n", ylim=range(c(electric_req$Sub_metering_1)), col="Blue", axes=FALSE, xlab="",ylab="Energy sub metering" )
par(new=TRUE)
plot.ts(electric_req$date_time, electric_req$Sub_metering_2, xy.lines = TRUE, type="n", ylim=range(c(electric_req$Sub_metering_1)), col="red", axes=FALSE, xlab="",ylab=""  )
par(new=TRUE)
plot.ts(electric_req$date_time, electric_req$Sub_metering_1, xy.lines = TRUE, type="n", ylim=range(c(electric_req$Sub_metering_1)), axes=FALSE, xlab="",ylab="")
box(lty="solid")
axis(1, at=at_seq, labels=c("Thu", "Fri", "Sat"))
axis(2, at=seq(0,30,by=10), labels=seq(0,30,by=10))

leg <- legend("topleft", lty = 1,
              legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
              col = c("black","red","blue"),
              plot = FALSE)
leftx <- as.double(electric_req$date_time[dim(electric_req)[1]] + as.double(electric_req$date_time[1]))/2
rightx <- (leg$rect$left + leg$rect$w) * 2
topy <- leg$rect$top
bottomy <- (leg$rect$top - leg$rect$h)
legend(x = c(leftx, rightx), y = c(topy, bottomy), lty=c(1,1,1),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"))

