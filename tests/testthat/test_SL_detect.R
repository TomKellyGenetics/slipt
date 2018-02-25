library(slipt)
context("SL detect")

test_that("SL predicted for expression quantiles", {
  load("data/partitioned_data.rda")
  sl_table <- detect_SL("gene 1", partitioned_data)
  dim(sl_table)
  expect_that(dim(sl_table), equals(c(ncol(partitioned_data), 17)))
  expect_that(sl_table[1,1], equals("gene 1"))
  expect_that(!is.na(as.numeric(sl_table[,17])), all)
})
