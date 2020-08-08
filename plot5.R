library("ggplot2")
library("dplyr")

# read in the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter leaves only data related to vehicles emissions and Baltimore
baltimore_vehicle <- filter(NEI, type == "ON-ROAD", fips == "24510")

png('plot5.png')
ggplot(baltimore_vehicle, aes(year, Emissions)) + 
        geom_bar(stat = "identity") + 
        ggtitle("Motor Vehicle Emissions in Baltimore from 1999-2008") +
        xlab("Year") +
        ylab("Total Emissions")
dev.off()