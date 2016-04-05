#' A Subsetting Function to process SLIPT predictions
#'
#' Extract the predictions synthetic lethal gene partners with synthetic lethal conditions and significance thresholds met.
#' @param x Data matrix. Synthetic Lethal predictions to process, typically the output of \code{\link[slipt]{detect_SL}}
#' @param significance String. Significance condition for p-values to use: none, raw, or adjusted with a valid method for p.adjust() Defaults to fdr (false discovery rate / BH).
#' @param threshold Numeric. Significance threshold (alpha, type I error rate) to cut-off (raw or adjusted) p-values. Defaults to 0.05.
#' @param syn_lethal String. Stringency of synthetic lethal directional condition. Defaults to 'strong': symmetric replications. Other options are 'query' or 'candidate' or one-directional conditions (which gene is low in a low-high condition) or 'weak' for either one-directional condition.
#' @keywords synthetic lethal, gene interaction, significance, post-processing, subset, slice
#' @export
#' @examples
#' table_of_SL()
#'
table_of_SL <-
function(x, significance = "fdr", threshold = 0.05, syn_lethal = "strong"){
  if(syn_lethal == "strong") syn_lethal_condition <- 2
  if(syn_lethal == "weak") syn_lethal_condition <- c("C", "Q", 2)
  if(syn_lethal == "query") syn_lethal_condition <- c("Q", 2)
  if(syn_lethal == "candidate") syn_lethal_condition <- c("C", 2)
  if(significance == "holm"){
    x[(x[,11] %in% syn_lethal_condition & as.numeric(x[,16])<threshold), ] #SL interactions & Holm Sig
  } else if(significance == "fdr"){
    x[(x[,11] %in% syn_lethal_condition & as.numeric(x[,17])<threshold), ] #SL interactions & FDR Sig
  } else if(significance == "raw"){
    x[(x[,11] %in% syn_lethal_condition & as.numeric(x[,15])<threshold), ] #SL interactions & raw Sig
  } else if(significance == "none" | is.null(significance) | missing(significance) | is.na(significance)){
    x[x[,11] %in% syn_lethal_condition, ] #SL interactions without signficance
  } else if(significance %in% p.adjust.methods){
    x[(x[,11] %in% syn_lethal_condition & p.adjust(as.numeric(x[,15]), method = significance)<threshold), ] #SL interactions & custom Sig adjust
  } else {
    warning("Please give a valid significance condition: none, raw, or a valid method for p.adjust()")
  }
}
