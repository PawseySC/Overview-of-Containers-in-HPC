# Machine Learning

Note on Shifter: we recommend to perform the preparation steps (download, pull) on the login node, 
and use a job script just for the actual compute part.


## Running on CPUs

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
* tensorflow/tensorflow:1.12.0

You are all setup for running your machine learning training!  
Use the `run` options of Docker/Shifter to execute

`python convolutional.py`

Note: when using Docker, don't forget to use the flags `-v` and `-w` to mount your host directory and use it as the working directory; failure to do so will result in input/output file errors.


## Running on GPUs

__Note:__ To run this example you will need a GPU enabled computer with `nvidia-docker`, or otherwise access to the _Zeus_ system at Pawsey.  

It's the time to `pull` the GPU version of the Tensorflow container:
* tensorflow/tensorflow:1.12.0-gpu

You can now run the same sample input as above with this GPU enabled container.  
With SLURM on _Zeus_, you will need extra SBATCH directives to use the _gpuq_ queue and request GPU resources (see dedidcated template).
