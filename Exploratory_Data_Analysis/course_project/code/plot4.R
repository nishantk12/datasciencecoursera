#read the data from the data source
pol <- readRDS("~/Documents/coursera/Data-science-spec/4/course-project/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
pol1 <- readRDS("~/Documents/coursera/Data-science-spec/4/course-project/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#create the coal_source 
coal_source <- pol1 %>% filter(grepl("Coal", EI.Sector))

#get vector of all the sources of coal
coal_scc <- coal_source$SCC

#get subset of pol with 
pol_col <- filter(pol, SCC %in% coal_scc)

#get as per year distribution of the pol coal
year_total_pol_coal <- aggregate(Emissions ~ year, pol_col, sum)

#plot the line over the year 
plot(year_total_pol_coal$year, year_total_pol_coal$Emissions,col="blue",type="l",xlab="Years", ylab="Emission from coal sources over the years")
points(year_total_pol_coal$year, year_total_pol_coal$Emissions, col="red", pch=20)
title(main="Total emission change over the years from coal sources")