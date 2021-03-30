# docker build -t smuresearch/text_mining_with_python:latest .
# docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $HOME:/home/jovyan smuresearch/text_mining_with_python:latest

FROM jupyter/datascience-notebook:lab-3.0.5
LABEL maintainer "Robert Kalescky <rkalescky@smu.edu>"

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update &&\
 apt-get install -y\
 zsh
RUN conda install --quiet --yes\
 pandas\
 nltk\
 textblob\
 wordcloud\
 bsddb3\
 jupytext\
 fastparquet\
 pyarrow\
 python-snappy\
 spacy\
 gensim\
 adjusttext\
 openpyxl\
 jupyter-resource-usage
RUN jupyter labextension install @ijmbarr/jupyterlab_spellchecker &&\
 jupyter labextension install @aquirdturtle/collapsible_headings &&\
 jupyter labextension install @jupyterlab/toc &&\
 jupyter labextension install jupyterlab-spreadsheet &&\
 jupyter nbextension install --py jupytext &&\
 jupyter nbextension enable --py jupytext
RUN pip3 install\
 edgar\
 Gutenberg\
 num2words
RUN python3 -m nltk.downloader -d /usr/share/nltk_data all
RUN python3 -m spacy download en_core_web_sm
USER $NB_UID

