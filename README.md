SLIPT: Synthetic Lethal Prediction Tool
===================

R package to implement various functions for Synthetic Lethal Interaction analysis. Serves as a supplement to the Kelly et al. (2016) paper which presents detection of candidate synthetic lethal gene pairs from gene expression signatures in breast cancer genomics data from The Cancer Genome Atlas (TCGA) project. 

To get the current released version from github:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/slipt", ref="master")
```

To get a minimal previous version from github:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/slipt", ref="basic")
```

## Running

SLIPT requires continous or count data to be binned into categorical data for each gene. `prep_data_for_SL` takes genes (rows) x samples (columns), performs this binning and transposes the data for input into `detect_SL`. This step is performed separately to enable query of multiple genes without computational load to repeating this data preparation. `detect_SL` takes a "query" genes and compares it's expression to every other potential "candidate" gene in the dataset returning a table of summary statistics (including adjusted p-values) with rows of genes ordered by significance. `count_of_SL` and `table_of-SL` perform post-processing to respectively count or extract the predicted synthetic lethal partner genes with various directional and significance criteria. While many configurations are possible (and documented), the default settings are recommended for stringent predictions with adjusting for the false-discovery rate and calling only symmetrically detected query-candidate pairs.

## Example
```R
datasetx <- prep_data_for_SL(dataset)
SL_Table <- detect_SL(query = "SVIL", datasetx)
count_of_SL(SL_Table)
table_of_SL(SL_Table)
```


##Vignette

Find more info in the accompanying vignette guide:

https://rawgit.com/TomKellyGenetics/slipt/master/vignettes/synthetic_lethal_SLIPT.html

