
############################# Install Strainberry with Conda #############################

cd /srv/scratch/z5039045/Softwares
git clone https://github.com/rvicedomini/strainberry.git
cd strainberry
conda env create -n sberry --file environment.yml
conda activate sberry

conda activate sberry
strainberry [options] -r FASTA -b BAM -o OUTPUT_DIR

# add the following line to /home/z5039045/.bashrc
export PATH="/srv/scratch/z5039045/Softwares/strainberry:$PATH"


#################################### run Strainberry #####################################

# FASTA is a strain-oblivious metagenome assembly (e.g., generated with metaFlye) and 
# BAM is a coordinate-sorted long-read alignment in BAM format. 
# Both FASTA and BAM files are expected to be indexed with the samtools faidx and samtools index commands, respectively.


# prepare input files 
module load samtools/1.15
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving/00_reassemble_wd/extracted_reads/flye_reassemble_wd_bin.3_min5000bp
samtools faidx assembly.fasta
samtools index assembly.fasta_sorted.bam


# run strainberry
conda activate sberry
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving/00_reassemble_wd/extracted_reads/flye_reassemble_wd_bin.3_min5000bp
strainberry -r assembly.fasta -b assembly.fasta_sorted.bam -o assembly.fasta_strainberry_wd --nanopore --max-strains 2 --cpus 12

