#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0

inputs:
  ## Common input
  - id: fq1
    type: File
  - id: fq2
    type: File
  - id: index_basedir
    type: Directory
  - id: index_basename
    type: string
  - id: nthreads
    type: int
  - id: output_filename
    type: string
  - id:  reference_file
    type: File

outputs:
  - id: samtools
    outputSource:
      - samtools-view/samtools_bam
    type: File

steps:
  - id: bowtie2
    in:
      - id: fq1
        source:
          - fq1
      - id: fq2
        source:
          - fq2
      - id: reference_file
        source: reference_file
      - id: index_basedir
        source: index_basedir
      - id: index_basename
        source: index_basename
      - id: nthreads
        source: nthreads
      - id: output_filename
        source: output_filename
    out:
      - id: bowtie2_sam
    run: bowtie2PE.cwl

  - id: samtools-view
    in:
      - id: output_filename
        source: output_filename
      - id: sam
        linkMerge: merge_flattened
        source:
          - bowtie2/bowtie2_sam
    out:
      - id: samtools_bam
    run: samtools_view.cwl
