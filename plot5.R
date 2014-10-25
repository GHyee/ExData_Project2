## Project 2
#Set working directory
setwd("D:/Google/Coursera/4. Exploratory Data Analysis/project 3/exdata-data-NEI_data")
#import data
NEI <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")
Balt<-subset(NEI,fips == "24510")
#  Create Data
veh <- grep("vehicle",SCCdata$EI.Sector,value=T,ignore.case=T)
SCC.veh <- subset(SCCdata, EI.Sector %in% veh,select=SCC)
Balt.veh <- subset(Balt, Balt$SCC %in%  SCC.veh$SCC)
vehemit <- aggregate(Balt.veh[c("Emissions")], list(Year = Balt.veh$year), sum)
names(vehemit)=c("Year","Emissions")
#  Create Plot
png('plot5.png', width=480, height=480)
plot5 <- ggplot(vehemit, aes(x=Year, y=Emissions)) +
  geom_point(alpha=.4) +
  geom_smooth(alpha=.2, size=1) +
  ggtitle("Total Emissions from Motor Vehicle Sources in Baltimore")
print(plot5)
dev.off()
#There is a decrease in the Total Emissions from Motor Vehicle Sources in Baltimore from 1999 to 2008
