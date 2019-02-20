# Gromacs

__Notes:__ To run this example you will need a GPU enable computer with `nvidia-docker`, or otherwise access to the _Zeus_ system at Pawsey.  
You will also need to register on https://ngc.nvidia.com and then follow the instructions to generate a API key. 
This information will be required when executing the `pull` command.

Let us run a basic molecular dynamics toy simulation, using a Gromacs container as provided in the Nvidia GPU Cloud.  


wget -c ftp://ftp.gromacs.org/pub/benchmarks/water_GMX50_bare.tar.gz
tar xzf water_GMX50_bare.tar.gz
cp water-cut1.0_GMX50_bare/1536/* .


sg $PAWSEY_PROJECT -c 'shifter pull --login nvcr.io/hpc/gromacs:2018.2'


srun --export=all shifter run nvcr.io/hpc/gromacs:2018.2 gmx grompp -f pme.mdp


export GPU_COUNT=1
export OMP_NUM_THREADS=1

srun --export=all shifter run nvcr.io/hpc/gromacs:2018.2 \
    gmx mdrun \
    -ntmpi ${GPU_COUNT} \
    -nb gpu \
    -pin on \
    -v \
    -noconfout \
    -nsteps 5000 \
    -s topol.tpr \
    -ntomp $OMP_NUM_THREADS