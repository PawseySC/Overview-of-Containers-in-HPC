#!/bin/bash --login

module load shifter

# download sample data
wget http://www.uniprot.org/uniprot/P04156.fasta
wget ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz

# gunzip database file
gunzip zebrafish.1.protein.faa.gz

# pull container
sg $PAWSEY_PROJECT -c 'shifter pull biocontainers/blast:v2.2.31_cv2'
