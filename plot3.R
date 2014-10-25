## Project 2
#Set working directory
setwd("D:/Google/Coursera/4. Exploratory Data Analysis/project 3/exdata-data-NEI_data")
#import data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Balt<-subset(NEI,fips == "24510")
emitsumBalttype<-aggregate(Balt$Emissions,by=list(type = Balt$type, year = Balt$year),sum)
names(emitsumBalttype)<-c("Type","Year","Emissions")
png("plot3.png")
plot3<- ggplot(emitsumBalttype,aes(x=Year, y=Emissions, colour=Type))+
        ggtitle("Total PM2.5 emission for Baltimore City, Maryland by type") +
        geom_point(alpha=.4) +
        geom_smooth(alpha=.2, size=1, method="loess") 
print(plot3)
dev.off()
#Type = Point have seen an increase in Emission
