library(slipt)
context("no SL summary")

#example data
data <- c()
for(i in 1:100){
  data <- cbind(data, rnorm(1000))
}
rm(i)
rownames(data) <- paste("gene", 1:1000)
colnames(data) <- paste("sample", 1:100)
dim(data)

#load package functions
library("slipt")

##run examples
#partition data
partitioned_data <- prep_data_for_SL(data)
dim(partitioned_data)
#SL analysis
sl_table <- detect_SL("gene 1", partitioned_data)
head(sl_table)

test_that("SL counts", {
  #load("data/sl_table.rda")
  counts <- count_of_SL(sl_table)
  expect_that(counts, is.integer)
  expect_that(counts, equals(0))
})

test_that("SL table extract", {
  counts <- count_of_SL(sl_table)
  short_table <- table_of_SL(sl_table)
  expect_that(nrow(short_table), equals(0))
})

context("postive SL summary")

sl_table <- detect_SL("gene 1", partitioned_data)
sl_table[2:5, "TS_SynLethal"] <- "2"
sl_table[2:5, c("rawPval", "adjPval_holm", "adjPval_FDR")] <- "0"

test_that("SL counts", {
  #load("data/sl_table.rda")
  counts <- count_of_SL(sl_table)
  expect_that(counts, is.integer)
  expect_that(counts, equals(length(2:5)))
})

test_that("SL table extract", {
  counts <- count_of_SL(sl_table)
  short_table <- table_of_SL(sl_table)
  expect_that(nrow(short_table), equals(counts))
})
