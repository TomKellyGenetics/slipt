library(slipt)
context("SL data prep")

source("../../data-raw/source_data.R")

test_that("SL prep for expression quantiles", {
  #load("data/data.rda")
  partitioned_data <- prep_data_for_SL(data, n = 3)
  dim(partitioned_data)
  expect_that(dim(partitioned_data), equals(dim(data)[c(2,1)]))
})

test_that("SL prep for removed quantiles", {
  partitioned_data <- prep_data_for_SL(data)
  dim(partitioned_data)
  expect_that(dim(partitioned_data), equals(dim(data)[c(2,1)]))
})

test_that("SL prep for specified quantiles", {
  partitioned_data <- prep_data_for_SL(data, n = 2)
  dim(partitioned_data)
  expect_that(dim(partitioned_data), equals(dim(data)[c(2,1)]))
})
