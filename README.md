SLIPT: Synthetic Lethal Prediction Tool
===================

R package to implement various functions for Synthetic Lethal Interaction analysis. Serves as a supplement to the Kelly et al. (unpublished) paper which presents detection of candidate synthetic lethal gene pairs from gene expression signatures in breast cancer genomics data from The Cancer Genome Atlas (TCGA) project. 

## Install

To get the current released version from github:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/slipt", ref="master")
```

To install the development version from this (private) repo as a collaborator:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/slipt", ref="master", auth_token = "f5a2b533442dc71d55e230dc60ca2758254231e7")
```

To get a minimal previous version from github:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/slipt", ref="basic")
```

To get a stable version with code used in a Thesis submitted to the University of Otago (with limited documentation):

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/slipt", ref="thesis")
```

See the following `thesis` branch for this stable repository: https://github.com/TomKellyGenetics/slipt/tree/thesis


## Citation 

Please cite this package appropriately when it is used. The following manuscript has been submitted to a journal for publication. A link to this article or a preprint will be given when it becomes available.

Synthetic lethal interaction prediction of target pathways in E-cadherin-deficient breast cancers.

Simon Thomas Kelly, Augstine Chen, Parry J Guilford, and Michael A Black

Submitted to _BMC Genomics_ 19/07/2017

@article{Kelly2017,
   Author = {Kelly, S. T. and Chen, A. and Guilford, P. J. and Black, M. A.},
   Title = {Synthetic Lethal Interaction Prediction of Target Pathways in E-cadherin-deficient Breast Cancers},
   Journal = {BMC Genomics},
   Volume = {},
   Number = {},
   Pages = {},
      Year = {2017},
   Note = {Submitted and awaiting review} }

This README will be updated to link to electronic archives of this thesis, pre-print, and published manuscript once they become available. No further changes will be made to the code in this branch.

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

