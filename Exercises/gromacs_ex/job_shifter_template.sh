#!/bin/bash --login
  
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=onlinecourse
#SBATCH --reservation=courseq
#SBATCH --partition=gpuq
#SBATCH --gres=gpu:1
#SBATCH --job-name=Container_Gromacs
#SBATCH --time=01:00:00
#SBATCH --export=NONE

module load shifter

# run Gromacs preliminary step with container
srun --export=all 

# Run Gromacs MD with container
srun --export=all 
