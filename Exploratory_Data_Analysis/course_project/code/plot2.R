#read the data from the data source
pol <- readRDS("~/Documents/coursera/Data-science-spec/4/course-project/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")

#making a subset of data frame to get Baltimore entries
pol_Baltimore <- subset(pol, fips=="24510")

#get sum as per groups using year as group and save in a df
year_total_pol_Baltimore <- aggregate(Emissions ~ year, pol_Baltimore, sum)

#plot the line over the year 
plot(year_total_pol_Baltimore$year, year_total_pol_Baltimore$Emissions,col="blue",type="l",xlab="Years", ylab="Emission from all sources over the years")
points(year_total_pol_Baltimore$year, year_total_pol_Baltimore$Emissions, col="red", pch=20)
title(main="Total emission change over the years in Baltimore")