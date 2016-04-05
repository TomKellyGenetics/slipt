#' Prediction of Synthetic Lethality
#'
#' Statistical detection of expression signals consistent with synthetic lethal interaction. Based on the Chi-Square test with built-in multiple testing corrections.
#' @param query string. Name of a gene to test all others against. Note this gene must be contained within the dataset, matching a column name of datasetx.
#' @param datasetx Dataset input to be formatted. Input data is: samples (rows) x genes (columns) as formatted by \code{\link[slipt]{prep_data_for_SL}}. Output data is a table of genes (rows) x test statistics and outputs (columns), in order of most significantly supported candidate interacting parnter, this tabular format is human-readable is handled by \code{\link[slipt]{count_of_SL}} or \code{\link[slipt]{table_of_SL}} for built-in summary statistics.
#' @keywords chi-square, synthetic lethal, expression, genetics, genomics
#' @export
#' @examples
#' detect_SL()
#'
detect_SL <-
function(query, datasetx){
    if(query %in% colnames(datasetx)){
      query.datax<-datasetx[,match(query, colnames(datasetx))]

      a<-apply(datasetx,2, function(x) chisq.test(table(query.datax, x)))
      chi.pv<-lapply(aa, function(x) x$p.value)
      chi.df<-lapply(aa, function(x) x$parameter)
      chi.sq<-lapply(aa, function(x) x$statistic)
      ee<-lapply(aa, function(x) x$expected)
      oo<-lapply(aa, function(x) x$observed)
      synlethTS<-lapply(aa, function(x) ifelse(x$observed[1,1]<x$expected[1,1] & x$observed[1,3]>x$expected[1,3] & x$observed[3,1]>x$expected[3,1],2,ifelse(x$observed[1,1]<x$expected[1,1] & x$observed[1,3]>x$expected[1,3],"Q",ifelse(x$observed[1,1]<x$expected[1,1] & x$observed[3,1]>x$expected[3,1],"C",0))))
      synlethONCO<-lapply(aa, function(x) ifelse(x$observed[3,3]>x$expected[3,3] & x$observed[1,3]<x$expected[1,3] & x$observed[3,1]<x$expected[3,1],2,ifelse(x$observed[3,3]>x$expected[3,3] & x$observed[3,1]<x$expected[3,1],"Q",ifelse(x$observed[3,3]>x$expected[3,3] & x$observed[1,3]<x$expected[1,3],"C",0))))
      #Format Data for Output in CSV
      kp<-cbind(names(chi.pv),
                rownames(Data_Matrix_BRCA_RNASeq_Voom)[match(names(chi.pv),rownames(Data_Matrix_BRCA_RNASeq_Voom))],
                unlist(lapply(oo,function(x) x[1,1])),
                unlist(lapply(ee,function(x) x[1,1])),
                unlist(lapply(oo,function(x) x[1,3])),
                unlist(lapply(ee,function(x) x[1,3])),
                unlist(lapply(oo,function(x) x[3,1])),
                unlist(lapply(ee,function(x) x[3,1])),
                unlist(lapply(oo,function(x) x[3,3])),
                unlist(lapply(ee,function(x) x[3,3])),
                unlist(synlethTS),
                unlist(synlethONCO),
                unlist(chi.sq),unlist(chi.df),
                signif(unlist(chi.pv), 5),
                signif(unlist(p.adjust(chi.pv)),5),
                signif(unlist(p.adjust(chi.pv, method="BH")),5)
      )[order(unlist(chi.pv)),]
      colnames(kp)<-c("Probe","Gene","ObsQLowCLow","ExpQLowCLow","ObsQLowCHigh","ExpQLowCHigh",
                      "ObsQHighCLow","ExpQHighCLow","ObsQHighCHigh","ExpQHighCHigh",
                      "TS_SynLethal","Onco_SynLethal","Chi-squared","df","rawPval","adjPval_holm", "adjPval_FDR")
      return(kp)
    }
    else return(list(head(rownames(dataset), n=nrow(dataset)), "Query gene not contained in the dataset. Please enter the gene symbol in UPPER CASE, examples are shown below. Please contact the curator, Tom Kelly, for more information: kelsi602@student.otago.ac.nz."))
  }
