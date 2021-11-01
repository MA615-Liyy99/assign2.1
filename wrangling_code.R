# Clare's comment:
# 1. download xlsx format and you will get a better format which won't include strange symbols




library(tidyverse)
#install.packages('tibble')
library(tibble)
library(dplyr)     #Import the required packages
# setwd("C:/Users/liyuyang/Desktop/BU/2021fall/615/assign2")    #Set the path of data

female<-as_tibble(read.csv("females_aged_15_24_employment_rate_percent.csv"))
male<- as_tibble(read.csv("males_aged_15_24_employment_rate_percent.csv"))    #Read data
colnames(male)[1]<-"country"
colnames(female)[1]<-"country"     #Change the name of first column
connect<- inner_join(male,female,by="country")   #Connect two data sets into one table
tidy<-connect %>% 
  pivot_longer(!country, names_to ="year", values_to ="employment_rate")
tidy$year<-gsub("X","",tidy$year)   #Change horizontal data to vertical data
                                    #and put the same country together
