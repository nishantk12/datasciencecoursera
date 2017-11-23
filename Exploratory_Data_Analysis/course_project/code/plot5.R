#read the data from the data source
pol <- readRDS("~/Documents/coursera/Data-science-spec/4/course-project/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")

pol_Baltimore <- subset(pol, fips=="24510")
#create the vehicle sources
pol_Baltimore_vehicles <- subset(pol_Baltimore, type=="ON-ROAD")


#get as per year distribution of the vehicle pollutants in Baltimore
year_total_pol_vehicle <- aggregate(Emissions ~ year, pol_Baltimore_vehicles, sum)

#plot the line over the year 
plot(year_total_pol_vehicle$year, year_total_pol_vehicle$Emissions,col="blue",type="l",xlab="Years", ylab="Emission from vehicles in Baltimore")
points(year_total_pol_vehicle$year, year_total_pol_vehicle$Emissions, col="red", pch=20)
title(main="Total emission change over the years from Vehicles in Baltimore sources")