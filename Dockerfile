FROM tensorflow/tensorflow:1.1.0-py3

ENV TENSORFLOW_GRAPH_DEF=/opt/tensorflow/classify_image_graph_def.pb
ENV TF_CPP_MIN_LOG_LEVEL=3

RUN mkdir $(dirname $TENSORFLOW_GRAPH_DEF) && \
    curl -o $(dirname $TENSORFLOW_GRAPH_DEF)/inception.tgz http://download.tensorflow.org/models/image/imagenet/inception-2015-12-05.tgz && \
    tar -C $(dirname $TENSORFLOW_GRAPH_DEF) -xf /opt/tensorflow/inception.tgz $(basename $TENSORFLOW_GRAPH_DEF)

ADD . /opt/tensorflow-bottleneck-web-service

WORKDIR /opt/tensorflow-bottleneck-web-service

ENTRYPOINT /opt/tensorflow-bottleneck-web-service/bin/run.sh
