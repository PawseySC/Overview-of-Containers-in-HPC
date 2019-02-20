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
srun --export=all shifter run nvcr.io/hpc/gromacs:2018.2 gmx grompp -f pme.mdp

# Run Gromacs MD with container
srun --export=all shifter run nvcr.io/hpc/gromacs:2018.2 \
    gmx mdrun -ntmpi 1 -nb gpu -pin on -v -noconfout -nsteps 5000 -s topol.tpr -ntomp 1
