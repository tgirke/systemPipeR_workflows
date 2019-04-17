################################################################
##                           gunzip                           ##
################################################################

cwlVersion: v1.0
class: CommandLineTool

################################################################
##            baseCommand and arguments definitions           ##
################################################################

baseCommand: [ "gunzip", "-c" ]

requirements:
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.results_path)

################################################################
##               Inputs and Outputs Settings                  ##
################################################################

inputs:
  fq1:
    type: File
    inputBinding:
      position: 1
  SampleName:
    label: "Filename to write output to"
    type: string

outputs:
    unzipped_fq1:
        type: stdout

stdout: $(inputs.results_path)/$(inputs.SampleName).fastq


###########
## Notes ##
###########

## If the template its used in bash script with the "cwl-runner", please remove "$(inputs.results_path)/" from "stdout" and then run: 
# "cwl-runner --outdir <path>/ gunzip.cwl gunzip.yml"

