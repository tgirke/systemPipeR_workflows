# RIBO-Seq Workflow Template

> **Instructions for running `RIBO-Seq` are given in the main vignette [here](https://htmlpreview.github.io/?https://github.com/tgirke/systemPipeRdata/blob/master/inst/extdata/workflows/riboseq/systemPipeRIBOseq.html).**

## Version

This folder includes following version:

1. Current: [Development](http://www.bioconductor.org/packages/devel/bioc/html/systemPipeR.html) (Bioc 3.9)
2. Experimental: Development of new ideas!

## Workflow environment

Load the `RIBO-Seq` sample workflow into your current working directory.

```{r genRIBO_workflow, eval=FALSE}
library(systemPipeRdata)
genWorkenvir(workflow="riboseq", url="https://github.com/dcassol/systemPipeR_Workflows/blob/master/riboseq/version-current/systemPipeRIBOseq.Rmd", urlname="systemPipeRIBOseq.Rmd")
setwd("riboseq")
```

Workflow includes following steps:

1. Read preprocessing
    + Adaptor trimming and quality filtering
    + FASTQ quality report
2. Alignments: _`Tophat2`_ (or any other RNA-Seq aligner)
3. Alignment stats
4. Compute read distribution across genomic features
5. Adding custom features to workflow (e.g. uORFs)
6. Genomic read coverage along transcripts
7. Read counting 
8. Sample-wise correlation analysis
9. Analysis of differentially expressed genes (DEGs)
10. GO term enrichment analysis
11. Gene-wise clustering
12. Differential ribosome binding (translational efficiency)

## Citation

**Note:** if you use _`systemPipeR`_ in published research, please cite:

Backman, T.W.H and Girke, T. (2016). *systemPipeR*: NGS Workflow and Report Generation Environment. *BMC Bioinformatics*, 17: 388. [10.1186/s12859-016-1241-0](https://doi.org/10.1186/s12859-016-1241-0).


