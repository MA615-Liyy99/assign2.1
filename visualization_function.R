plot2<- function(data,Canada){        #Set the function
  data<-data
  countryname<-"Canada"              #Select Canada to plot
  dataset<-filter(data,data$country==countryname)   #Select Canada from dataset
  dataset$year<-gsub(".x","",dataset$year)
  dataset$year<-gsub(".y","",dataset$year)     #Change the value of "year" column to numberic
  n<-as.numeric(nrow(dataset))   #Get the row number of dataset
  dataset1<-dataset[1:(n/2),]    #From row 1 to row n/2 is the data of males
  dataset2<-dataset[(n/2+1):n,]  #From row n/2+1 to row n is the data of females
  p<-ggplot(data=dataset,aes(x=year,y=employment_rate))+   #The x axis is year and the y axis is employment rate
    geom_point(data=dataset1,aes(x=year,y=employment_rate),pch=1,size=1)+  #Add points of males to the plot
    geom_line(data=dataset1,group=1,col="blue")+  #Add line of males to the plot and color is blue
    geom_point(data=dataset2,aes(x=year,y=employment_rate))+ #Add points of females to the plot
    geom_line(data=dataset2,group=1,col="green",pch=16,size=1)+ #Add line of females to the plot and color is green
    scale_x_discrete(breaks=seq(1990,2021,5))+    #Adjust the x coordinate spacing
    ggtitle("Employment of Canada") +   #Add title
    theme(plot.title = element_text(hjust = 0.5))
  p
  return(p)
}

#plot3() is almost same as plot2(), the only difference is the selected country is Japan rather Canada
plot3<- function(data,Japan){
  data<-data
  countryname<-"Japan"
  dataset<-filter(data,data$country==countryname)
  dataset$year<-gsub(".x","",dataset$year)
  dataset$year<-gsub(".y","",dataset$year)
  n<-as.numeric(nrow(dataset))
  dataset1<-dataset[1:(n/2),]
  dataset2<-dataset[(n/2+1):n,]
  p<-ggplot(data=dataset,aes(x=year,y=employment_rate))+
    geom_point(data=dataset1,aes(x=year,y=employment_rate),pch=1,size=1)+
    geom_line(data=dataset1,group=1,col="blue")+  #male
    geom_point(data=dataset2,aes(x=year,y=employment_rate))+
    geom_line(data=dataset2,group=1,col="green",pch=16,size=1)+ #female
    scale_x_discrete(breaks=seq(1990,2021,5))+
    ggtitle("Employment of Japan") +
    theme(plot.title = element_text(hjust = 0.5))
  p
  return(p)
}