#' Prepare Dataset for SLIPT (Synthetic Lethal Predition)
#'
#' Prepare data (e.g., gene expression data) for synthetic lethal prediction (typically count or continous data) by bining samples into categorical data for each gene to be tested.
#' @param dataset Dataset input to be formatted. Input is genes (rows) x samples (columns). Output data is transposed: samples (rows) x genes (columns).
#' @param n number of quantiles to test. Must be an integer. Defaults to 3.
#' @param exclude Do you wish to exclude genes without quartile variation? Defaults to TRUE.
#' @keywords quantile, categorical, binning, synthetic lethal
#' @export
#' @examples
#' prep_data_for_SL()
#'
prep_data_for_SL <-
function(dataset, n = 3L, exclude = T){
  #define the number of bins required
  if(is.numeric(n) && !(is.integer(n))){
    n <- as.integer(round(n))
    warning("rounding n to nearest integer")
  }
  if(length(n)>1){
    n <- n[1]
    warning("n must be an integer, taking first value")
  }
  if(!(is.integer(n))){
    n <- 3
    warning("n must be an integer")
  }
  if(n < 1){
    n <- 3
    warning("n must be at least 2")
  }
  #bin samples into low/med/high categories for expression of each gene
  datasetx<-apply(dataset,1,function(y) ifelse(y<=quantile(as.numeric(y),1/n, na.rm=T),0,ifelse(y>quantile(as.numeric(y),(n-1)/n, na.rm=T),2,1)))
  rownames(datasetx) <- colnames(dataset)
  colnames(datasetx) <- rownames(dataset)
  if(exclude){
    #Exclude genes with Q1=Q2
    datasetx<-datasetx[,!(apply(dataset, 1, function(y) quantile(as.numeric(y),1/n, na.rm=T))==apply(dataset, 1, function(y) quantile(as.numeric(y),(n-1)/n, na.rm=T)))]
  }

}

