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
## Q.1. 
#---------------------------------------------------------------------------------------------------

### To find if total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008. 

### Data Wrangling

## To calculate the number of emissions for each of the years 1999, 2002, 2005, and 2008.

totalemission=matrix(nrow=4,ncol=2)
totalemission[,1]=levels(as.factor(NEI$year))
for (i in seq_along(levels(as.factor(NEI$year)))){
  totalemission[i,2]=sum(NEI[which(NEI$year==levels(as.factor(NEI$year))[i]),4])
}

### Plot the result

totalemission<- data.frame(totalemission,stringsAsFactors = F)
names(totalemission)<- c("year","emission")
totalemission$emission<- as.numeric(totalemission$emission)
with(totalemission,plot(year,emission,type="l"))

###Ans: The total pm25 emission in United States has dramatically decreased?