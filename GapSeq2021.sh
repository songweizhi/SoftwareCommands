
###################################### Installation ######################################

# Manual page: https://gapseq.readthedocs.io/en/latest/install.html

module load git/2.22.0
mkdir /srv/scratch/z5039045/Softwares/gapseq
cd /srv/scratch/z5039045/Softwares/gapseq
git clone https://github.com/jotech/gapseq


# install R packages
module load R/3.6.1
R
install.packages(c("data.table", "stringr", "sybil", "getopt", "reshape2", "doParallel", "foreach", "R.utils", "stringi", "glpkAPI"))
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install("Biostrings")


############################# Jobscript for running GapSeq ###############################

module load R/3.6.1
module load perl/5.28.0
module load git/2.22.0
module load bedtools/2.27.1
module load blast+/2.9.0
module load hmmer/3.3
module load glpk/4.65
module load barrnap/0.9
module load gcc/7.3.0
module load exonerate/2.2.0
module load parallel/20190522
module load cplex/12.9.0-academic  

/srv/scratch/z5039045/Softwares/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna


# # New:
# cd /srv/scratch/z5039045/gapseq_test
# /srv/scratch/z5039045/Softwares/gapseq/gapseq find -p all -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna
# /srv/scratch/z5039045/Softwares/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna
# 
# cd /srv/scratch/z5039045/gapseq_test
# /srv/scratch/z5039045/Softwares/gapseq_test/gapseq find -n -p all -b 100 -c 70 -l all -y APA_bin_6.fna
# 
# 
# # Test
# cd /srv/scratch/z5039045/GapSeq_Sponge_and_Coral_MAGs/Test_GapSeq
# /srv/scratch/z5039045/Softwares/gapseq_test_cluster/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y APA_bin_2.fna
# cd /srv/scratch/z5039045/GapSeq_Sponge_and_Coral_MAGs/Test_GapSeq
# /srv/scratch/z5039045/Softwares/gapseq_test_cluster/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y APA_bin_6.fna
# 
# 
# # test with customized pathways
# cd /srv/scratch/z5039045/gapseq_test
# /srv/scratch/z5039045/Softwares/gapseq_test/gapseq find -p all -b 100 -c 70 -l all -y -n APA_bin_6.fna
# 
# 
# 
# 
# 
# 
# 
# module load python/3.7.3
# module load perl/5.28.0
# module load blast+/2.9.0
# module load hmmer/3.3
# module load prodigal/2.6.3
# module load git/2.22.0
# module load bedtools/2.27.1
# module load glpk/4.65
# module load barrnap/0.9
# module load gcc/7.3.0
# module load exonerate/2.2.0
# module load parallel/20190522
# module unload R
# module load R/3.6.1
# module load cplex/12.9.0-academic  
# cd /srv/scratch/z5039045/Softwares/gapseq2021
# ./gapseq find -p amino toy/myb71.fna
# ./gapseq find -p amino -t Archaea toy/myb71.fna
# 

