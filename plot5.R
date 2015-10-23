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
## Q.5. 
#---------------------------------------------------------------------------------------------------

### How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

### Data Wrangling

### after exam the SCC dataframe, 2 variables SCC.Level.Three and Short.Name can be used to subset the motor vehicle source from the SCC dataset. 

NEI_motorvehicle<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"] & NEI$fips=="24510"),]

### use "motor vehicle" get 2 rows of data, use "vehicle" get 667 rows of data, use "motor" get 88 rows of data. after exam subseted datas, use the motor as the paramter.
### Calculate total emissions from PM2.5 between 1999 and 2008 in Baltimore City.

g<-ggplot(NEI_motorvehicle,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from motor vehicle for Baltimore City",x="Year (1999 - 2008)")


### Ans: Baltimore's motor vehicle emi