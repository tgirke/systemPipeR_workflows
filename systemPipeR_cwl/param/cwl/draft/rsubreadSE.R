#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

.libPaths("/home/dcassol/R/x86_64-pc-linux-gnu-library/3.5") ##you may need to specify the location of your library

library(Rsubread)
buildindex(basename=args[1], reference=args[1]) # Build indexed reference genome
align(index=args[1], readfile1=args[2], input_format="FASTQ", 
      output_file=args[3], output_format="SAM", nthreads=args[4], indels=1, TH1=2)

