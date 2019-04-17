#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

baseCommand: [Rscript]


arguments:
  - prefix: 
    valueFrom: --vanilla
    position: 1
  - prefix: 
    valueFrom: $(inputs.rscript)
    position: 2
  - prefix: 
    valueFrom: $(inputs.fq1.basename).gsnap
    position: 7

inputs:
  rscript:
    type: File
  reference_file:
    type: File
    inputBinding:
      position: 3
  output_filename:
    type: string
    inputBinding:
      position: 4
  fq1:
    type: File
    inputBinding:
      position: 5
  fq2:
    type: File
    inputBinding:
      position: 6

outputs:
  gmap_bam:
    type: File
    outputBinding:
      glob: $(inputs.fq1.basename).gsnap.sam.bam
  gmap_bai:
    type: File
    outputBinding:
      glob: $(inputs.fq1.basename).gsnap.sam.bam.bai

