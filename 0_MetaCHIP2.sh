
##########################################################################################
############################ install MetaCHIP2 on HKUST HPC3 #############################
##########################################################################################

# install MetaCHIP2
module load anaconda3
conda create -n metachip_env
source activate metachip_env
pip install MetaCHIP
pip install MetaCHIP2
conda install -c bioconda blast
conda install -c bioconda mafft
conda install -c bioconda fasttree
conda install -c conda-forge r-base
conda install -c bioconda mmseqs2
R
install.packages("optparse")
install.packages("circlize")
install.packages("ape")


# run MetaCHIP2
module load anaconda3
source activate mypython3env
cd /home/ocessongwz/MetaCHIP_wd
MetaCHIP2 detect -i S2_sal_fde_gbk -x gbk -c S2_sal_fde_taxon.tsv -r pco -p S2_sal_fde -t 6 -s S2_sal_fde_rooted.tree -f
MetaCHIP2 detect -i S2_sal_fde_gbk -x gbk -c S2_sal_fde_taxon.tsv -r pco -p S2_sal_fde_mmseqs -t 6 -s S2_sal_fde_rooted.tree -f -mmseqs


##########################################################################################
##########################################################################################
##########################################################################################


