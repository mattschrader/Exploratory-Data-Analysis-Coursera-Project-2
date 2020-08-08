library("ggplot2")
library("dplyr")

# read in the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter leaves only data related to baltimore
baltimore_data <- filter(NEI, fips == "24510")

# aggregate sums the emissions by year and type for the Baltimore data
baltimore_year_type <- aggregate(Emissions ~ year + type, data = baltimore_data, sum)

png('plot3.png')
ggplot(baltimore_year_type, aes(year, Emissions, color = type)) + 
        geom_point() + 
        geom_line() +
        ggtitle("Baltimore PM2.5 Emissions by Type over Year") +
        xlab("Year") +
        ylab("Total Emissions")
dev.off()
