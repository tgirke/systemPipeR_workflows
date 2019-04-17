#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  SoftwareRequirement:
    packages:
    - package: bwa
      version: [ 0.7.17 ]

baseCommand: ["bwa", "mem"]

arguments:
  - prefix: 
    valueFrom: -M
    position: 2

inputs:
  reference_file:
    type: File
    secondaryFiles: [ .amb, .ann, .bwt, .pac, .sa ]
    inputBinding:
      position: 3
  fq1:
    type: File
    inputBinding:
      position: 4
  nthreads:
    type: int
    inputBinding:
      prefix: -t
      position: 1
  output_filename:
    type: string

stdout: $(inputs.output_filename).sam

outputs:
  bwa_men_sam:
    type: stdout
