FROM gitpod/workspace-mysql

RUN curl https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz -o spark.tgz
RUN tar xvf spark.tgz 
RUN curl https://dlcdn.apache.org/zeppelin/zeppelin-0.10.1/zeppelin-0.10.1-bin-all.tgz -o zeppelin.tgz
RUN tar xvf zeppelin.tgz
RUN sudo apt-get update \
    && sudo apt-get install cowsay -y
