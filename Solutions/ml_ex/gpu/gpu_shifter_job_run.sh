#!/bin/bash --login
  
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=onlinecourse
#SBATCH --reservation=onlinecourse
#SBATCH --partition=gpuq
#SBATCH --gres=gpu:1
#SBATCH --job-name=Container_ML_GPU
#SBATCH --time=00:10:00
#SBATCH --export=NONE

module load shifter

# run Tensorflow via a container
srun --export=all shifter run tensorflow/tensorflow:1.12.0-gpu python convolutional.py
