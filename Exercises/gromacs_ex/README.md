# Gromacs

__Notes:__ To run this example you will need a GPU enable computer with `nvidia-docker`, or otherwise access to the _Zeus_ system at Pawsey.  
You will also need to register on https://ngc.nvidia.com and then follow the instructions to generate a API key. 
This information will be required when executing the `pull` command.

Let us run a molecular dynamics toy simulation, using a Gromacs container as provided in the Nvidia GPU Cloud.  

First, download and uncompress some sample input files from the Gromacs website (hint: you can use the `wget` and `tar` tools):
* ftp://ftp.gromacs.org/pub/benchmarks/water_GMX50_bare.tar.gz

We are going to use a specific input for this exercise:

`cp water-cut1.0_GMX50_bare/1536/* .`

Now `pull` the Gromacs container from NVIDIA GPU Cloud:
* nvcr.io/hpc/gromacs:2018.2

With Shifter on _Zeus_ you will need to use the `--login` flag and then provide the NGC credentials when prompted to:

`sg $PAWSEY_PROJECT -c 'shifter pull --login nvcr.io/hpc/gromacs:2018.2'`

Now, write a SLURM script to execute the following Gromacs steps through the container:

```
gmx grompp -f pme.mdp

gmx mdrun -ntmpi 1 -nb gpu -pin on -v -noconfout -nsteps 5000 -s topol.tpr -ntomp 1
```

With SLURM on _Zeus_, you will need extra SBATCH directives to use the _gpuq_ queue and request GPU resources (see template).
