# Machine Learning

Note on Shifter: we recommend to perform the preparation steps (download, pull) on the login node, 
and use a job script just for the actual compute part.

Let us perform a simple machine learning benchmarking application using the popular ML framework Tensorflow.

First, download a sample tutorial from the Tensorflow Models repo on Github:

```
wget --no-check-certificate https://raw.githubusercontent.com/tensorflow/models/master/tutorials/image/mnist/BUILD 
wget --no-check-certificate https://raw.githubusercontent.com/tensorflow/models/master/tutorials/image/mnist/__init__.py
wget --no-check-certificate https://raw.githubusercontent.com/tensorflow/models/master/tutorials/image/mnist/convolutional.py
```

To keep the running time reasonably short, modify the file `convolutional.py` by setting `NUM_EPOCS` to `1`. You can use a text editor, or the `sed` command:

`sed -i 's/NUM_EPOCHS *=.*/NUM_EPOCHS = 1/' convolutional.py`

Now, `pull` the following container from DockerHub, with either Docker or Shifter depending on the system you're using:
* tensorflow/tensorflow

You are all setup for running your machine learning training!  
Use the `run` options of Docker/Shifter to execute

`python convolutional.py`

Note: when using Docker, don't forget to use the flags `-v` and `-w` to mount your host directory and use it as the working directory; failure to do so will result in input/output file errors.
