#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  SoftwareRequirement:
    packages:
    - package: bowtie2
      version: [ 2.3.4.3 ]

baseCommand: [bowtie2-build]

inputs:
  reference_file:
    type: File
    inputBinding:
      position: 1
  index_basename:
    type: string
    inputBinding:
      position: 2

outputs:
  index_files:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*"
