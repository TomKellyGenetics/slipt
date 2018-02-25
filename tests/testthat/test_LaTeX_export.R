library(slipt)
context("LaTeX export")

source("../../data-raw/source_data.R")

test_that("SL data exported", {
  #load("data/sl_table.rda")
  export_SL_latex(sl_table)
  expect_that(file.exists("sl_table.tex"), equals(TRUE))
  file.remove("sl_table.tex")
})
