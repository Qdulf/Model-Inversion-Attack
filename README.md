# Model-Inversion-Attack

This a TensorFlow Implementation of the Model Inversion Attack introduced with [Model Inversion Attacks that Exploit Confidence Information and Basic Countermeasures](https://dl.acm.org/citation.cfm?id=2813677) (Fredrikson Et al.)

The gradient step and the final output of the attack loop is pre-processed with ZCA whitening and Global Contrast Normalization with Pylearn2, this helps to preserve the facial features present in the input dataset. 

Because of tricky dependencies and the need to build pylearn2 yourself, the notebook has been converted to a docker-container.
The project can be build like this:
```bash
docker build -t mia . -f Dockerfile
```
and run as a tensorflow/jupyter-notebook:
```bash
docker run -it -p 8888:8888 mia
````

# Directions to Use 

1. ~Download the AT&T Face Dataset from [here](http://www.cl.cam.ac.uk/research/dtg/attarchive/facedatabase.html)~
2. ~Extract the dataset and replace the path variable in the 3rd cell of the inversion notebook.~

The dataset is no longer available on the aforementioned website and has been added to this repository. The dataset was preserved and downloaded from [Mohamed Elsayed@github](https://github.com/mohamed-elsayed-mohamed/Face-Recognition).

Thanks to AT&T Laboratories Cambridge for providing this dataset.
