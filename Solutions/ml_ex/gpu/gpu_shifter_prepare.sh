#!/bin/bash --login

module load shifter

# download tutorial files from tensorflow/models on github
wget --no-check-certificate https://raw.githubusercontent.com/tensorflow/models/master/tutorials/image/mnist/BUILD 
wget --no-check-certificate https://raw.githubusercontent.com/tensorflow/models/master/tutorials/image/mnist/__init__.py
wget --no-check-certificate https://raw.githubusercontent.com/tensorflow/models/master/tutorials/image/mnist/convolutional.py

# modify python script to reduce runtime
sed -i 's/NUM_EPOCHS *=.*/NUM_EPOCHS = 1/' convolutional.py

# pull container
sg $PAWSEY_PROJECT -c 'shifter pull tensorflow/tensorflow:1.12.0-gpu'
