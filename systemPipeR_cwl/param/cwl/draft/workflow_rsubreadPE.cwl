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
  - id: reference_file
    type: File
  ## input rsubread.R
  - id: rscript
    type: File

outputs:
  - id: vcf_files
    outputSource:
      - rsubread-alig/vcf_files
    type: File

  - id: samtools
    outputSource:
      - samtools-view/samtools_bam
    type: File

steps:
  - id: rsubread-alig
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
      - id: rscript
        source: rscript
    out:
      - id: rsubread_sam
      - id: vcf_files
    run: rsubreadPE.cwl

  - id: samtools-view
    in:
      - id: output_filename
        source: output_filename
      - id: sam
        linkMerge: merge_flattened
        source:
          - rsubread-alig/rsubread_sam
    out:
      - id: samtools_bam
    run: samtools_view.cwl

