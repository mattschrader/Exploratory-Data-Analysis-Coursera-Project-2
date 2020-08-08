library("ggplot2")
library("dplyr")

# read in the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter leaves only data related to Baltimore
baltimore_data <- filter(NEI, fips == "24510")

# aggregate sums the emissions by year for the baltimore data
baltimore_yearly <- aggregate(Emissions ~ year, data = baltimore_data, sum)

png('plot2.png')
with(baltimore_yearly, plot(year, Emissions, type = "o", xlab = "Year", ylab = "Total Emissions", main = "Baltimore PM2.5 Emissions by Year"))
dev.off()
