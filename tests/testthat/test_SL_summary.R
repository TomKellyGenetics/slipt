library(slipt)
context("SL summary")

source("../../data-raw/source_data.R")

test_that("SL counts", {
  #load("data/sl_table.rda")
  counts <- count_of_SL(sl_table)
  expect_that(counts, is.integer)
})

test_that("SL table extract", {
  short_table <- table_of_SL(sl_table)
  expect_that(nrow(short_table), equals(counts))
})
