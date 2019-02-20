# BLAST

Note on Shifter: we recommend to perform the preparation steps (download, pull) on the login node, 
and use a job script just for the actual compute part.

You are going to perform a basic BLASTing using sample dataset and databases from the internet. First, download both these files and unzip the zebrafish database
(hint: use `wget` and `gunzip` for these two operations):
* http://www.uniprot.org/uniprot/P04156.fasta
* ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz 

Then, you will need to `pull` a BLAST container from DockerHub, with either Docker or Shifter depending on the system you're using:
* biocontainers/blast:v2.2.31_cv2

Now you can use the `run` options of Docker/Shifter to perform the required steps:
1. `makeblastdb -in zebrafish.1.protein.faa -dbtype prot`
1. `blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt`

Note: when using Docker, don't forget to use the flags `-v` and `-w` to mount your host directory and use it as the working directory; failure to do so will result in input/output file errors.
