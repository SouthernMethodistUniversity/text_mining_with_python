FROM jupyter/datascience-notebook
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
 jupyter lab build
RUN pip3 install\
 edgar\
 Gutenberg
