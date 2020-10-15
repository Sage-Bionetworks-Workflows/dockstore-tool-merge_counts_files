$namespaces:
  edam: http://edamontology.org/
  s: https://schema.org/
baseCommand:
- merge_counts_files.py
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: quay.io/sagebionetworks/dockstore-tool-merge_counts_files:0.0.2
inputs:
  counts_files:
    inputBinding:
      prefix: --files
    type: File[]
  output_prefix:
    inputBinding:
      prefix: --output
    type: string
  reference_file:
    inputBinding:
      prefix: --reference
    type: File
label: Merge CSV counts files with CSV reference library
outputs:
  output_file:
    outputBinding:
      glob: $(inputs.output_prefix)_counts.csv
    type: File
s:author:
- class: s:Person
  s:email: bruno.grande@sagebase.org
  s:identifier: https://orcid.org/0000-0002-4621-1589
  s:name: Bruno Grande
s:license: https://spdx.org/licenses/Apache-2.0
