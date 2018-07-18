[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/slipt)](https://cran.r-project.org/package=slipt)
[![Travis-CI Build Status](https://travis-ci.org/TomKellyGenetics/slipt.svg?branch=master)](https://travis-ci.org/TomKellyGenetics/slipt)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/TomKellyGenetics/slipt?branch=master&svg=true)](https://ci.appveyor.com/project/TomKellyGenetics/slipt)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![codecov](https://codecov.io/gh/TomKellyGenetics/slipt/branch/master/graph/badge.svg)](https://codecov.io/gh/TomKellyGenetics/slipt)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1313924.svg)](https://doi.org/10.5281/zenodo.1313924)

SLIPT: Synthetic Lethal Prediction Tool
===================

R package to implement various functions for Synthetic Lethal Interaction analysis. Serves as a supplement to the Kelly et al. (unpublished) paper which presents detection of candidate synthetic lethal gene pairs from gene expression signatures in breast cancer genomics data from The Cancer Genome Atlas (TCGA) project. 

## Installation

To get the current released version from github:

```R
# install.packages("devtools")
devtools::install_github("TomKellyGenetics/slipt", ref="master")
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

```
@article{Kelly2017,
   Author = {Kelly, S. T. and Chen, A. and Guilford, P. J. and Black, M. A.},
   Title = {Synthetic Lethal Interaction Prediction of Target Pathways in E-cadherin-deficient Breast Cancers},
   Journal = {},
   Volume = {},
   Number = {},
   Pages = {},
      Year = {2017},
   Note = {Unpublished Manuscript} }
```

This README will be updated to link to electronic archives of this thesis, pre-print, and published manuscript once they become available. No further changes will be made to the code in this branch.

This package was developed as part of a thesis project and the electronic archive of the full thesis can be found on the University of Otago thesis archive at [http://hdl.handle.net/10523/7699](http://hdl.handle.net/10523/7699)

### Package Citation

The package can be cited directly (as called with `citation(slipt)`):


To cite the slipt package in publications use:

  S. Thomas Kelly and Michael A. Black (2017). slipt: Synthetic Lethal Interaction Prediction Tool.
  R package version 0.3.0. https://github.com/TomKellyGenetics/vioplot doi:10.5281/zenodo.1313924

A BibTeX entry for LaTeX users is

```
  @Manual{,
    title = {slipt: Synthetic Lethal Interaction Prediction Tool},
    author = {S. Thomas Kelly and Michael A. Black},
    year = {2017},
    note = {R package version 0.1.0},
    url = {https://github.com/TomKellyGenetics/vioplot},
    doi = {10.5281/zenodo.1313924},
  }
```

Please also acknowledge the manuscript describing use of this package (currently under review).


## Running

SLIPT requires continous or count data to be binned into categorical data for each gene. `prep_data_for_SL` takes genes (rows) x samples (columns), performs this binning and transposes the data for input into `detect_SL`. This step is performed separately to enable query of multiple genes without computational load to repeating this data preparation. `detect_SL` takes a "query" genes and compares it's expression to every other potential "candidate" gene in the dataset returning a table of summary statistics (including adjusted p-values) with rows of genes ordered by significance. `count_of_SL` and `table_of-SL` perform post-processing to respectively count or extract the predicted synthetic lethal partner genes with various directional and significance criteria. While many configurations are possible (and documented), the default settings are recommended for stringent predictions with adjusting for the false-discovery rate and calling only symmetrically detected query-candidate pairs.

## Example
```R
datasetx <- prep_data_for_SL(dataset)
SL_Table <- detect_SL(query = "SVIL", datasetx)
count_of_SL(SL_Table)
table_of_SL(SL_Table)
```


## Vignette

Find more info in the accompanying vignette guide:

https://rawgit.com/TomKellyGenetics/slipt/master/vignettes/synthetic_lethal_SLIPT.html

