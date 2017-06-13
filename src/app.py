import json
import os
import sys
import numpy as np
import tensorflow as tf
from tensorflow.python.platform import gfile

def get_graph_tensors(graph_def_path, tensors):
    graph_def = tf.GraphDef()

    with gfile.FastGFile(graph_def_path, 'rb') as f:
        graph_def.ParseFromString(f.read())

    return tf.import_graph_def(graph_def, return_elements=tensors)

def get_graph_tensors_bottleneck_and_jpg_data(graph_def_path):
    return get_graph_tensors(graph_def_path, ['pool_3/_reshape:0', 'DecodeJpeg/contents:0'])

def main(graph_def_path, image):
    with gfile.FastGFile(image, 'rb') as f:
        image_data = f.read()

    with tf.Session() as tensorflow:
        tensor_bottleneck, tensor_jpeg_data = get_graph_tensors_bottleneck_and_jpg_data(graph_def_path)

        try:
            image_bottleneck = tensorflow.run(tensor_bottleneck, { tensor_jpeg_data: image_data })
            image_bottleneck = np.squeeze(image_bottleneck)
            image_bottleneck_json = json.dumps(image_bottleneck.tolist())

            print(image_bottleneck_json)

        except Exception as e:
            print('Couldn\'t encode {}: {}'.format(image, e))

if __name__ == '__main__':
    graph_def_path = os.environ['TENSORFLOW_GRAPH_DEF']
    image = sys.argv[1]

    main(graph_def_path, image)
