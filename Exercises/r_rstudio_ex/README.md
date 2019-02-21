# R/RStudio

Note on Shifter: we recommend to perform the preparation steps (download, pull) on the login node, 
and use a job script just for the actual compute part.


## Command line mode

We'll get started with containerised R using a minimalistic example taken from the workshop [Programming with R](http://swcarpentry.github.io/r-novice-inflammation/) by the Software Carpentry.  
The script `readings-06.R` from their [Episode 5](http://swcarpentry.github.io/r-novice-inflammation/05-cmdline/index.html) is made available here for convenience.

Download and unzip the sample dataset from (hint: use `wget` and `unzip` to this end):
* http://swcarpentry.github.io/r-novice-inflammation/data/r-novice-inflammation-data.zip

Now, `pull` the `rstudio` container provided by the _Rocker Project_ on DockerHub, with either Docker or Shifter depending on the system you're using::
* rocker/rstudio:3.5.1

You can now run `readings-06.R` through container with the `run` options of Docker/Shifter:

`Rscript readings-06.R --mean data/inflammation-*.csv`

Note: when using Docker, don't forget to use the flags `-v` and `-w` to mount your host directory and use it as the working directory; failure to do so will result in input/output file errors.


## Bioinformatics with R: single cell 

Let us dive into single cell genomics with R, by using a pre-made R container.  
All relevant files are in the sub-directory `SingleCell`.  
For the curious ones, the `Dockerfile` used to build the container is provided in the corresponding sub-sub-directory.

`pull` the following container from DockerHub, with either Docker or Shifter depending on the system you're using:
* bskjerven/oz_sc:latest
  
Now use the `run` options of Docker/Shifter to execute

`Rscript SC_Rscript.r`

Note: when using Docker, don't forget to use the flags `-v` and `-w` to mount your host directory and use it as the working directory; failure to do so will result in input/output file errors.


## Web server

Finally, you can give a try with launching a local RStudio webserver through a container (Docker only).  
This is the required syntax: 

`docker run --rm -d -p 8787:8787 -e PASSWORD=yourfavouritepassword -v $(pwd):/home/rstudio/data --name rstudio bskjerven/oz_sc:latest`

Open a web browser and go to
* http://localhost:8787

Have fun with RStudio! For instance you can try and re-run the analyses above from in here.

When you are done, stop the container with 

`docker stop rstudio`

__Notes__ on the flags for RStudio
* `-d` runs the container in daemon (i.e. background) mode
* `-p` maps communication ports between host and container; in this case an open port is required to access the container through a web browser
* `-e` sets an environment variable inside the container
