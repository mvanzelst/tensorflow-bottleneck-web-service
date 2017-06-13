# Tensorflow Bottleneck Web Service

> 'Bottleneck' is an informal term we often use for the layer just before the final output layer that actually does the classification. This penultimate layer has been trained to output a set of values that's good enough for the classifier to use to distinguish between all the classes it's been asked to recognize. That means it has to be a meaningful and compact summary of the images, since it has to contain enough information for the classifier to make a good choice in a very small set of values. The reason our final layer retraining can work on new classes is that it turns out the kind of information needed to distinguish between all the 1,000 classes in ImageNet is often also useful to distinguish between new kinds of objects.
> -- *[Tensorflow documentation](https://www.tensorflow.org/tutorials/image_retraining#bottlenecks)*

### Prototype
```
git clone git@github.com:Plippe/tensorflow-bottleneck-web-service.git
make run
```
