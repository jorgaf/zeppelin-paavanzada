FROM gitpod/workspace-mysql

RUN curl https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz -o spark.tgz \
    && tar xvf spark.tgz \
    curl https://dlcdn.apache.org/zeppelin/zeppelin-0.10.1/zeppelin-0.10.1-bin-all.tgz -o zeppelin.tgz \
    && tar xvf zeppelin.tgz \
    && sdk install java 8.0.302-open \
    && sdk install scala 2.12.15
