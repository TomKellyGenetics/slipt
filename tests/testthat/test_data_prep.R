library(slipt)
context("SL data prep")

#example data
data <- c()
for(i in 1:100){
  data <- cbind(data, rnorm(1000))
}
rm(i)
rownames(data) <- paste("gene", 1:1000)
colnames(data) <- paste("sample", 1:100)
dim(data)

test_that("SL prep for expression quantiles", {
  #load("data/data.rda")
  partitioned_data <- prep_data_for_SL(data, n = 3L)
  dim(partitioned_data)
  expect_that(dim(partitioned_data), equals(dim(data)[c(2,1)]))
})

test_that("SL prep for removed quantiles", {
  partitioned_data <- prep_data_for_SL(data)
  dim(partitioned_data)
  expect_that(dim(partitioned_data), equals(dim(data)[c(2,1)]))
})

test_that("SL prep for specified quantiles", {
  partitioned_data <- prep_data_for_SL(data, n = 2L)
  dim(partitioned_data)
  expect_that(dim(partitioned_data), equals(dim(data)[c(2,1)]))
})
