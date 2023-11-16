
##########################################################################################
###################### install MetaCHIP and MetaCHIP2 on HKUST HPC3 ######################
##########################################################################################

# install MetaCHIP and MetaCHIP2
module load anaconda3
conda create -n metachip_env
source activate metachip_env
pip install MetaCHIP
pip install MetaCHIP2
pip install gtdbtk
conda install -c bioconda pplacer
conda install -c bioconda fastani
conda install -c bioconda blast
conda install -c bioconda hmmer
conda install -c bioconda mafft
conda install -c bioconda mmseqs2
conda install -c bioconda prodigal
conda install -c bioconda fasttree
conda install -c conda-forge r-base
R
install.packages("optparse")
install.packages("circlize")
install.packages("ape")


conda install -c conda-forge gcc


##########################################################################################

##### run MetaCHIP1 #####

# example data are here: https://github.com/songweizhi/MetaCHIP/tree/master/input_file_examples
module load anaconda3
source activate metachip_env
cd /scratch/PI/ocessongwz/MetaCHIP_wd/MetaCHIP1_input_file_examples
MetaCHIP PI -p HumanGut -r c -t 6 -i human_gut_bins -x fasta -taxon human_gut_bins_GTDB.tsv
MetaCHIP BP -p HumanGut -r c -t 6

module load anaconda3
source activate metachip_env
cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r pcofg -x fasta -t 12
MetaCHIP BP -p NorthSea -r pcofg -t 12


##### run MetaCHIP2 #####

# get rooted tree
module load anaconda3
source activate metachip_env
cd /scratch/PI/ocessongwz/MetaCHIP_wd
export GTDBTK_DATA_PATH=/scratch/PI/boqianpy/Database/GTDB-Tk_r214/release214

MetaCHIP2 tree -o NorthSea_get_tree_wd -i /scratch/PI/boqianpy/shanzhang/01_MetaCHIP2/02_NorthSea/NorthSea_69_MAGs_cont_free_37_MAGs_renamed -x fasta -t 12 -f -db /scratch/PI/ocessongwz/DB/gtdbtk_db -c /scratch/PI/boqianpy/shanzhang/01_MetaCHIP2/02_NorthSea/NorthSea_69_MAGs.bac120.summary.tsv

# detect HGT
module load anaconda3
source activate metachip_env
cd /scratch/PI/ocessongwz/MetaCHIP_wd
MetaCHIP2 detect -i S2_sal_fde_gbk -x gbk -c S2_sal_fde_taxon.tsv -r pco -p S2_sal_fde -t 6 -s S2_sal_fde_rooted.tree -f
MetaCHIP2 detect -i S2_sal_fde_gbk -x gbk -c S2_sal_fde_taxon.tsv -r pco -p S2_sal_fde_mmseqs -t 6 -s S2_sal_fde_rooted.tree -f -mmseqs
