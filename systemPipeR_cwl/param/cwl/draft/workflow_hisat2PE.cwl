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

outputs:
  - id: outdir
    outputSource:
      - mkdir/mkdir_out
    type: Directory
  - id: samtools
    outputSource:
      - samtools-view/samtools_bam
    type: File

steps:
  - id: mkdir
    in:
      - id: output_filename
        source: output_filename
    out:
      - id: mkdir_out
    run: mkdir.cwl

  - id: hisat2
    in:
      - id: fq1
        source:
          - fq1
      - id: fq2
        source:
          - fq2
      - id: index_basedir
        source: index_basedir
      - id: index_basename
        source: index_basename
      - id: nthreads
        source: nthreads
      - id: output_filename
        source: output_filename
    out:
      - id: hisat2_sam
    run: hisat2PE_mapping.cwl

  - id: samtools-view
    in:
      - id: output_filename
        source: output_filename
      - id: sam
        linkMerge: merge_flattened
        source:
          - hisat2/hisat2_sam
    out:
      - id: samtools_bam
    run: samtools_view.cwl
