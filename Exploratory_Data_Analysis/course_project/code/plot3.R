#read the data from the data source
pol <- readRDS("~/Documents/coursera/Data-science-spec/4/course-project/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")

#making a subset of data frame to get Baltimore entries
pol_Baltimore <- subset(pol, fips=="24510")

#creating aggregate matrix with type and year as criteria
pol_Baltimore_agg <- aggregate(pol_Baltimore$Emissions, by=list(year=pol_Baltimore$year, type=pol_Baltimore$type ), FUN=sum)

#creating base of plot
f<- ggplot(pol_Baltimore_agg, aes(y=x, x=year))

#plotting the lines + points
f + geom_line(aes(col=type)) + geom_point(aes(col=type)) + ylab("Emissions") + ggtitle("Emission from different types of sources in Baltimore County")