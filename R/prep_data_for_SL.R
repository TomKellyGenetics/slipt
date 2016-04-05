#' Prepare Dataset for SLIPT (Synthetic Lethal Predition)
#'
#' Prepare data (e.g., gene expression data) for synthetic lethal prediction (typically count or continous data) by bining samples into categorical data for each gene to be tested.
#' @param dataset Dataset input to be formatted. Input is genes (rows) x samples (columns). Output data is transposed: samples (rows) x genes (columns).
#' @param exclude Do you wish to exclude genes without quartile variation? Defaults to TRUE.
#' @keywords quantile, categorical, binning, synthetic lethal
#' @export
#' @examples
#' prep_data_for_SL()
#'
prep_data_for_SL <-
function(dataset, exclude = T){
  #bin samples into low/med/high categories for expression of each gene
  datasetx<-apply(dataset,1,function(y) ifelse(y<=quantile(as.numeric(y),1/3, na.rm=T),0,ifelse(y>quantile(as.numeric(y),2/3, na.rm=T),2,1)))
  if(exclude){
    #Exclude genes with Q1=Q2
    datasetx<-datasetx[,!(apply(dataset, 1, function(y) quantile(as.numeric(y),1/3, na.rm=T))==apply(dataset, 1, function(y) quantile(as.numeric(y),2/3, na.rm=T)))]
  }
}
