#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l vmem=120gb
#PBS -l walltime=23:59:00
#PBS -j oe
#PBS -M weizhi.song@student.unsw.edu.au
#PBS -m ae

module load python/2.7.9
cd /srv/scratch/z5039045/error_model/5_GemErr

python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemErr.py -r 260 -f scaffold_lt2500.fa -s Y2591.sam -n customized_2_250 -i 5 -p
