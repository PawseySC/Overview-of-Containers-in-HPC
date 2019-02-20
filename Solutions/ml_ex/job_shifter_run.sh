#!/bin/bash --login
  
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=onlinecourse
#SBATCH --reservation=onlinecourse
#SBATCH --job-name=Container_ML
#SBATCH --time=00:10:00
#SBATCH --export=NONE

module load shifter

# run Tensorflow via a container
srun --export=all shifter run tensorflow/tensorflow:1.12.0 python convolutional.py
