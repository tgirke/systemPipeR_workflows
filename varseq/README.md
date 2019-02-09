# VAR-Seq Workflow Template

> **Instructions for running `VAR-Seq` are given in the main vignette [here](https://htmlpreview.github.io/?https://github.com/tgirke/systemPipeRdata/blob/master/inst/extdata/workflows/varseq/systemPipeVARseq.html).**

## Version

This folder includes following version:

1. Current: [Development](http://www.bioconductor.org/packages/devel/bioc/html/systemPipeR.html) (Bioc 3.9)
2. Experimental: Development of new ideas!

## Workflow environment

Load the `VAR-Seq` sample workflow into your current working directory.

```{r genVAR_workflow, eval=FALSE}
library(systemPipeRdata)
genWorkenvir(workflow="varseq", url="https://github.com/dcassol/systemPipeR_Workflows/blob/master/varseq/version-current/systemPipeVARseq.Rmd", urlname="systemPipeVARseq.Rmd")
setwd("varseq")
```

Workflow includes following steps:

1. Read preprocessing
    + Quality filtering (trimming)
    + FASTQ quality report
2. Alignments: _`gsnap`_, _`bwa`_
3. Variant calling: _`VariantTools`_, _`GATK`_, _`BCFtools`_
4. Variant filtering: _`VariantTools`_ and _`VariantAnnotation`_
5. Variant annotation: _`VariantAnnotation`_
6. Combine results from many samples
7. Summary statistics of samples

## Citation

**Note:** if you use _`systemPipeR`_ in published research, please cite:

Backman, T.W.H and Girke, T. (2016). *systemPipeR*: NGS Workflow and Report Generation Environment. *BMC Bioinformatics*, 17: 388. [10.1186/s12859-016-1241-0](https://doi.org/10.1186/s12859-016-1241-0).


