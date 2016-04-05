#' A Subsetting Function to process SLIPT predictions
#'
#' Extract the predictions synthetic lethal gene partners with synthetic lethal conditions and significance thresholds met.
#' @param x Synthetic Lethal predictions to process, typically the output of \code{\link[slipt]{detect_SL}}
#' @param significance Significance condition for p-values to use: none, raw, or adjusted with a valid method for p.adjust() Defaults to fdr (false discovery rate / BH).
#' @keywords synthetic lethal, gene interaction, significance, post-processing, subset, slice
#' @export
#' @examples
#' table_of_SL()
#'
table_of_SL <-
function(x, significance = "fdr"){
  if(significance == "holm"){
    x[(x[,7]=="1" & as.numeric(x[,9])<0.05), ] #SL interactions & Holm Sig
  } else if(significance == "fdr"){
    x[(x[,7]=="1" & as.numeric(x[,10])<0.05), ] #SL interactions & FDR Sig
  } else if(significance == "raw"){
    x[(x[,7]=="1" & as.numeric(x[,8])<0.05), ] #SL interactions & raw Sig
  } else if(significance == "none" | is.null(significance) | missing(significance) | is.na(significance)){
    x[x[,7]=="1", ] #SL interactions without signficance
  } else if(significance %in% p.adjust.methods){
    x[(x[,7]=="1" & p.adjust(as.numeric(x[,8]), method = significance)<0.05), ] #SL interactions & custom Sig adjust
  } else {
    warning("Please give a valid significance condition: none, raw, or a valid method for p.adjust()")
  }
}
