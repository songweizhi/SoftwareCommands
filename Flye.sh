
module load python/3.7.3
module load flye/2.9 

cd /srv/scratch/z5039045/Adaptive_Nanopore
flye --meta -t 12 -o combined_pass_flye_wd --nano-raw combined_pass.fastq


# Marwan
flye --nano-raw /path to file/XXX.fastq --out-dir /path to putput/name_of_file --threads 4 --meta --trestle --asm-coverage 50 --genome-size 5m


# run quast
module load python/3.7.3
module load perl/5.28.0
module load quast/5.0.2
quast.py assemblies.fas -o assemblies.fas.quast --threads 12 




# Flye package includes some third-party software:
# libcuckoo
# intervaltree
# lemon
# minimap2
# samtools


