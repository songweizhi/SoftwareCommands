
###################################### gtdbtk-2.1.1 ###################################### 

# install gtdbtk
conda create -n gtdbtk-2.1.1 -c conda-forge -c bioconda gtdbtk=2.1.1   
conda activate gtdbtk-2.1.1
conda deactivate
pip3 install mxnet-mkl==1.6.0 numpy==1.23.1  # to bypass the "module 'numpy' has no attribute 'bool'" error


# infer tree with gtdbtk
conda activate gtdbtk-2.1.1
export GTDBTK_DATA_PATH=/mnt/ivy/thliao/data/gtdb/release207
cd /home-user/wzsong/DateArTree/01_genome_selection
BioSAK GTDB_tree_r207 -p d__Archaea_o_rs_gnms -i d__Archaea_o_rs_gnms -x fna -t 12
BioSAK GTDB_tree_r207 -p d__Archaea_o_rs_gnms_plus_Betts_38 -i d__Archaea_o_rs_gnms_plus_Betts_38 -x fna -t 12
BioSAK GTDB_tree_r207 -p d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39 -i d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39 -x fna -t 12
BioSAK GTDB_tree_r207 -p d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39_Wu2 -i d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39_Wu2 -x fna -t 12

###################################### gtdbtk-2.3.0 ###################################### 

# install gtdbtk
conda create -n gtdbtk-2.3.0 -c conda-forge -c bioconda gtdbtk=2.3.0   
conda activate gtdbtk-2.3.0
#conda deactivate
#pip3 install mxnet-mkl==1.6.0 numpy==1.23.1  # to bypass the "module 'numpy' has no attribute 'bool'" error


# infer tree with gtdbtk
conda activate gtdbtk-2.3.0
export GTDBTK_DATA_PATH=/mnt/home-db/pub/gtdb/release214
cd /home-user/wzsong/DateArTree_GTDB_r214_2
gtdbtk classify_wf --cpus 6 --pplacer_cpus 1 --skip_ani_screen --genome_dir archaeal_MAGs_new --extension fna --out_dir archaeal_MAGs_new_GTDB_r214 --prefix archaeal_MAGs_new_GTDB_r214


