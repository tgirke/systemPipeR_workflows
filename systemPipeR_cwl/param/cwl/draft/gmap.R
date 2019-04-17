#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

.libPaths("/home/dcassol/R/x86_64-pc-linux-gnu-library/3.5") ##you may need to specify the location of your library

library(gmapR); library(systemPipeR)

gmapGenome <- GmapGenome(args[1], name=args[2], create=TRUE)
p <- GsnapParam(genome=gmapGenome, unique_only=TRUE, molecule="DNA", max_mismatches=3)
o <- gsnap(input_a=args[3], input_b=args[4], params=p, output=args[5])
  
