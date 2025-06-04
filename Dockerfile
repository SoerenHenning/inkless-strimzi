FROM quay.io/strimzi/kafka:0.46.0-kafka-4.0.0

USER root

RUN mkdir ../tmp && \
    cd ../tmp && \
    curl -LO https://dlcdn.apache.org/kafka/4.0.0/kafka_2.13-4.0.0.tgz && \
    tar -xvzf kafka_2.13-4.0.0.tgz

ADD inkless/core/build/distributions/kafka_2.13-4.1.0-inkless-SNAPSHOT.tgz /opt/tmp
ADD patch_kafka.sh /opt/tmp

RUN cd ../tmp && \
    ./patch_kafka.sh && \
    cd ../kafka && \
    rm -r ../tmp
