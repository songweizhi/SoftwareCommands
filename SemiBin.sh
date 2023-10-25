
################################# install SemiBin on Mac #################################

conda create -n SemiBin
conda activate SemiBin
conda install -c conda-forge -c bioconda semibin
conda install -c conda-forge -c bioconda mmseqs2=13.45111
conda install -c bioconda bedtools hmmer prodigal
conda install -c bioconda fraggenescan
conda deactivate

# prepare db files
mmseqs databases GTDB GTDB SemiBin_GTDB_r207
--reference-db-data-dir /Users/songweizhi/SemiBin_GTDB_r207/SemiBin_GTDB_r207

cd /Users/songweizhi/DB/SemiBin_GTDB_207
mmseqs databases GTDB gtdb tmp

################################### run SemiBin on Mac ###################################

# SemiBin runs on single-sample, co-assembly and multi-sample binning.

# single_easy_bin includes the following steps: 
# generate_cannot_links
# generate_sequence_features_single
# bin

# multi_easy_bin includes the following steps: 
# generate_cannot_links
# generate_sequence_features_multi
# bin

# Easy single binning mode
conda activate SemiBin
cd /Users/songweizhi/Desktop/SemiBin_wd
SemiBin single_easy_bin -i assembly_min2500.fasta -b assembly_min2500_sorted.bam -r /Users/songweizhi/SemiBin_GTDB_r207 -o SemiBin_op_none
SemiBin single_easy_bin -i assembly_min2500.fasta -b assembly_min2500_sorted.bam -r /Users/songweizhi/SemiBin_GTDB_r207 --environment ocean -o SemiBin_op_ocean
SemiBin single_easy_bin -i assembly_min2500.fasta -b assembly_min2500_sorted.bam -r /Users/songweizhi/SemiBin_GTDB_r207 --environment global -o SemiBin_op_global

########################## install SemiBin on Katana with Conda ##########################

conda create -n SemiBin_env
conda activate SemiBin_env
conda install -c conda-forge -c bioconda semibin



################################ install SemiBin on Katana ###############################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load mmseqs2/13-45111
module load bedtools/2.27.1 
module load hmmer/3.3
module load prodigal/2.6.3 
module load fraggenescan/1.31

pip uninstall torch
pip install torch==1.7.1
pip3 install SemiBin
pip3 install --upgrade SemiBin

# with conda
conda config --remove channels conda-forge
conda config --remove channels salford_systems
conda config --remove channels bonsai-team
conda create -n SemiBin
conda activate SemiBin
conda install -c conda-forge -c bioconda semibin

########## download GTDB database ##########

# Download an mmseqs-formatted GTDB (the command `mmseqs databases GTDB GTDB tmp` will download the latest version). 
# Then, point SemiBin to this database using the `--reference-db-data-dir/-r` option.

conda activate SemiBin
module load mmseqs2/13-45111
module load bedtools/2.27.1 
module load hmmer/3.3
module load prodigal/2.6.3 
module load fraggenescan/1.31

# this download.sh has been modified to bypass some bugs, this step takes about one hour
cd /srv/scratch/z5039045/DB/SemiBin_GTDB_207
./db_file_backup/download.sh GTDB GTDB tmp


# Input taxonomy database "/srv/scratch/z5039045/DB/SemiBin_GTDB_r207_test/GTDB" is missing files:
# - /srv/scratch/z5039045/DB/SemiBin_GTDB_r207_test/GTDB_mapping
# - /srv/scratch/z5039045/DB/SemiBin_GTDB_r207_test/GTDB_nodes.dmp
# - /srv/scratch/z5039045/DB/SemiBin_GTDB_r207_test/GTDB_names.dmp
# - /srv/scratch/z5039045/DB/SemiBin_GTDB_r207_test/GTDB_merged.dmp


cd /srv/scratch/z5039045/DB/SemiBin_GTDB_207_test
mmseqs databases GTDB GTDB tmp --force-reuse 1


################################## run SemiBin on Katana #################################

conda activate SemiBin
module load mmseqs2/13-45111
module load bedtools/2.27.1 
module load hmmer/3.3
module load prodigal/2.6.3 
module load fraggenescan/1.31

cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd12_flye_wd
SemiBin single_easy_bin -t 12 -i assembly_min2500.fasta -b assembly_min2500_sorted.bam -r /srv/scratch/z5039045/DB/SemiBin_GTDB_207 -o SemiBin_op_none
SemiBin single_easy_bin -t 12 -i assembly_min2500.fasta -b assembly_min2500_sorted.bam -r /srv/scratch/z5039045/DB/SemiBin_GTDB_207 --environment ocean -o SemiBin_op_ocean
SemiBin single_easy_bin -t 12 -i assembly_min2500.fasta -b assembly_min2500_sorted.bam -r /srv/scratch/z5039045/DB/SemiBin_GTDB_207 --environment global -o SemiBin_op_global
SemiBin single_easy_bin -t 12 -i assembly_min2500.fasta -b assembly_min2500_sorted.bam -r /srv/scratch/z5039045/DB/SemiBin_GTDB_207 --environment global -o SemiBin_op_global_2
SemiBin single_easy_bin -t 12 -i assembly_min2500.fasta -b assembly_min2500_sorted.bam --environment ocean -o SemiBin_op_ocean2


####################################### Nan Xiang ########################################

SemiBin2 single_easy_bin -i S1_assembly_min2000.fasta -b S1_assembly_min2000_sorted.bam --environment ocean -o S1_SemiBin_output
SemiBin2 single_easy_bin -i S2_assembly_min2000.fasta -b S2_assembly_min2000_sorted.bam --environment ocean -o S2_SemiBin_output
SemiBin2 single_easy_bin -i S3_assembly_min2000.fasta -b S3_assembly_min2000_sorted.bam --environment ocean -o S3_SemiBin_output
































