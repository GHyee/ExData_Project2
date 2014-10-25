## Project 2
#Set working directory
setwd("D:/Google/Coursera/4. Exploratory Data Analysis/project 3/exdata-data-NEI_data")
#import data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
year<-NEI$year
emit<-NEI$Emissions
emitsum<-aggregate(NEI$Emissions,by=list(NEI$year),sum)
names(emitsum)<-c("Year","Emissions")
png("plot1.png")
plot(emitsum,type='l',main="Total PM2.5 emission")
dev.off()
#Total emissions from PM2.5 decreased in US have fallen.
