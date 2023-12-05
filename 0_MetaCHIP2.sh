
##########################################################################################
###################### install MetaCHIP and MetaCHIP2 on HKUST HPC3 ######################
##########################################################################################

# install MetaCHIP and MetaCHIP2
module load anaconda3
conda create -n metachip2env -c conda-forge -c bioconda gtdbtk=2.3.2
source activate metachip2env
pip install MetaCHIP
pip install MetaCHIP2
conda install -c bioconda blast
conda install -c bioconda mafft
conda install -c bioconda mmseqs2


conda install -c conda-forge r-base
R
install.packages("optparse")
install.packages("circlize")
install.packages("ggplot2")
conda install -c conda-forge gcc


##########################################################################################

##### run MetaCHIP1 #####

# example data are here: https://github.com/songweizhi/MetaCHIP/tree/master/input_file_examples
module load anaconda3
source activate metachip2env
cd /scratch/PI/ocessongwz/MetaCHIP_wd/MetaCHIP1_input_file_examples
MetaCHIP PI -p HumanGut -r c -t 6 -i human_gut_bins -x fasta -taxon human_gut_bins_GTDB.tsv
MetaCHIP BP -p HumanGut -r c -t 6

module load anaconda3
source activate metachip2env
cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r pcofg -x fasta -t 12
MetaCHIP BP -p NorthSea -r pcofg -t 12


##### run MetaCHIP2 #####

# get rooted tree
module load anaconda3
source activate metachip2env
cd /scratch/PI/ocessongwz/MetaCHIP_wd
export GTDBTK_DATA_PATH=/scratch/PI/boqianpy/Database/GTDB-Tk_r214/release214
MetaCHIP2 tree -o NorthSea_get_tree_wd -i /scratch/PI/boqianpy/shanzhang/01_MetaCHIP2/02_NorthSea/NorthSea_69_MAGs_cont_free_37_MAGs_renamed -x fasta -t 12 -f -db /scratch/PI/ocessongwz/DB/gtdbtk_db -c /scratch/PI/boqianpy/shanzhang/01_MetaCHIP2/02_NorthSea/NorthSea_69_MAGs.bac120.summary.tsv

# detect HGT
module load anaconda3
source activate metachip2env
cd /scratch/PI/ocessongwz/MetaCHIP_wd
MetaCHIP2
python3 detect.py -i S2_sal_fde_gbk -x gbk -c S2_sal_fde_taxon.tsv -r pco -p S2_sal_fde -t 6 -s S2_sal_fde_rooted.tree -f -mmseqs
MetaCHIP2 detect -i S2_sal_fde_gbk -x gbk -c S2_sal_fde_taxon.tsv -r pco -p S2_sal_fde_mmseqs -t 6 -s S2_sal_fde_rooted.tree -f -mmseqs


##########################################################################################
##########################################################################################
##########################################################################################

cd /Users/songweizhi/Desktop/MetaCHIP2/HGT_Shen
MetaCHIP2 detect -o Bacilli_plus_78_family_2 -i Bacilli_plus_78_gbk -x gbk -s Bacilli_plus_78_bac120.rooted.tree -g Bacilli_plus_78_clade_f.txt -m -np -nc -t 10 -f -b Bacilli_plus_78_blastn_results
/Library/Frameworks/Python.framework/Versions/3.10/bin/python3 /Users/songweizhi/PycharmProjects/MetaCHIP2/MetaCHIP2/detect.py -o Bacilli_plus_78_family_2 -i Bacilli_plus_78_gbk -x gbk -s Bacilli_plus_78_bac120.rooted.tree -g Bacilli_plus_78_clade_f.txt -m -np -nc -t 10 -f -b Bacilli_plus_78_blastn_results

cd /Users/songweizhi/Desktop/MetaCHIP2/HGT_Shen/Bacilli_plus_78_family_2_MetaCHIP2_wd
python /Users/songweizhi/PycharmProjects/MetaCHIP2/MetaCHIP2/circos.py -i Bacilli_plus_78_family_2_x83_circos.pdf.matrix.txt -o circos_1.2.pdf











