#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement

baseCommand: [java]
#baseCommand: [picard]


arguments:
- valueFrom: /home/dcassol/Downloads/picard.jar
  position: 1
  prefix: -jar
- valueFrom: CreateSequenceDictionary
  position: 2
- valueFrom: $(inputs.reference_file.basename).dict
  position: 4
  prefix: OUTPUT=

inputs:
  reference_file:
    type: File
    inputBinding:
      prefix: REFERENCE=
      separate: false
      position: 3

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.reference_file.basename).dict



