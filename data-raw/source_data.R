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

#summarise outputs
count_of_SL(sl_table)

table_of_SL(sl_table)
