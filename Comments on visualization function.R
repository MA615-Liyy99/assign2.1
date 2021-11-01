# Clare's comment:
# One funtion of plot is enough, the inputs can be data and countryname 
# which means you can make different graphs using one plot function and 
# just needs to change the inputs 


# 1. You can set the name of visualization function as plot
# 2. set 'dataset' and 'countryname' as inputs
# 3. Other codes are great!
# 4. a little change in ggtitle


plot<- function(dataset,countryname){       
  dataset<-filter(dataset,dataset$country==countryname)   
  dataset$year<-gsub(".x","",dataset$year)
  dataset$year<-gsub(".y","",dataset$year)    
  n<-as.numeric(nrow(dataset))   
  dataset1<-dataset[1:(n/2),]    
  dataset2<-dataset[(n/2+1):n,]  
  p<-ggplot(data=dataset,aes(x=year,y=employment_rate))+   
    geom_point(data=dataset1,aes(x=year,y=employment_rate),pch=1,size=1)+  
    geom_line(data=dataset1,group=1,col="blue")+  
    geom_point(data=dataset2,aes(x=year,y=employment_rate))+ 
    geom_line(data=dataset2,group=1,col="green",pch=16,size=1)+
    scale_x_discrete(breaks=seq(1990,2021,5))+   
    ggtitle(paste("Employment of", countryname)) +   # a little change here!!
    theme(plot.title = element_text(hjust = 0.5))
  p
  return(p)
}

plot(tidy, "Japan") # Look, you can just put table and the country you want to plot
