#' An Export Function to process SLIPT predictions
#'
#' Exports the key synthetic lethal gene information in a LaTeX table. Can be done for all genes (output of \code{\link[slipt]{detect_SL}}) or with synthetic lethal conditions and significance thresholds met (output of \code{\link[slipt]{table_of_SL}}).
#' @param x Data matrix. Synthetic Lethal predictions to process, typically the output of \code{\link[slipt]{detect_SL}} or \code{\link[slipt]{table_of_SL}}.
#' @keywords synthetic lethal, gene interaction, significance, post-processing, subset, slice, LaTeX, tex, table
#' @import xtable
#' @importFrom utils head
#' @export
#' @examples
#' #prepare data
#'  data <- c()
#' for(i in 1:100){
#'   data <- cbind(data, rnorm(1000))
#' }
#' rm(i)
#' rownames(data) <- paste("gene", 1:1000)
#' colnames(data) <- paste("sample", 1:100)
#' partitioned_data <- prep_data_for_SL(data, n = 3)
#'
#' #run SLIPT
#' sl_table <- detect_SL("gene 1", partitioned_data)
#' dim(sl_table)
#' head(dim(sl_table))
#'
#' sl_table <- detect_SL("gene 1", prep_data_for_SL(data))
#' dim(sl_table)
#' head(dim(sl_table))
#'
#' #export top results to TeX
#' export_SL_latex(sl_table)
#'
export_SL_latex <-
function(x) print(xtable(head(x[, c(3, 4, 13, 15, 17)], 25), display=c("s", "d", "g", "g", "g", "g")), type="latex", file=paste0(deparse(substitute(x)), ".tex"))
