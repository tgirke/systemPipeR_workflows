#!/usr/bin/env cwl-runner

## Note: mkdir is usually not necessary since one can create directories 
## in any step as shown in the other steps of this workflow. The mkdir.cwl
## step is mainly useful to generate empty directories if needed.

cwlVersion: v1.0
class: CommandLineTool

baseCommand: [mkdir, -p]

inputs:
  output_filename:
    type: string
    inputBinding:
      position: 2
      valueFrom: $(inputs.output_filename)

outputs:
  mkdir_out:
    type: Directory
    outputBinding:
      glob: $(inputs.output_filename)
