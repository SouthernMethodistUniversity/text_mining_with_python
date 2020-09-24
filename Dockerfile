FROM jupyter/datascience-notebook
USER root
RUN conda install --quiet --yes\
 nltk\
 textblob\
 wordcloud\
 bsddb3\
 jupytext\
 fastparquet\
 pyarrow\
 python-snappy\
 spacy
RUN jupyter labextension install @ijmbarr/jupyterlab_spellchecker &&\
 jupyter labextension install @aquirdturtle/collapsible_headings &&\
 jupyter labextension install @jupyterlab/toc &&\
 jupyter labextension install jupyterlab-spreadsheet &&\
 jupyter nbextension install --py jupytext &&\
 jupyter nbextension enable --py jupytext
RUN pip3 install\
 edgar\
 Gutenberg
RUN python3 -m nltk.downloader -d /usr/share/nltk_data all
RUN python3 -m spacy download en_core_web_sm
USER $NB_UID

