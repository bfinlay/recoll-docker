FROM ubuntu:bionic
MAINTAINER Brion Finlay <x@x.x>

RUN adduser --disabled-password docker

EXPOSE 8080

# path to recoll config directory
ENV RECOLL_CONFDIR /home/docker/data/.recoll 

# wv http://www.linuxfromscratch.org/blfs/view/8.1/general/wv.html
# This package contains tools for reading information from an MS Word document

# poppler-utils http://www.linuxfromscratch.org/blfs/view/svn/general/poppler.html
# The Poppler package contains a PDF rendering library and command line tools used to manipulate PDF files.
# This is useful for providing PDF rendering functionality as a shared library.

RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:recoll-backports/recoll-1.15-on && \
    apt update && \
# Default includes:
# - text
# - html
# - Excel and Powerpoint (*.xls and *.ppt)
# - zip archives
# - tar archives
# Default above includes xml libraries which enables:
# - Microsoft Office Open XML (*.docx, *.xlsx, *.pptx)
# Other formats are also supported by default, see: https://www.lesbonscomptes.com/recoll/features.html#doctypes
    apt install -y recoll python-recoll python3-recoll python git && \
# MS Word (*.doc) search utilities
# note: antiword is already installed by default above
    apt install -y wv && \
# PDF search utilities
    apt install -y poppler-utils tesseract-ocr && \
    apt clean

# This repo is out of date.  See below.
# RUN git clone https://github.com/koniu/recoll-webui.git /home/docker/recoll-webui/

# See https://github.com/koniu/recoll-webui/issues/75 to fix "AttributeError("'NoneType' object has no attribute 'ipath'",)" error
# See also https://github.com/koniu/recoll-webui/issues/74 indicating same fork
# python-waitress package is used by this repo fork
RUN apt install python-waitress python3-waitress && \
    git clone https://@opensourceprojects.eu/git/p/recollwebui/code /home/docker/recoll-webui/

USER docker
