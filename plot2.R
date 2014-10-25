## Project 2
#Set working directory
setwd("D:/Google/Coursera/4. Exploratory Data Analysis/project 3/exdata-data-NEI_data")
#import data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Balt<-subset(NEI,fips == "24510")
emitsumBalt<-aggregate(Balt$Emissions,by=list(Balt$year),sum)
names(emitsumBalt)<-c("Year","Emissions")
png("plot2.png")
plot(emitsumBalt,type='l',main="Total PM2.5 emission for Baltimore City")
dev.off()
#Total emissions from PM2.5 decreased in the Baltimore City have fallen.