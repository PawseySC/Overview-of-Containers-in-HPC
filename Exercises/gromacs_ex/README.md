# Gromacs

__Notes:__ To run this example you will need a GPU enable computer with `nvidia-docker`, or otherwise access to the _Zeus_ system at Pawsey.  
You will also need to register on https://ngc.nvidia.com and then follow the instructions to generate a API key. 
This information will be required when executing the `pull` command.

Let us run a basic molecular dynamics toy simulation, using a Gromacs container as provided in the Nvidia GPU Cloud.  


sg $PAWSEY_PROJECT -c 'shifter pull --login nvcr.io/hpc/gromacs:2018.2'




