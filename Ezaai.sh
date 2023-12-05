
########################### install EzAAI with conda (on HPC3) ###########################

module load anaconda3
conda create --name ezaaienv
conda activate ezaaienv
conda install -c bioconda -y ezaai
EzAAI -h


################################## run EzAAI (on HPC3) ###################################

# get example data from EzAAI
https://github.com/endixk/ezaai/blob/main/samples.zip

module load anaconda3
conda activate ezaaienv

cd sample/fasta
mkdir db_dir
for each in *.fasta; do EzAAI extract -i $each -o db_dir/$each.db; done
EzAAI calculate -i db_dir -j db_dir -o all_vs_all_aai.table
EzAAI cluster -i all_vs_all_aai.table -o all_vs_all_aai.tree

