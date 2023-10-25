#!/bin/bash
#PBS -l nodes=1:ppn=16
#PBS -l mem=900gb
#PBS -l walltime=71:59:00
#PBS -j oe
#PBS -M weizhi.song@unsw.edu.au
#PBS -m ae

module load megahit/1.2.2b
cd /srv/scratch/z5039045
megahit -1 BH_ER_R1.fastq -2 BH_ER_R2.fastq -r BH_ER_UP_R1.fastq,BH_ER_UP_R2.fastq -o BH_ER_megahit_wd --k-min 57 --k-max 141 --k-step 28 --memory 800 -t 16
