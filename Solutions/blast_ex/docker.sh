#!/bin/bash

# download sample data
wget http://www.uniprot.org/uniprot/P04156.fasta
wget ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz

# gunzip database file
gunzip zebrafish.1.protein.faa.gz

# pull container
docker pull biocontainers/blast:v2.2.31_cv2

# run BLAST with containers
docker run --rm -v `pwd`:/data -w /data biocontainers/blast:v2.2.31_cv2 makeblastdb -in zebrafish.1.protein.faa -dbtype prot
docker run --rm -v `pwd`:/data -w /data biocontainers/blast:v2.2.31_cv2 blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt
