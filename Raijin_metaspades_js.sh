#!/bin/bash
#PBS -P du5
#PBS -q hugemem
#PBS -l ncpus=14,walltime=11:59:00,mem=300GB
#PBS -l wd
#PBS -M songwz03@163.com
#PBS -m ae

module load python3/3.5.2
python3 /short/du5/wzs561/Software/SPAdes-3.13.0-Linux/bin/metaspades.py --only-assembler -t 14 -s combined_reads.fasta -o combined_reads_k21-125 -k 21,33,55,77,99,127
