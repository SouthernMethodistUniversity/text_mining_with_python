FROM jupyter/datascience-notebook
USER root
RUN conda install --quiet --yes\
 nltk\
 textblob\
 wordcloud\
 bsddb3\
 jupytext
RUN jupyter labextension install @ijmbarr/jupyterlab_spellchecker &&\
 jupyter labextension install @aquirdturtle/collapsible_headings &&\
 jupyter labextension install @jupyterlab/toc &&\
 jupyter labextension install jupyterlab-spreadsheet &&\
 jupyter nbextension install --py jupytext &&\
 jupyter nbextension enable --py jupytext
RUN pip3 install\
 edgar\
 Gutenberg
RUN conda install --quiet --yes -c conda-forge\
 fastparquet\
 pyarrow
RUN python3 -m nltk.downloader -d /usr/share/nltk_data all
USER $NB_UID

