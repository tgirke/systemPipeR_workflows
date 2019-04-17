################################################################
#                       Advanced Settings                      #
################################################################

cwlVersion: v1.0
class: CommandLineTool
doc: "[HISAT2](https://ccb.jhu.edu/software/hisat2/index.shtml): graph-based alignment of next generation sequencing reads to a population of genomes"
label: Last updated 02/2019

hints:
  SoftwareRequirement:
    packages:
    - package: hisat2
      version: [ 2.1.0 ]

baseCommand: [hisat2]

arguments:
  - prefix: -S
    valueFrom: $(inputs.output_filename).sam
    position: 5
  - prefix: -x
    valueFrom: $(inputs.index_basedir.path)/$(inputs.index_basename)
    position: 6
  - prefix: -k
    valueFrom: '1'
    position: 2
  - prefix: --min-intronlen
    valueFrom: '30'
    position: 3  
  - prefix: --max-intronlen
    valueFrom: '3000'
    position: 4

inputs:
  index_basedir:
    type: Directory
  index_basename:
    type: string
  fq1:
    type: File
    inputBinding:
      prefix: "-1"
      position: 7
  fq2:
    type: File
    inputBinding:
      prefix: "-2"
      position: 8
  output_filename:
    type: string
  nthreads:
    type: int
    inputBinding:
      prefix: --threads
      valueFrom: '5'
      position: 1

outputs:
  hisat2_sam:
    type: File
    outputBinding:
      glob: $(inputs.output_filename).sam


