#Clean up before beginning
rm(list=ls())
#Load data
library(readr)
library(dplyr)
library(ggplot2)

#Add data files 
#all adults
all_adults_1920 <- read_csv("~/all_adults_1920.csv")
View(all_adults_1920)
#nests 2019-2020
nests_sheets_1920 <- read_csv("~/nests_sheets_1920.csv")
View(nests_sheets_1920)

#Make a new dataframe with the stuff you need (ring no., colour comb., tarsus length, clutch size, egg volume, etc.)
dfA<- data.frame(nests_sheets_1920$ring_number_male, nests_sheets_1920$colour_comb_male, nests_sheets_1920$`male plumage`, nests_sheets_1920$attempt, nests_sheets_1920$clutch_size, nests_sheets_1920$egg_vol, nests_sheets_1920$`right_tarsus_male_(mm)`)

#Check summary of this new dataframe dfA:
summary(dfA)
class(dfA$nests_sheets_1920..right_tarsus_male_.mm..)
View(dfA$nests_sheets_1920..right_tarsus_male_.mm..)

#Remove 'NA's from dfA$clutchSize and 'male tarsus length':
dfA<-dfA[!is.na(dfA$nests_sheets_1920.clutch_size),]
dfA<-dfA[!is.na(dfA$nests_sheets_1920..right_tarsus_male_.mm..),]

#Remove all 'N/A' from male tarsus:
dfA<- dfA[!grepl("N/A", dfA$nests_sheets_1920..right_tarsus_male_.mm..),]


#Use the function 'ggplot' to make a relation between male tarsus length and clutch size:
#first just making a scatterplot:
scatterplot1<- ggplot(dfA, aes(x=dfA$nests_sheets_1920.clutch_size, y= dfA$nests_sheets_1920..right_tarsus_male_.mm..)) + geom_point()
plot(scatterplot1)
