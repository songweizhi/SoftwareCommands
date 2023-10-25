
#################### install GTDB-TK with Python3 virtual environment ####################

module load python/3.7.3
mkdir ~/mypython3env_gtdbtk1.7.0
python3 -m venv --system-site-packages ~/mypython3env_gtdbtk1.7.0
source ~/mypython3env_gtdbtk1.7.0/bin/activate
pip install gtdbtk==1.7.0

# for later update
pip3 install --upgrade gtdbtk

# create a db folder
/srv/scratch/z5039045/DB/GTDB_r202

# download db files (r202)
cd /srv/scratch/z5039045/DB/GTDB_r202
#wget https://data.ace.uq.edu.au/public/gtdb/data/releases/latest/auxillary_files/gtdbtk_data.tar.gz
wget https://data.gtdb.ecogenomic.org/releases/release202/202.0/auxillary_files/gtdbtk_r202_data.tar.gz
tar gtdbtk_r202_data.tar.gz
#tar xvzf gtdbtk_data.tar.gz
export GTDBTK_DATA_PATH=/srv/scratch/z5039045/DB/GTDB_r202/release202


########################## Taxonomic classification with GTDB-TK #########################

# !!! please request 300 GB of memory for the classify_wf module in your job script !!!

module load python/3.7.3
source ~/mypython3env_gtdbtk1.7.0/bin/activate
module load perl/5.28.0
module load prodigal/2.6.3
module load pplacer/1.1.alpha19
module load hmmer/3.3
module load fasttree/2.1.11
module unload gcc
module load gcc/6.2.0
module load gsl/2.6
module load fastani/1.33x
module unload R
module load R/3.5.3
export GTDBTK_DATA_PATH=/srv/scratch/z5039045/DB/GTDB_r202/release202

cd /srv/scratch/z5039045/MetaCHIP_demo
gtdbtk classify_wf --cpus 12 --pplacer_cpus 1 --genome_dir NS_37bins --extension fasta --out_dir NS_37bins_GTDB_r202 --prefix NS_37bins
# the number of cpus specified for pplacer has to be 1, do not change "--pplacer_cpus 1"

# Taxonomic classifications for input genomes are in:
# <prefix>.bac120.summary.tsv
# <prefix>.ar122.summary.tsv


################################# Infer tree with GTDB-TK ################################

module load python/3.7.3
source ~/mypython3env_gtdbtk1.7.0/bin/activate
module load perl/5.28.0
module load prodigal/2.6.3
module load pplacer/1.1.alpha19
module load hmmer/3.3
module load fasttree/2.1.11
module unload gcc
module load gcc/6.2.0
module load gsl/2.6
module load fastani/1.33
module unload R
module load R/3.5.3
export GTDBTK_DATA_PATH=/srv/scratch/z5039045/DB/GTDB_r202/release202

cd /srv/scratch/z5039045/detectCFP_wd
gtdbtk identify --genome_dir mag_files -x fna --out_dir mag_files_GTDB_r202_tree --cpus 12
gtdbtk align --identify_dir mag_files_GTDB_r202_tree --out_dir mag_files_GTDB_r202_tree --cpus 12

# infer bacterial MAG tree
gtdbtk infer --msa_file mag_files_GTDB_r202_tree/gtdbtk.bac120.user_msa.fasta --out_dir mag_files_GTDB_r202_tree --cpus 12 --prefix bacterial

# infer archaeal MAG tree, if you have archaeal MAGs in mag_files
gtdbtk infer --msa_file mag_files_GTDB_r202_tree/gtdbtk.ar122.user_msa.fasta --out_dir mag_files_GTDB_r202_tree --cpus 12 --prefix archaeal

# the inferred trees
mag_files_GTDB_r202_tree/archaeal.unrooted.tree
mag_files_GTDB_r202_tree/bacterial.unrooted.tree


##########################################################################################
############################# Please ignore all commands below ###########################
##########################################################################################

module load python/3.7.3
source ~/mypython3env_gtdbtk1.7.0/bin/activate
module load perl/5.28.0
module load prodigal/2.6.3
module load pplacer/1.1.alpha19
module load hmmer/3.3
module load fasttree/2.1.11
module unload gcc
module load gcc/6.2.0
module load gsl/2.6
module load fastani/1.33
module unload R
module load R/3.5.3
export GTDBTK_DATA_PATH=/srv/scratch/z5039045/DB/GTDB_r202/release202

cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP
gtdbtk identify --genome_dir ref_genomes_GI -x fa --out_dir GI_ref_r95_tree --cpus 12
gtdbtk align --identify_dir GI_ref_r95_tree --out_dir GI_ref_r95_tree --cpus 12
gtdbtk infer --msa_file GI_ref_r95_tree/gtdbtk.bac120.user_msa.fasta --out_dir GI_ref_r95_tree --cpus 12 --prefix bacterial
gtdbtk infer --msa_file GI_ref_r95_tree/gtdbtk.ar122.user_msa.fasta --out_dir GI_ref_r95_tree --cpus 12 --prefix archaeal

