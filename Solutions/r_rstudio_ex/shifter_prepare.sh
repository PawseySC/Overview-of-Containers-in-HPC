#!/bin/bash --login

module load shifter

# pull container
sg $PAWSEY_PROJECT -c 'shifter pull bskjerven/oz_sc:latest'
