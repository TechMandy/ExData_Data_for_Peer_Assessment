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
## Q.3. 
#---------------------------------------------------------------------------------------------------

### Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question. 

### Data Wrangling

## Calculate total emissions from PM2.5 in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008 with four types

library(ggplot2)
sub_emissions<- subset(NEI,fips="24510")


### Plot the result

g<-ggplot(sub_emissions,aes(year,Emissions,color=type))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions for Baltimore City ",x="Year (1999 - 2008)")


### Ans: The NONPOINT decreased the most. POINT and NON-ROAD are also decreased. ON-ROAD, seems no changes from 1999 to 2008