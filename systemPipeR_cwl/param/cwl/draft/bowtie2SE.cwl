#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  SoftwareRequirement:
    packages:
    - package: bowtie2
      version: [ 2.3.4.3 ]

baseCommand: [bowtie2]

arguments:
  - prefix: -S
    valueFrom: $(inputs.output_filename).sam
    position: 6
  - prefix: -x
    valueFrom: $(inputs.reference_file)
    position: 4
  - prefix: -k
    valueFrom: '50'
    position: 2
  - prefix: 
    valueFrom: --non-deterministic
    position: 3  

inputs:
  reference_file:
    type: File
  index_basedir:
    type: Directory
  index_basename:
    type: string
  fq1:
    type: File
    inputBinding:
      prefix: -U
      itemSeparator: ","
      position: 5
  output_filename:
    type: string
  nthreads:
    type: int
    inputBinding:
      prefix: -p
      position: 1

outputs:
  bowtie2_sam:
    type: File
    outputBinding:
      glob: $(inputs.output_filename).sam

