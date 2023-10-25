
#################### install GTDB-TK with Python3 virtual environment ####################

module load python/3.7.3
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate
pip3 install gtdbtk

# to update
pip3 install --upgrade gtdbtk

# create a db folder
mkdir /srv/scratch/z5039045/DB/GTDB_r207

# download db files (r207)
cd /srv/scratch/z5039045/DB/GTDB_r207
wget https://data.gtdb.ecogenomic.org/releases/latest/auxillary_files/gtdbtk_data.tar.gz
tar xvzf gtdbtk_data.tar.gz
export GTDBTK_DATA_PATH=/srv/scratch/z5039045/DB/GTDB_r207/release207


########################## Taxonomic classification with GTDB-TK #########################

# please request 60 GB of memory for the classify_wf module in your job script

module load python/3.7.3
source ~/mypython3env/bin/activate
module load perl/5.28.0
module load prodigal/2.6.3
module load pplacer/1.1.alpha19
module load hmmer/3.3
module load fasttree/2.1.11
module unload gcc
module load gcc/6.2.0
module load gsl/2.6
module load fastani/1.32
module unload R
module load R/3.5.3
export GTDBTK_DATA_PATH=/srv/scratch/z5039045/DB/GTDB_r207/release207

cd /srv/scratch/z5039045/MetaCHIP_demo
#gtdbtk classify_wf --full_tree --cpus 12 --pplacer_cpus 1 --genome_dir NS_37bins --extension fasta --out_dir NS_37bins_GTDB_r207 --prefix NS_37bins
gtdbtk classify_wf --cpus 12 --pplacer_cpus 1 --genome_dir gamma_ind_genomes_collapsed --extension fasta --out_dir gamma_ind_genomes_collapsed_GTDB_r207 --prefix gamma_ind_genomes_collapsed
# the number of cpus specified for pplacer has to be 1, do not change "--pplacer_cpus 1"


################################# Infer tree with GTDB-TK ################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load perl/5.28.0
module load prodigal/2.6.3
module load pplacer/1.1.alpha19
module load hmmer/3.3
module load fasttree/2.1.11
module unload gcc
module load gcc/6.2.0
module load gsl/2.6
module load fastani/1.32
module unload R
module load R/3.5.3
export GTDBTK_DATA_PATH=/srv/scratch/z5039045/DB/GTDB_r207/release207

cd /srv/scratch/z5039045/detectCFP_wd
gtdbtk identify --genome_dir mag_files -x fna --out_dir mag_files_GTDB_r207_tree --cpus 12
gtdbtk align --identify_dir mag_files_GTDB_r207_tree --out_dir mag_files_GTDB_r207_tree --cpus 12

# infer bacterial MAG tree
gtdbtk infer --msa_file mag_files_GTDB_r207_tree/align/gtdbtk.bac120.user_msa.fasta.gz --out_dir mag_files_GTDB_r207_tree --cpus 12 --prefix bacterial

# infer archaeal MAG tree, if you have archaeal MAGs in mag_files
gtdbtk infer --msa_file mag_files_GTDB_r207_tree/align/gtdbtk.ar53.user_msa.fasta.gz --out_dir mag_files_GTDB_r207_tree --cpus 12 --prefix archaeal






