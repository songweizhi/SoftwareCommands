
###################################### Installation ######################################

# please change zid below

# cd /srv/scratch/z1234567/Softwares
# wget https://github.com/jotech/gapseq/archive/refs/tags/v1.2.tar.gz
# tar xzvf gapseq-1.2.tar.gz
# cd gapseq-1.2

module purge
module load git/2.22.0
module load perl/5.28.0
module load blast+/2.11.0
module load bedtools/2.27.1
module load hmmer/3.3
module load barrnap/0.9
module load exonerate/2.2.0
module load parallel/20200722
module load glpk/4.65
module load bioconductor/3.12
module load gapseq/1.2
module load R/3.6.1
R
install.packages(c("data.table", "stringr", "sybil", "getopt", "reshape2", "doParallel", "foreach", "R.utils", "stringi", "glpkAPI"))
install.packages(c("CHNOSZ"))
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install("Biostrings")


####################################### run gapseq #######################################

module purge
module load git/2.22.0
module load perl/5.28.0
module load blast+/2.11.0
module load bedtools/2.27.1
module load hmmer/3.3
module load barrnap/0.9
module load exonerate/2.2.0
module load parallel/20200722
module load glpk/4.65
module load bioconductor/3.12
module load gapseq/1.2
module load R/3.6.1
gapseq test


################### run your own gapseq so you can modify its db files ###################

module purge
module load git/2.22.0
module load perl/5.28.0
module load blast+/2.11.0
module load bedtools/2.27.1
module load hmmer/3.3
module load barrnap/0.9
module load exonerate/2.2.0
module load parallel/20200722
module load glpk/4.65
module load bioconductor/3.12
module load R/3.6.1
/srv/scratch/z5039045/Softwares/gapseq-1.2/gapseq test


##########################################################################################

cd /srv/scratch/z5039045/detectCFP_wd

/srv/scratch/z5039045/Softwares/gapseq-1.2/gapseq find -p all -n -t Bacteria -b 100 -c 70 -l all gnms_with_CFP/3300027364_2.fna > 3300027364_2-all-all-stdout.tbl
/srv/scratch/z5039045/Softwares/gapseq-1.2/gapseq find -p all -n -t Bacteria -b 100 -c 70 -l custom gnms_with_CFP/3300027364_2.fna > 3300027364_2-all-custom-stdout.tbl
/srv/scratch/z5039045/Softwares/gapseq-1.2/gapseq find -p all -n -t Bacteria -b 100 -c 70 -l custom gnms_with_CFP/3300027364_2.fna > 3300027364_2-all-custom-stdout.tbl


/srv/scratch/z5039045/Softwares/gapseq-1.2/gapseq find -p all -n -t Bacteria -b 100 -c 70 -l custom gnms_with_CFP/3300027364_2.fna




/srv/scratch/z5039045/Softwares/gapseq-1.2/gapseq find -p all -n -U -t Archaea -b 100 -c 70 -l all ./AqS1.fasta




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


