
# https://github.com/ParBLiSS/FastANI

# One to One. Compute ANI between single query and single reference genome:
fastANI -q [QUERY_GENOME] -r [REFERENCE_GENOME] -o [OUTPUT_FILE] 

# One to Many. Compute ANI between single query genome and multiple reference genomes:
fastANI -q [QUERY_GENOME] --rl [REFERENCE_LIST] -o [OUTPUT_FILE]
For above use case, REFERENCE_LIST should be a file containing directory paths to reference genomes, one per line.

# Many to Many. When there are multiple query genomes and multiple reference genomes:
fastANI --ql KelpBins_list.txt --rl KelpBins_list.txt -o KelpBins_ANI.txt -t 12

fastANI --ql slaby_MAGs.txt --rl steven_MAGs.txt -o slaby_vs_steven_ANI.txt -t 12


################################### run with Job Script ##################################

#!/bin/bash

#PBS -l nodes=1:ppn=6
#PBS -l mem=60gb
#PBS -l walltime=11:59:00
#PBS -j oe
#PBS -M weizhi.song@unsw.edu.au
#PBS -m ae

module load fastani/1.1
cd /srv/scratch/z5039045/fastani_test
fastANI -q NorthSea_bin029.fasta -r NorthSea_bin034.fasta -o ANI_value.txt --minFrag 1 -t 6

cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26/reference_genomes_renamed
fastANI -q AS.fna -r SB.fna -o ANI_AS_SB.txt --minFrag 1 -t 6


module load fastani/1.1
cd /srv/scratch/z5039045/test
fastANI --refList ref_file_list.txt --ql mag_file_list.txt -o test.txt --minFrag 1 -t 12


module unload fastani
module load fastani/1.1
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI_Oral
fastANI -q 3_Oral_refined_MAGs/Oral_70.fasta -r 3_Oral_refined_MAGs/Oral_72.fasta -o ANI_Oral_70_vs_Oral_72.txt --minFrag 1
fastANI -q 3_Oral_refined_MAGs/Oral_70.fasta -r oral_799_ref_genomes/OTU_97.39115.0.fa -o ANI_Oral_70_vs_ref.txt --minFrag 1
fastANI -q 3_Oral_refined_MAGs/Oral_72.fasta -r oral_799_ref_genomes/OTU_97.39115.0.fa -o ANI_Oral_72_vs_ref.txt --minFrag 1


module load fastani/1.32
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI_Oral
fastANI -q 3_Oral_refined_MAGs/Oral_70.fasta -r 3_Oral_refined_MAGs/Oral_72.fasta -o ANI_Oral_70_vs_Oral_72.txt


fastANI -q GCA_014729335.1.gtdb.fna -r GCA_016292335.1.gtdb.fna -o 000.txt

cd /home-user/wzsong/test
fastANI -q GCA_015521515.1.gtdb.fna -r GCA_015522845.1.gtdb.fna -o 000.txt --minFrag 1
fastANI -q GCA_015521515.1.gtdb.fna -r GCA_015522845.1.gtdb.fna -o 000.txt --minFrag 1 --fragLen 2000

fastANI -q GCA_003009755.1.gtdb.fna -r GCA_016839515.1.gtdb.fna -o 111.txt --minFrag 1 --fragLen 1500
fastANI -q GCA_003009755.1.gtdb.fna -r GCA_016839515.1.gtdb.fna -o 111.txt --minFrag 1 --fragLen 1000








