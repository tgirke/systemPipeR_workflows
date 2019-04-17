#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(inputs.reference_file)
    entryname: $(inputs.reference_file.path.split('/').slice(-1)[0])
inputs:
  reference_file:
    type: File
    doc: <file.fa|file.fa.gz>

outputs:
  index:
    type: File
    outputBinding:
      glob: $(inputs.reference_file.path.split('/').slice(-1)[0]) #+'.fai')
    secondaryFiles:
    - .fai
    - .gzi

baseCommand:
- samtools
- faidx

arguments:
- valueFrom: $(inputs.reference_file.path.split('/').slice(-1)[0])
  position: 1
