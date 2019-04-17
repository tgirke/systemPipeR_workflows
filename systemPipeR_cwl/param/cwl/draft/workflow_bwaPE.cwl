#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0

inputs:
  ## Common input
  - id: fq1
    type: File
  - id: fq2
    type: File
  - id: nthreads
    type: int
  - id: output_filename
    type: string
  ## bwa input
  - id: reference_file
    type: File
    secondaryFiles: [ .amb, .ann, .bwt, .pac, .sa ]

outputs:
  - id: samtools
    outputSource:
      - samtools-view/samtools_bam
    type: File

steps:
  - id: bwa_men
    in:
      - id: fq1
        source:
          - fq1
      - id: fq2
        source:
          - fq2
      - id: reference_file
        source: reference_file
      - id: nthreads
        source: nthreads
      - id: output_filename
        source: output_filename
    out:
      - id: bwa_men_sam
    run: bwaPE.cwl

  - id: samtools-view
    in:
      - id: output_filename
        source: output_filename
      - id: sam
        linkMerge: merge_flattened
        source:
          - bwa_men/bwa_men_sam
    out:
      - id: samtools_bam
    run: samtools_view.cwl
