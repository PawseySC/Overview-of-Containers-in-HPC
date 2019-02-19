# R/RStudio

Note on Shifter: we recommend to perform the preparation steps (download, pull) on the login node, 
and use a job script just for the actual compute part.


## Command line mode

You are going to run an R script using a pre-made R container.  
For the curious ones, the `Dockerfile` used to build the container is provided in the corresponding sub-directory.

`pull` the following container from DockerHub, with either Docker or Shifter depending on the system you're using:
* bskjerven/oz_sc:latest
  
Now use the `run` options of Docker/Shifter to execute
* `Rscript SC_Rscript.r`


## Web server

Finally, you can give a try with launching a local RStudio webserver through a container (Docker only).  
This is the required syntax: 
* `docker run --rm -d -p 8787:8787 -e PASSWORD=yourfavouritepassword -v $(pwd):/home/rstudio/data --name rstudio bskjerven/oz_sc:latest`

Open a web browser and go to
* http://localhost:8787

Have fun with RStudio! For instance you can try and re-run the sample analysis from in there.

When you are done, stop the container with 
* `docker stop rstudio`