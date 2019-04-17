################################################################
##                   Workflow_fastx_clipper                   ##
################################################################

class: Workflow
cwlVersion: v1.0

################################################################
##              Inputs and Outputs Settings                   ##
################################################################

inputs:
  fq1: File
  SampleName: string
  results_path: Directory
  adaptor: string

outputs:
  gunzip:
    outputSource: gunzip/gunzip_file
    type: File
  fastx_clipper:
    outputSource: fastx_clipper/fastx_clipper_file
    type: File

################################################################
##                Workflow Steps Definitions                  ##
################################################################

steps:
  gunzip:
    in:
      fq1: fq1
      SampleName: SampleName
      results_path: results_path
    out: [gunzip_file]
    run: gunzip.cwl

  fastx_clipper:
    in:
      adaptor: adaptor
      SampleName: SampleName
      gunzip: gunzip/gunzip_file
      results_path: results_path
    out: [fastx_clipper_file]
    run: fastx_clipper.cwl


