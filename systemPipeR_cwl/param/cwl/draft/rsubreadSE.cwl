#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

baseCommand: [Rscript]

arguments: ["--vanilla", $(inputs.rscript)]

inputs:
  rscript:
    type: File
  
  reference_file:
    type: File
    inputBinding:
      position: 1
  fq1:
    type: File
    inputBinding:
      position: 2
  output_filename:
    type: string
    inputBinding:
      position: 3
  nthreads:
    type: int
    inputBinding:
      position: 4

outputs:
  rsubread_sam:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)

  vcf_files:
    type: File
    outputBinding:
      glob: $(inputs.output_filename).indel.vcf


