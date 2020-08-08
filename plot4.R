library("ggplot2")
library("dplyr")

# read in the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filters out everything not related to coal and combustion
SCC_coal <- SCC %>%
        filter(grepl("Coal", SCC.Level.Three)) %>%
        filter(grepl("Combustion", SCC.Level.One)) %>%
        select(SCC, SCC.Level.One, SCC.Level.Three)

# combines all rows in NEI and SCC_coal by the SCC column
NEI_coal <- inner_join(NEI, SCC_coal, by = "SCC")

png('plot4.png')
ggplot(NEI_coal, aes(year, Emissions)) + 
        geom_bar(stat = "identity") +
        ggtitle("Coal Combustion-related Emissions from 1999-2008") +
        xlab("Year") +
        ylab("Total Emissions")
dev.off()