FROM gitpod/workspace-mysql

RUN curl https://archive.apache.org/dist/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz -o spark.tgz
RUN tar xvf spark.tgz 
RUN curl https://dlcdn.apache.org/zeppelin/zeppelin-0.10.1/zeppelin-0.10.1-bin-all.tgz -o zeppelin.tgz
RUN tar xvf zeppelin.tgz
RUN sudo apt-get update \
    && sudo apt-get install cowsay -y
RUN mkdir -p /home/gitpod/utpl
RUN mv spark-3.2.1-bin-hadoop3.2 /home/gitpot/utpl/spark-3.2.1-bin-hadoop3.2
RUN mv zeppelin-0.10.1-bin-all /home/gitpot/utpl/zeppelin-0.10.1-bin-all
RUN rm -f spark.tgz
RUN rm -f zeppelin.tgz
ENV PATH=/home/gitpod/utpl/zeppelin-0.10.1-bin-all/bin:$PATH
