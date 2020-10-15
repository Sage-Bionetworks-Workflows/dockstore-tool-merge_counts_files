#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0

label: Merge CSV counts files with CSV reference library

hints:
  DockerRequirement:
    dockerPull: quay.io/sagebionetworks/dockstore-tool-merge_counts_files:0.0.1

baseCommand:
  - merge_counts_files.py

inputs:

  counts_files:
    type: File[]
    # format: edam:format_3475  # TSV
    inputBinding:
      prefix: --files
    
  reference_file:
    type: File
    # format: edam:format_3752  # CSV
    inputBinding:
      prefix: --reference
  
  output_prefix:
    type: string
    inputBinding:
      prefix: --output

outputs:

  output_file:
    type: File
    # format: edam:format_3752  # CSV
    outputBinding:
      glob: $(inputs.output_prefix)_counts.csv

$namespaces:
  s: https://schema.org/
  edam: http://edamontology.org/

s:author:
  - class: s:Person
    s:name: Bruno Grande
    s:email: bruno.grande@sagebase.org
    s:identifier: https://orcid.org/0000-0002-4621-1589

s:license: https://spdx.org/licenses/Apache-2.0
