
##########################################################################################
################################# install BLCA on Katana #################################
##########################################################################################

module load python/3.7.3
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate
pip3 install --upgrade BioSAK

# Download BLCA scripts to Katana (change zID to yours)
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/qunfengdong/BLCA.git




##########################################################################################
############################### prepare SILVA SSU database ###############################
##########################################################################################

###################### on Katana ######################

# download and decompress SILVA SSU database
cd /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138/Exports/SILVA_138_SSURef_NR99_tax_silva.fasta.gz
gunzip SILVA_138_SSURef_NR99_tax_silva.fasta.gz

# Prepare BLCA-compatible SILVA SSU database with BioSAK
module load python/3.7.3
source ~/mypython3env/bin/activate
BioSAK SILVA_for_BLCA -SILVA_ssu SILVA_138_SSURef_NR99_tax_silva.fasta
# output files:
# SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta
# SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy

# format the fasta file
module load blast+/2.9.0
makeblastdb -in SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -dbtype nucl -parse_seqids -out SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta


###################### on MAC ######################

# download and decompress SILVA SSU database
mkdir ~/BLCA/db_SILVA_SSU
cd ~/BLCA/db_SILVA_SSU
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138/Exports/SILVA_138_SSURef_NR99_tax_silva.fasta.gz
gunzip SILVA_138_SSURef_NR99_tax_silva.fasta.gz

# Prepare BLCA-compatible SILVA SSU database with BioSAK
BioSAK SILVA_for_BLCA -SILVA_ssu SILVA_138_SSURef_NR99_tax_silva.fasta

# format the fasta file
makeblastdb -in SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -dbtype nucl -parse_seqids -out SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta




##########################################################################################
########################### run BLCA against SILVA SSU database ##########################
##########################################################################################

###################### on Katana ######################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load blast+/2.9.0
module load muscle/3.8.31
module load clustalo/1.2.4
cd /srv/scratch/z5039045/Softwares/BLCA/wd_tmp
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy -q /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -i test.fasta

python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy -q /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -i linked_to_Refined_26.fa
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy -q /srv/scratch/z5039045/Softwares/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -i linked_to_Refined_37.fa


###################### on MAC ######################

python3 ~/BLCA/2.blca_main.py -r ~/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy -q ~/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -i test.fasta


