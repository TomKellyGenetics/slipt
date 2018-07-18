SLIPT: Synthetic Lethal Prediction Tool
===================

[![DOI](https://zenodo.org/badge/55461436.svg)](https://zenodo.org/badge/latestdoi/55461436)

R package to implement various functions for Synthetic Lethal Interaction analysis. Serves as a supplement to the Kelly et al. (2017) thesis which presents detection of candidate synthetic lethal gene pairs from gene expression signatures in breast cancer genomics data from The Cancer Genome Atlas (TCGA) project. 

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

This is a stable repository to provide the code as used in the PhD Thesis (Kelly, 2017) submitted to the University of Otago.

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/slipt", ref="thesis")
```

## Citation

Please acknowledge use of this software appropriately when used for research or developing further software. Please cite the following thesis and publication where appropriate:

Kelly (2017) A Bioinformatics Approach to Synthetic Lethal Interactions  in Cancer. PhD thesis submitted to the University of Otago, Dunedin, New Zealand.

```bibtex
@phdthesis{Kelly2017,
   Author = {Kelly, S. T.},
   Title = {A Bioinformatics Approach to Synthetic Lethal Interactions  in Cancer},
   School = {University of Otago},
   Type = {Thesis},
      Year = {2017},
   Note = {Under examination} }
```

Kelly, S.T., Chen, A., Guilford, P.J., and Black, M.A. (unpublished) Synthetic Lethal Interaction Prediction of Target Pathways in E-cadherin-deficient Breast Cancers. _BMC Genomics_ manuscript submitted

```bibtex

@article{Kelly2017,
   Author = {Kelly, S. T. and Chen, A. and Guilford, P. J. and Black, M. A.},
   Title = {Synthetic Lethal Interaction Prediction of Target Pathways in E-cadherin-deficient Breast Cancers},
   Journal = {BMC Genomics},
   Volume = {},
   Number = {},
   Pages = {},
      Year = {2017},
   Note = {Submitted and awaiting review} }
```

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

