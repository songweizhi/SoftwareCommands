#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l vmem=100gb
#PBS -l walltime=11:59:00
#PBS -M zzfanyi@gmail.com
#PBS -m ae

#################### BacArena #################### 
cd /srv/scratch/z5095298/sponge_modeling/01_ANI/
module load java/8u45 
java -Xmx32G -jar /srv/scratch/z5095298/software/ANI_batch/OAU.jar -fd /srv/scratch/z5095298/sponge_modeling/01_ANI/DeRep_bins_for_modeling_STY/ -u /srv/scratch/z5095298/software/ANI_batch/usearch_linux
