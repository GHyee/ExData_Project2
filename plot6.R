## Project 2
#Set working directory
setwd("D:/Google/Coursera/4. Exploratory Data Analysis/project 3/exdata-data-NEI_data")
#import data
NEI <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")
Balt<-subset(NEI,fips == "24510")
Cal<-subset(NEI,fips == "06037")
#  Create Data
veh <- grep("vehicle",SCCdata$EI.Sector,value=T,ignore.case=T)
SCC.veh <- subset(SCCdata, EI.Sector %in% veh,select=SCC)
Balt.veh <- subset(Balt, Balt$SCC %in%  SCC.veh$SCC)
Cal.veh <- subset(Cal, Cal$SCC %in%  SCC.veh$SCC)
Baltvehemit <- aggregate(Balt.veh[c("Emissions")], list(Year = Balt.veh$year), sum)
Calvehemit <- aggregate(Cal.veh[c("Emissions")], list(Year = Cal.veh$year), sum)
Baltvehemit <- cbind(Baltvehemit,rep("Baltimore City",length(Baltvehemit[,1])))
Calvehemit <- cbind(Calvehemit,rep("Los Angeles",length(Calvehemit[,1])))
names(Baltvehemit)=c("Year","Emissions","City")
names(Calvehemit)=c("Year","Emissions","City")
vehemit <- data.frame(rbind(Baltvehemit,Calvehemit))
vehemit$City <- as.factor(vehemit$City)
names(vehemit)=c("Year","Emissions","City")
#  Create Plot
png('plot6.png', width=480, height=480)
plot6 <- ggplot(vehemit, aes(x=Year, y=Emissions,colour=City)) +
  geom_point(alpha=.4) +
  geom_smooth(alpha=.2, size=1) +
  ggtitle("Emissions from Motor Vehicle Sources in the Baltimore & LA") 
print(plot6)
dev.off()
#There is greater change in Baltimore City.
