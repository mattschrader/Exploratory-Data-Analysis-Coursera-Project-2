library("ggplot2")
library("dplyr")

# read in the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter leaves only data related to vehicles emissions, Baltimore, and Los Angeles
LA_baltimore_vehicle <- filter(NEI, type == "ON-ROAD",fips == "24510" | fips == "06037")

# aggregate sums the emissions by year and type for the Baltimore and Los Angeles data
total_vehicle_LA_bal <- aggregate(Emissions ~ year + fips, data = LA_baltimore_vehicle, sum)

png('plot6.png')
ggplot(total_vehicle_LA_bal, aes(year, Emissions, col = fips)) + 
        geom_point() + 
        geom_line() + 
        ggtitle("Motor Vehicle Emissions in Baltimore and Los Angeles") + 
        xlab("Total Emissions") + 
        ylab("Year")
dev.off()