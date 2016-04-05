#' A Count Function to process SLIPT predictions
#'
#' Count number of predicted synthetic lethal gene partners with synthetic lethal conditions and significance thresholds met.
#' @param x Data matrix. Synthetic Lethal predictions to process, typically the output of \code{\link[slipt]{detect_SL}}
#' @param significance String. Significance condition for p-values to use: none, raw, or adjusted with a valid method for p.adjust() Defaults to fdr (false discovery rate / BH).
#' @param threshold Numeric. Significance threshold (alpha, type I error rate) to cut-off (raw or adjusted) p-values. Defaults to 0.05.
#' @keywords synthetic lethal, gene interaction, significance, post-processing, subset, slice
#' @export
#' @examples
#' count_of_SL()
#'
count_of_SL <-
function(x, significance = "fdr", threshold = 0.05){
  if(significance == "holm"){
    sum((x[,11]==2) & (as.numeric(x[,16])<threshold)) #SL interactions & Holm Sig
  } else if(significance == "fdr"){
    sum((x[,11]==2) & (as.numeric(x[,17])<threshold)) #SL interactions & FDR Sig
  } else if(significance == "raw"){
    sum((x[,11]==2) & (as.numeric(x[,15])<threshold)) #SL interactions & raw Sig
  } else if(significance == "none" | is.null(significance) | missing(significance) | is.na(significance)){
    sum(x[,11]==2) #SL interactions without signficance
  } else if(significance %in% p.adjust.methods){
    sum((x[,11]==2) & (p.adjust(as.numeric(x[,15]), method = significance)<threshold))#SL interactions & custom Sig adjust
  } else {
    warning("Please give a valid significance condition: none, raw, or a valid method for p.adjust()")
  }
}
