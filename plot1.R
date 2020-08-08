library("ggplot2")
library("dplyr")

# read in the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate sums the emissions by year
total_pm25 <- aggregate(Emissions ~ year, data = NEI, sum)

png('plot1.png')
with(total_pm25, plot(year, Emissions, type = "b", xlab = "Year", ylab = "Total Emissions", main = "PM2.5 Emissions by Year"))
dev.off()

