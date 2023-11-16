
############################## install checkm on HKUST hpc3 ##############################

module load anaconda3
conda create -n checkm python=3.9
conda activate checkm
conda install -c bioconda numpy matplotlib pysam
conda install -c bioconda hmmer prodigal pplacer
pip3 install checkm-genome

# setup checkm database
mkdir /scratch/PI/ocessongwz/DB/checkm
checkm data setRoot /scratch/PI/ocessongwz/DB/checkm
cd /scratch/PI/ocessongwz/DB/checkm
wget https://data.ace.uq.edu.au/public/CheckM_databases/checkm_data_2015_01_16.tar.gz
tar xzvf checkm_data_2015_01_16.tar.gz 

# checkm is ready for running now

################################ run checkm on HKUST hpc3 ################################

module load anaconda3
source activate checkm
cd /scratch/PI/ocessongwz/Sponge_2023_12_01
checkm lineage_wf AOA_Zhaoming_Gao AOA_Zhaoming_Gao_checkm_wd -f AOA_Zhaoming_Gao_quality.txt -x fa -t 12




##########################################################################################

# install checkm
conda create -n checkm python=3.9
conda activate checkm
conda install numpy matplotlib pysam
conda install hmmer prodigal pplacer
pip3 install checkm-genome


# setup checkm database
checkm data setRoot /home-user/wzsong/DB/checkm
# then, download checkm_data_2015_01_16.tar.gz to /home-user/wzsong/DB/checkm/
# decompress with: tar xzvf checkm_data_2015_01_16.tar.gz 
# checkm is ready for running


# run checkm
conda activate checkm
cd /home-user/wzsong/DateArTree/01_genome_selection
checkm lineage_wf d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39_Wu2 d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39_Wu2_checkm_wd -f d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39_Wu2_quality.txt -x fna -t 12


checkm lineage_wf mag_dir mag_checkm_wd -f mag_quality.txt -x fna -t 12
