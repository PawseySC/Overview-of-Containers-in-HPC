# Blast

You are going to perform a basic BLASTing using sample dataset and databases from the internet:
* http://www.uniprot.org/uniprot/P04156.fasta
* ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz

Then, you will need to `pull` a BLAST container, with either Docker or Shifter depending on the system you're using:
* biocontainers/blast:v2.2.31_cv2

Now you can use the `run` options of Docker/Shifter to perform the required steps:
* `makeblastdb -in zebrafish.1.protein.faa -dbtype prot`
* `blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt`

Note: when using Docker, don't forget to mount a host directory, or your outputs will be lost!