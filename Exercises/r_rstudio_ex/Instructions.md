# R/RStudio

Note on Shifter: we recommend to perform the preparation steps (download, pull) on the login node, 
and use a job script just for the actual compute part.

You are going to run an R script using a pre-made R container.  
For the curious ones, the `Dockerfile` used to build the container is provided in the corresponding sub-directory.

`pull` the following container from DockerHub, with either Docker or Shifter depending on the system you're using:
* bskjerven/oz_sc:latest
  
Now use the `run` options of Docker/Shifter to execute `Rscript SC_Rscript.r`
