#' An Export Function to process SLIPT predictions
#'
#' Exports the key synthetic lethal gene information in a LaTeX table. Can be done for all genes (output of \code{\link[slipt]{detect_SL}}) or with synthetic lethal conditions and significance thresholds met (output of \code{\link[slipt]{table_of_SL}}).
#' @param x Data matrix. Synthetic Lethal predictions to process, typically the output of \code{\link[slipt]{detect_SL}} or \code{\link[slipt]{table_of_SL}}.
#' @keywords synthetic lethal, gene interaction, significance, post-processing, subset, slice, LaTeX, tex, table
#' @export
#' @examples
#' export_SL_latex(sl_table)
#'
export_SL_latex <-
function(x) print(xtable(head(x[, c(3, 4, 13, 15, 17)], 25), display=c("s", "d", "g", "g", "g", "g")), type="latex", file=paste0(deparse(substitute(x)), ".tex"))
