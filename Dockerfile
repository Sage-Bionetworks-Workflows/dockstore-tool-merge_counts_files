FROM python:3.8.6

RUN pip install \
	pandas==1.1.3

COPY bin/* /usr/local/bin/

LABEL maintainer="Bruno Grande <bruno.grande@sagebase.org>"
LABEL base_image="python:3.8.6"
LABEL about.summary="Docker image for merge_counts_files.py script"
LABEL about.license="SPDX:Apache-2.0"
