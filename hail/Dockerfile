FROM openjdk:8-jdk

RUN apt-get update --fix-missing && apt-get install -y \
    ca-certificates \
    cmake \
    g++ \
    liblz4-dev \
    git \
    wget \
    vim-gtk

#Use spark 2.2.0
ENV SPARK_HOME=/usr/spark/spark-2.2.0-bin-hadoop2.7 \
    HAIL_HOME=/usr/hail \
    PATH=/opt/conda/bin:$PATH:/usr/spark/spark-2.2.0-bin-hadoop2.7/bin:/usr/hail/build/install/hail/bin/

#Use python >= 3.6
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.5.12-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

RUN mkdir /usr/spark && \
    curl -sL --retry 3 \
    "https://archive.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz" \
    | gzip -d \
    | tar x -C /usr/spark && \
    chown -R root:root $SPARK_HOME

RUN git clone https://github.com/broadinstitute/hail.git ${HAIL_HOME} && \
    cd ${HAIL_HOME}/hail && \
    ./gradlew clean && \
    ./gradlew -Dspark.version=2.2.0 shadowJar && \
    pip install py4j && \
    echo 'alias pyhail="PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.3-src.zip:$HAIL_HOME/python SPARK_CLASSPATH=$HAIL_HOME/build/libs/hail-all-spark.jar python"' >> ~/.bashrc

ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.3-src.zip:$HAIL_HOME/python \
    SPARK_CLASSPATH=$HAIL_HOME/build/libs/hail-all-spark.jar

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

RUN pip install genepattern-notebook jupyter-wysiwyg && \
  jupyter nbextension enable --py widgetsnbextension && \
  jupyter nbextension install --py genepattern && \
  jupyter nbextension enable --py genepattern && \
  jupyter serverextension enable --py genepattern && \
  jupyter nbextension install --py jupyter_wysiwyg && \
  jupyter nbextension enable --py jupyter_wysiwyg


WORKDIR /work

ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
