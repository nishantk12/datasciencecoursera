#read the data from the data source
pol <- readRDS("~/Documents/coursera/Data-science-spec/4/course-project/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")

#get sum as per groups using year as group and save in a df
year_total_pol_df <- aggregate(Emissions ~ year, pol, sum)

#plot the line over the year 
plot(year_total_pol_df$year, year_total_pol_df$Emissions,col="blue",type="l",xlab="Years", ylab="Emission from all sources over the years")
points(year_total_pol_df$year, year_total_pol_df$Emissions, col="red", pch=20)
title(main="Total emission change over the years")