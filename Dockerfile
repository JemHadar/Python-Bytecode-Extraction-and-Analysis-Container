FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="$PATH:/opt/pyc2bytecode"
ENV PATH="$PATH:/opt/pyinstxtractor"
ENV PATH="$PATH:/opt/pycdc"
ENV PATH="$PATH:/opt/"

RUN apt update && apt -y install python3-pip \
      libssl-dev \
      wget \
      tar \
      unzip \
      git   \
      qtbase5-dev  \
      qtscript5-dev \
      qttools5-dev-tools \
      build-essential qtchooser \
      make \
      cmake 
RUN   git clone --recursive https://github.com/horsicq/DIE-engine
WORKDIR DIE-engine
RUN bash -x build_dpkg.sh \
   && dpkg -i release/die_*.deb
WORKDIR /opt/
RUN git clone https://github.com/knight0x07/pyc2bytecode.git
WORKDIR pyc2bytecode
RUN chmod a+x pyc2bytecode.py 
WORKDIR /opt/
RUN git clone  https://github.com/extremecoders-re/pyinstxtractor.git \ 
     && pip install unpy2exe \
     && pip install hexviewer \
     && pip install decompyle3 \
     && pip install uncompyle6 \
     && pip install flare-floss 
WORKDIR pyinstxtractor
RUN chmod a+x pyinstxtractor.py
WORKDIR /opt/
RUN git clone https://github.com/zrax/pycdc
WORKDIR pycdc
RUN  cmake . \
     && make \
     && make check \ 
     && mkdir -p /home/analysis
WORKDIR /opt/
RUN wget https://github.com/mandiant/capa/releases/download/v6.1.0/capa-v6.1.0-linux.zip \
     && unzip capa-v6.1.0-linux.zip \
     && rm capa-v6.1.0-linux.zip  
WORKDIR /home/analysis/
RUN ln -s /usr/bin/python3 /usr/bin/python \
 && ln -s /opt/pyc2bytecode/pyc2bytecode.py /opt/pyc2bytecode/py2byte \
 && ln -s /opt/pyinstxtractor/pyinstxtractor.py /opt/pyinstxtractor/pyxtract
RUN sed -i '1s|^|#!/usr/bin/env python\n|' /opt/pyc2bytecode/pyc2bytecode.py
RUN sed -i '1s|^|#!/usr/bin/env python\n|' /opt/pyinstxtractor/pyinstxtractor.py
