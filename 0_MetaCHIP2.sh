
##########################################################################################
###################### install MetaCHIP and MetaCHIP2 on HKUST HPC3 ######################
##########################################################################################

# install MetaCHIP and MetaCHIP2
module load anaconda3
conda create -n metachip_env
source activate metachip_env
pip install MetaCHIP
pip install MetaCHIP2
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


# run MetaCHIP1
cd /scratch/PI/ocessongwz/MetaCHIP_wd/MetaCHIP1_input_file_examples
MetaCHIP PI -p HumanGut -r c -t 6 -i human_gut_bins -x fasta -taxon human_gut_bins_GTDB.tsv
MetaCHIP BP -p HumanGut -r c -t 6


# run MetaCHIP2
module load anaconda3
source activate metachip_env
cd /scratch/PI/ocessongwz/MetaCHIP_wd
MetaCHIP2 detect -i S2_sal_fde_gbk -x gbk -c S2_sal_fde_taxon.tsv -r pco -p S2_sal_fde -t 6 -s S2_sal_fde_rooted.tree -f
MetaCHIP2 detect -i S2_sal_fde_gbk -x gbk -c S2_sal_fde_taxon.tsv -r pco -p S2_sal_fde_mmseqs -t 6 -s S2_sal_fde_rooted.tree -f -mmseqs


##########################################################################################
##########################################################################################
##########################################################################################

