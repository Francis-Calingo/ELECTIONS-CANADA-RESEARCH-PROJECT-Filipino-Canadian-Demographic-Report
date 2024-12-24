#################################
## INSTALL NECESSARY PACKAGES  ##
#################################
install.packages("data.table")
install.packages("funModeling")
install.packages("Hmisc")
install.packages("ggplot2")
install.packages("maps")
install.packages("tmap")
install.packages("sf")
install.packages("dplyr")
install.packages("corrplot")
install.packages("CatEncoders")

library(data.table)
library(funModeling)
library(Hmisc)
library(ggplot2)
library(maps)
library(tmap)
library(sf)
library(dplyr)
library(corrplot)
library(CatEncoders)

###############################
## IMPORT AND EXPLORE DATA  ##
###############################

Data <- fread("C:/Users/LB0009/Downloads/Scraped Data From Statistics Canada.csv")
View(Data)

head(Data)
tail(Data)
nrow(Data)
ncol(Data)
df_status(Data)
#There are two na values. That will be dealt with later.

#Summary of Data
summary(Data)

#Distribution of Numerical Variables
plot_num(Data) #Graphical
profiling_num(Data) #Numerical

#Distribution of Categorical Variables
freq(Data)

#############################################
## PLOT DISTRIBUTION OF CERTAIN VARIABLES  ##
#############################################

###DISTRIBUTION OF NATIONAL FILIPINO POPULATION (2016 AND 2021)

hist(Data$`Number of Filipinos (2021 Census)`, xlab = 'Number of Filipinos', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Population by Electoral District (2021)'
     ,breaks = 100
     , col = 'blue'
     , border = "white")
hist(Data$`Number of Filipinos (2016 Census)`, xlab = 'Number of Filipinos', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Population by Electoral District (2016)'
     ,breaks = 100
     , col = 'blue'
     , border = "white")

###DISTRIBUTION OF NATIONAL FILIPINO POPULATION, PROVINCES (2021)

#First, the data will be grouped by provinces for ease of analysis.
NLData <- Data[Data$`Province/Territory`=="Newfoundland and Labrador",]
PEIData <- Data[Data$`Province/Territory`=="PEI",]
NovaScotiaData <- Data[Data$`Province/Territory`=="Nova Scotia",]
NewBrunswickData <- Data[Data$`Province/Territory`=="New Brunswick",]
QuebecData <- Data[Data$`Province/Territory`=="Quebec",]
OntarioData <- Data[Data$`Province/Territory`=="Ontario",]
ManitobaData <- Data[Data$`Province/Territory`=="Manitoba",]
SaskData <- Data[Data$`Province/Territory`=="Saskatchewan",]
AlbertaData <- Data[Data$`Province/Territory`=="Alberta",]
BCData <- Data[Data$`Province/Territory`=="British Columbia",]


#Now histograms can be plotted

hist(Data$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)'
     , col = 'blue'
     , border = "white")


hist(NLData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-Newfoundland and Labrador'
     , col = 'blue'
     , border = "white")

hist(PEIData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-Prince Edward Island'
     , col = 'blue'
     , border = "white")

hist(NovaScotiaData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-Nova Scotia'
     , col = 'blue'
     , border = "white")

hist(NewBrunswickData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-New Brunswick'
     , col = 'blue'
     , border = "white")

hist(QuebecData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-Quebec'
     , col = 'blue'
     , breaks = 100
     , border = "white")

hist(OntarioData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-Ontario'
     , col = 'blue'
     , breaks = 100
     , border = "white")

hist(ManitobaData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-Manitoba'
     , col = 'blue'
     , border = "white")

hist(SaskData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-Saskatchewan'
     , col = 'blue'
     , border = "white")

hist(AlbertaData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-Alberta'
     , col = 'blue'
     , breaks = 50
     , border = "white")

hist(BCData$`% Filipinos`, xlab = '% of Population that is Filipino', 
     ylab = 'Number of Districts', main = 'Proportional Distribution of Filipino Population by Electoral District (2021)-British Columbia'
     , col = 'blue'
     , breaks = 50
     , border = "white")

###GROWTH RATE OF FILIPINO POPULATION PER DISTRICT, PROVINCES (2016-2021)

#Some districts may have had a Filipino population of o in 2016 but grew by 2021.
#Mathematically, there would be no growth rate, as shown by na values.

Data_na <- Data[!complete.cases(Data),]
View(Data_na)

#A district in New Brunswick, and another in Quebec exhibit  such behaviour.
#For the purpose of this specific analysis, both rows will be dropped.

Data_No_na <- Data[complete.cases(Data), ]
NewBrunswick_No_na <- NewBrunswickData[complete.cases(NewBrunswickData), ]
Quebec_No_na <- QuebecData[complete.cases(QuebecData), ]
df_status(Data_No_na)


#Completing the analysis


hist(Data_No_na$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)'
     , breaks = 100
     , col = 'blue'
     , border = "white")

hist(NLData$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-Newfoundland and Labrador'
     , col = 'blue'
     , border = "white")

hist(PEIData$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-Prince Edward Island'
     , col = 'blue'
     , border = "white")

hist(NovaScotiaData$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-Nova Scotia'
     , col = 'blue'
     , border = "white")

hist(NewBrunswick_No_na$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-New Brunswick'
     , col = 'blue'
     , border = "white")

hist(Quebec_No_na$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-Quebec'
     , col = 'blue'
     , breaks = 100
     , border = "white")

hist(OntarioData$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-Ontario'
     , col = 'blue'
     , breaks = 100
     , border = "white")

hist(ManitobaData$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-Manitoba'
     , col = 'blue'
     , border = "white")

hist(SaskData$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-Saskatchewan'
     , col = 'blue'
     , border = "white")

hist(AlbertaData$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-Alberta'
     , col = 'blue'
     , breaks = 50
     , border = "white")

hist(BCData$`Filipino Growth Rate % (2016-2021)`, xlab = '% Change from 2016', 
     ylab = 'Number of Districts', main = 'Distribution of Filipino Growth by Electoral District (2021)-British Columbia'
     , col = 'blue'
     , breaks = 50
     , border = "white")

###PROPORTION OF RECENT IMMIGRANTS (2016-2021) THAT WERE FROM THE PHILIPPINES

hist(Data$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)'
     , breaks = 100
     , col = 'blue'
     , border = "white")

hist(NLData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-Newfoundland and Labrador'
     , col = 'blue'
     , border = "white")

hist(PEIData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-Prince Edward Island'
     , col = 'blue'
     , border = "white")

hist(NovaScotiaData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-Nova Scotia'
     , col = 'blue'
     , border = "white")

hist(NewBrunswickData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-New Brunswick'
     , col = 'blue'
     , border = "white")

hist(QuebecData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-Quebec'
     , col = 'blue'
     , breaks = 100
     , border = "white")

hist(OntarioData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-Ontario'
     , col = 'blue'
     , breaks = 100
     , border = "white")

hist(ManitobaData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-Manitoba'
     , col = 'blue'
     , border = "white")

hist(SaskData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-Saskatchewan'
     , col = 'blue'
     , border = "white")

hist(AlbertaData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-Alberta'
     , col = 'blue'
     , breaks = 50
     , border = "white")

hist(BCData$`% of Recent Immigrants from PH (2016-2021)`, xlab = '% Recent Immigrants from the Philippines (2016-2021)', 
     ylab = 'Number of Districts', main = 'Distribution of Recent Filipino Immigrants by Electoral District (2021)-British Columbia'
     , col = 'blue'
     , breaks = 50
     , border = "white")

###########################
## CORRELATION ANALYSIS  ##
###########################

#Perform label encoding of Province/Territory, a categorical variable
#define original categorical labels
labs = LabelEncoder.fit(Data$`Province/Territory`)

#convert labels to numeric values
Data$`Province/Territory` = transform(labs, Data$`Province/Territory`)

#Extract socioeconomic variables for analysis
Data_for_CorrAnalysis <- Data[ , c("Province/Territory","% Filipinos"
                                   ,"% of Population with Knowledge of French","Median Age","Healthcare Workers (per 100,000)"
                                   ,"% of Recent Immigrants from PH (2016-2021)"
                                   , "Number of People with Bachelors Degree or Higher (per 100,000)")]
View(Data_for_CorrAnalysis)

M <- cor(Data_for_CorrAnalysis)
corrplot(M, method = 'number',sig.level = 0.05)

###########################
## GEOSPATIAL ANALYSIS  ##
###########################

#Download shapefile of elecotral boundaries (2013 representation order)
my_sf <- read_sf("C:/Users/LB0009/Downloads/lfed000b21a_e")

head(my_sf)

#Merge shapefile with csv file, joined through the names of the electoral districts
my_sf_merged <- my_sf %>%
  left_join(Data, by = c("FEDENAME" = "Electoral District (2013 Representation Order)"))

#Map % of Filipinos by Riding
my_sf_merged$FilipinoPercentClass <- 
  cut(my_sf_merged$`% Filipinos`, breaks =c(-Inf,1,2.5,5,10,20,50,Inf),
      labels=c('>0% but <1%%', '1-2.5%', '2.5-5%','5-10%', '10-20%', '20-50%', '>50%'))
Map1 <- ggplot(my_sf_merged) +
  geom_sf(aes(fill = FilipinoPercentClass), color='gray',data=my_sf_merged) +
  geom_sf(fill='transparent', color='white', data=my_sf_merged) +
  scale_fill_brewer(name='% Filipinos') +
  labs(title='Proportion of Filipinos by Riding',
       caption=c('Source: Statistics Canada')) +
  theme_gray() +
  theme(title=element_text(face='bold'), legend.position='bottom')
Map1


#Map % of Recent Immigrants (2016-2021) Coming from the Philippines
my_sf_merged$RecentImmClass <- 
  cut(my_sf_merged$`% of Recent Immigrants from PH (2016-2021)`, breaks=c(0,5,10,20,50,Inf),
      labels=c('<5%', '5-10%', '10-20%', '20-50%', '>50%'))
Map2 <- ggplot(my_sf_merged) +
  geom_sf(aes(fill = RecentImmClass), color='gray',data=my_sf_merged) +
  geom_sf(fill='transparent', color='white', data=my_sf_merged) +
  scale_fill_brewer(name='% Recent Immigrants from PH') +
  labs(title='Proportion of Recent Immigrants (2016-2021) That Come from The Philippines',
       caption=c('Source: Statistics Canada')) +
  theme_gray() +
  theme(title=element_text(face='bold'), legend.position='bottom')
Map2


#Map Filipino Growth Rate (2016-2021)
my_sf_merged$GrowthRateClass <- 
  cut(my_sf_merged$`Filipino Growth Rate % (2016-2021)`, breaks=c(-200,0,10,25,50,100,200,500,Inf),
      labels=c('<0%', '0-10%', '10-25%', '25-50%','50-100%','100-200','200-500%' ,'>500%'))
Map3 <- ggplot(my_sf_merged) +
  geom_sf(aes(fill = GrowthRateClass), color='transparent',data=my_sf_merged) +
  geom_sf(fill='transparent', color='white', data=my_sf_merged) +
  scale_fill_brewer(name='% Change, 2016-2021') +
  labs(title='Growth rate of Filipino population (2016-2021)',
       caption=c('Source: Statistics Canada')) +
  theme_gray() +
  theme(title=element_text(face='bold'), legend.position='bottom')
Map3
  


#Map Secondary Philippine Language Usage
my_sf_merged$SecondLangClass <- my_sf_merged$`Second Most Spoken Philippine Language`

Map4 <- ggplot(my_sf_merged) +
  geom_sf(aes(fill = SecondLangClass), color='transparent',data=my_sf_merged) +
  geom_sf(fill='transparent', color='white', data=my_sf_merged) +
  scale_fill_viridis_d(name='Secondary Language') +
  scale_fill_discrete() +
  scale_colour_grey() +
  labs(title='Usage of Secondary Filipino Languages',
       caption=c('Source: Statistics Canada')) +
  theme_void() +
  theme(title=element_text(face='bold'), legend.position='bottom')
Map4



