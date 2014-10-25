## Project 2
#Set working directory
setwd("D:/Google/Coursera/4. Exploratory Data Analysis/project 3/exdata-data-NEI_data")
#import data
NEI <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")
#EXplore the different sectors
unique(SCCdata$EI.Sector)
#  Create Data
Coal <- grep("coal",SCCdata$EI.Sector,value=T,ignore.case=T)
SCC.Coal <- subset(SCCdata, EI.Sector %in% Coal,select=SCC)
NEI.Coal <- subset(NEI, NEI$SCC %in%  SCC.Coal$SCC)
coal <- aggregate(NEI.Coal[c("Emissions")], list(Year = NEI.Coal$year), sum)
names(coal)=c("Year","Emissions")
#  Create Plot
png('plot4.png', width=480, height=480)
plot4 <- ggplot(coal, aes(x=Year, y=Emissions)) +
  geom_point(alpha=.4) +
  geom_smooth(alpha=.2, size=1) +
  ggtitle("Total PM2.5 Coal Combustion Emissions in the US")
print(plot4)
dev.off()
#There is a decrease in the Total  PM2.5 Coal Combustion Emissions in the US from 1999 to 2008

