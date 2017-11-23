#read the data from the data source
#pol <- readRDS("~/Documents/coursera/Data-science-spec/4/course-project/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")

pol_Baltimore_la <- subset(pol, fips=="24510" | fips == "06037") 
#create the vehicle sources
pol_Baltimore_la_vehicles <- subset(pol_Baltimore_la, type=="ON-ROAD")

#creating aggregate matrix with type and year as criteria
pol_Baltimore_agg <- aggregate(pol_Baltimore_la_vehicles$Emissions, by=list(year=pol_Baltimore_la_vehicles$year, fips=pol_Baltimore_la_vehicles$fips ), FUN=sum)

#plotting as per the fips numbers
f<- ggplot(pol_Baltimore_agg, aes(y=x, x=year))
f + geom_line(aes(col=fips)) + geom_point(aes(col=fips)) + xlab("Years") + ylab("Vehicle Emissions") + ggtitle("Comparison of Vehicle emissions in \n Baltimore and Los Angeles")


