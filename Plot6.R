#  Exploratory Data Analysis - Course Project 2 

#-------------------------------------------------------------------------------------------------
# Title : Data Peer Assessment
# Topic : Explore the National Emissions Inventory database and see what it say about fine 
#         particulate matter pollution in the United states over the 10-year period 1999-2000
#--------------------------------------------------------------------------------------------------

# Load Data 

NEI <- readRDS("C:/Users/Mandeep/Desktop/My studies/Data Science/4-Exploratory Data Science/P-2/exdata_data_NEI_data(1)/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Mandeep/Desktop/My studies/Data Science/4-Exploratory Data Science/P-2/exdata_data_NEI_data(1)/Source_Classification_Code.rds")

#---------------------------------------------------------------------------------------------------
## Q.6. 
#---------------------------------------------------------------------------------------------------

### Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions? 

### Data Wrangling

### Subset data including "Mobile" and identify four type vehicles.


NEI_motorvehicle<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"]),]
tco <- c("24510","06037")
NEI_motorvehicle_both<-subset(NEI_motorvehicle,fips %in% tco)


### Calculate total emissions from PM2.5 between 1999 and 2008 in Baltimore and in Los Angeles.


g<-ggplot(NEI_motorvehicle_both,aes(year,Emissions,color=fips))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from motor vehicle for Los Angeles and Baltimore City",x="Year (1999 - 2008)")+scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))



### Ans: Los Angeles has higher PM25 emissions from motor vehicles compare to Baltimore.


