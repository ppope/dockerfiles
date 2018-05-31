FROM jupyter/base-notebook:latest

MAINTAINER Phil Pope <p.e.pope01@gmail.com>

USER root

RUN apt-get update && \
  apt-get install -y binutils libproj-dev gdal-bin

RUN pip install --upgrade pip

RUN conda install --yes --no-pin \
  geopandas \
  scikit-learn \
  statsmodels \
  seaborn

RUN pip install moviepy
