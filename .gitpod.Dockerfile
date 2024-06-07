FROM gitpod/workspace-mysql:2024-06-05-14-45-28

RUN curl https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz -o spark.tgz
RUN tar xvf spark.tgz 
RUN curl https://dlcdn.apache.org/zeppelin/zeppelin-0.11.1/zeppelin-0.11.1-bin-all.tgz -o zeppelin.tgz
RUN tar xvf zeppelin.tgz
RUN sudo apt-get update \
    && sudo apt-get install cowsay -y
RUN mkdir -p /home/gitpod/utpl
RUN mv spark-3.5.1-bin-hadoop3 /home/gitpod/utpl/spark-3.5.1-bin-hadoop3
RUN mv zeppelin-0.11.1-bin-all /home/gitpod/utpl/zeppelin-0.11.1-bin-all
RUN rm -f spark.tgz
RUN rm -f zeppelin.tgz
RUN cd /home/gitpod/utpl/zeppelin-0.11.1-bin-all \
    && find . -name '._*' -delete
