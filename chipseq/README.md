# ChIP-Seq Workflow Template

> **Instructions for running `ChIP-Seq` are given in the main vignette [here](https://htmlpreview.github.io/?https://github.com/tgirke/systemPipeRdata/blob/master/inst/extdata/workflows/chipseq/systemPipeChIPseq.html).**

## Version

This folder includes following version:

1. Current: [Development](http://www.bioconductor.org/packages/devel/bioc/html/systemPipeR.html) (Bioc 3.9)
2. Experimental: Development of new ideas!

## Workflow environment

Load the `ChIP-Seq` sample workflow into your current working directory.

```{r genChip_workflow, eval=FALSE}
library(systemPipeRdata)
genWorkenvir(workflow="chipseq", url="https://github.com/dcassol/systemPipeR_Workflows/blob/master/chipseq/version-current/systemPipeChIPseq.Rmd", urlname="systemPipeChIPseq.Rmd")
setwd("chipseq")
```

Workflow includes following steps:

1. Read preprocessing
    + Quality filtering (trimming)
    + FASTQ quality report
2. Alignments: _`Bowtie2`_ or _`rsubread`_
3. Alignment stats 
4. Peak calling: _`MACS2`_, _`BayesPeak`_ 
5. Peak annotation with genomic context
6. Differential binding analysis
7. GO term enrichment analysis
8. Motif analysis

## Citation

**Citation:** if you use _`systemPipeR`_ in published research, please cite:

Backman, T.W.H and Girke, T. (2016). *systemPipeR*: NGS Workflow and Report Generation Environment. *BMC Bioinformatics*, 17: 388. [10.1186/s12859-016-1241-0](https://doi.org/10.1186/s12859-016-1241-0).


