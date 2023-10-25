
##########################################################################################
################################# install BLCA on Katana #################################
##########################################################################################

# Log into katana
ssh z1234567@katana.restech.unsw.edu.au -o "ServerAliveInterval 10"

# Start an interactive job (running programs on Katana head node is not allowed)
qsub -I -l nodes=1:ppn=12,mem=60gb,walltime=11:59:00

# cd to the folder where you want to have BLCA installed, 
software_folder='/srv/scratch/z5039045/Softwares'
cd $software_folder
git clone https://github.com/qunfengdong/BLCA.git


# install BioSAK, for db file formatting
module load python/3.7.3
mkdir ~/mypython3env_BioSAK
python3 -m venv --system-site-packages ~/mypython3env_BioSAK
source ~/mypython3env_BioSAK/bin/activate
pip3 install --upgrade BioSAK


##########################################################################################
############################# prepare GTDB SSU database (r95) ############################
##########################################################################################

###################### on Katana ######################

software_folder='/srv/scratch/z5039045/Softwares'

# make a db folder
cd $software_folder/BLCA
mkdir db_GTDB_SSU
cd db_GTDB_SSU

# download ssu_all_r95.tar.gz and upload it to db_GTDB_SSU
# Here is the link: https://data.gtdb.ecogenomic.org/releases/release95/95.0/genomic_files_all/ssu_all_r95.tar.gz

# decompress ssu_all_r95.tar.gz
tar xvzf ssu_all_r95.tar.gz

# format downloaded sequences with BioSAK
module load python/3.7.3
source ~/mypython3env_BioSAK/bin/activate
BioSAK GTDB_for_BLCA -GTDB_ssu ssu_all_r95.fna
# output files in this step:
# ssu_all_r95_BLCAparsed.fasta
# ssu_all_r95_BLCAparsed.taxonomy

# make blast db with formatted sequences
module load blast+/2.11.0
makeblastdb -in ssu_all_r95_BLCAparsed.fasta -dbtype nucl -parse_seqids -out ssu_all_r95_BLCAparsed.fasta


###################### on MAC ######################

cd 00_DataNeeded/BLCA/db_GTDB_SSU

# download ssu_all_r95.tar.gz and move it to 00_DataNeeded/BLCA/db_GTDB_SSU
# Here is the link: https://data.gtdb.ecogenomic.org/releases/release95/95.0/genomic_files_all/ssu_all_r95.tar.gz

# decompress ssu_all_r95.tar.gz
tar xvzf ssu_all_r95.tar.gz

# make the format of ssu_all_r95.fna compatible with BLCA (using BioSAK)
# Note: you can install BioSAK with "pip3 install BioSAK"
BioSAK GTDB_for_BLCA -GTDB_ssu ssu_all_r95.fna
# output files:
# ssu_all_r95_BLCAparsed.fasta
# ssu_all_r95_BLCAparsed.taxonomy

# make blast db
makeblastdb -in ssu_all_r95_BLCAparsed.fasta -dbtype nucl -parse_seqids -out ssu_all_r95_BLCAparsed.fasta


##########################################################################################
########################### run BLCA against GTDB SSU database ##########################
##########################################################################################

###################### on Katana ######################

module load blast+/2.11.0
module load muscle/3.8.31
module load clustalo/1.2.4

blca_main_py='/srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py'
gtdb_ssu_taxon='/srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.taxonomy'
gtdb_ssu_seq='/srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.fasta' 

cd /srv/scratch/z5039045/GTDB_SSU_test
python3 $blca_main_py -r $gtdb_ssu_taxon -q $gtdb_ssu_seq -p 12 -i Cym-zOTUs_subset.fasta
python3 $blca_main_py -r $gtdb_ssu_taxon -q $gtdb_ssu_seq -p 12 -i BH_ER_050417_assembled_16S_uclust_0.999.fasta


###################### on MAC ######################

python3 00_DataNeeded/BLCA/2.blca_main.py -r 00_DataNeeded/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.taxonomy -q 00_DataNeeded/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.fasta -i 10_UchimeReferenceGTDB/zOTU_nc.fasta -o 12_TaxAssignmentGTDB_BLCA/AllSamples_unoise_BLCA_out.1.txt

