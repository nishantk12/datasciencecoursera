electric <- read.csv("~/Documents/coursera/Data-science-spec/4/week1/data/household_power_consumption.txt", sep=";")
active <- electric$Global_active_power
active <- as.numeric(as.character(active), na.rm = TRUE)
hist(active, xlab = "Global Active Power (Kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
