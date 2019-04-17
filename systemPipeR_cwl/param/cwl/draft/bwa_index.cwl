#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  SoftwareRequirement:
    packages:
    - package: bwa
      version: [ 0.7.17 ]

baseCommand: ["bwa", "index", "-a", "bwtsw"]

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.reference_file)
inputs:
  reference_file:
    type: File
    inputBinding:
      position: 1
      valueFrom: $(self.basename)
outputs:
  result:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*"
