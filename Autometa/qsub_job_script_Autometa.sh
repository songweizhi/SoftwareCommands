#!/bin/bash

#PBS -l nodes=1:ppn=12
#PBS -l vmem=90gb
#PBS -l walltime=11:59:00
#PBS -j oe
#PBS -M weizhi.song@student.unsw.edu.au
#PBS -m ae

module unload intel/11.1.080 
module add intel/17.0.4.196
module load python/2.7.15
module load prodigal/2.6.3
module load hmmer/3.1b2
module load diamond/0.9.10  
module load bowtie/2.3.2  
module load samtools/1.7
module load bedtools/2.27.1
module load openblas/0.2.8
cd /srv/scratch/z5039045/Softwares/autometa/pipeline
export PATH=/srv/scratch/z5039045/Softwares/autometa/pipeline:$PATH
cd ~
. mypythonenv_autometa/bin/activate

cd /srv/scratch/z5039045/Softwares/autometa/test_data_one_step
run_autometa.py --assembly scaffolds.fasta --processors 12 --length_cutoff 3000 --maketaxtable --ML_recruitment
cluster_process.py --bin_table ML_recruitment_output.tab --column ML_expanded_clustering --fasta scaffolds.fasta --do_taxonomy --db_dir /srv/scratch/z5039045/DB --output_dir cluster_process_output

