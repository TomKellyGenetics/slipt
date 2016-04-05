prep_data_for_SL <-
function(dataset, exclude = T){
  #bin samples into low/med/high categories for expression of each gene
  datasetx<-apply(dataset,1,function(y) ifelse(y<=quantile(as.numeric(y),1/3, na.rm=T),0,ifelse(y>quantile(as.numeric(y),2/3, na.rm=T),2,1)))
  if(exclude){
    #Exclude genes with Q1=Q2
    datasetx<-datasetx[,!(apply(dataset, 1, function(y) quantile(as.numeric(y),1/3, na.rm=T))==apply(dataset, 1, function(y) quantile(as.numeric(y),2/3, na.rm=T)))]
  }
}
