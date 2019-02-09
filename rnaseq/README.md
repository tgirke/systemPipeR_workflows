# RNA-Seq Workflow Template

> **Instructions for running `RNA-Seq` are given in the main vignette [here](https://htmlpreview.github.io/?https://github.com/tgirke/systemPipeRdata/blob/master/inst/extdata/workflows/rnaseq/systemPipeRNAseq.html).**

## Version

This folder includes following version:

1. Current: [Development](http://www.bioconductor.org/packages/devel/bioc/html/systemPipeR.html) (Bioc 3.9)
2. Experimental: Development of new ideas!

## Workflow environment

Load the `RNA-Seq` sample workflow into your current working directory.

```{r genRNA_workflow, eval=FALSE}
library(systemPipeRdata)
genWorkenvir(workflow="rnaseq", url="https://github.com/dcassol/systemPipeR_Workflows/blob/master/rnaseq/version-current/systemPipeRNAseq.Rmd", urlname="systemPipeRNAseq.Rmd")
setwd("rnaseq")
```

Workflow includes following steps:

1. Read preprocessing
    + Quality filtering (trimming)
    + FASTQ quality report
2. Alignments: _`Tophat2`_ (or any other RNA-Seq aligner)
3. Alignment stats 
4. Read counting 
5. Sample-wise correlation analysis
6. Analysis of differentially expressed genes (DEGs)
7. GO term enrichment analysis
8. Gene-wise clustering

## Citation

**Note:** if you use _`systemPipeR`_ in published research, please cite:

Backman, T.W.H and Girke, T. (2016). *systemPipeR*: NGS Workflow and Report Generation Environment. *BMC Bioinformatics*, 17: 388. [10.1186/s12859-016-1241-0](https://doi.org/10.1186/s12859-016-1241-0).


