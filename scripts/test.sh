#!/bin/sh

#PBS -N feat-extract
#PBS -q main 
#PBS -l nodes=1:ppn=16
#PBS -m abe
#PBS -l walltime=168:00:00
#PBS -k oe
#PBS -o /home2/tb23aau/output.log
#PBS -e /home2/tb23aau/error.log



echo "Job started on `date`"
echo "Running on node(s):"
cat $PBS_NODEFILE

pip install ipython
pip install nltk
pip install spacy
python -m spacy download en_core_web_sm
pip install pandas 

# Your commands here
python feature_extraction.py

echo "Job ended on `date`"
