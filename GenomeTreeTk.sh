
################################ run genometreetk on Mac #################################

export PATH=/Users/songweizhi/Softwares/FastTree/bin:$PATH
cd /Users/songweizhi/Desktop/genometreetk_test
genometreetk pd NorthSea_0_Tree.newick 6_MAGs.txt


############################# install genometreetk on Katana #############################

module load python/3.7.3
source ~/mypython3env/bin/activate
pip install genometreetk


####################################### pd module ########################################

# PD: total branch length spanned by a set of taxa
# PG: additional branch length contributed by a set of taxa

module load python/3.7.3
source ~/mypython3env/bin/activate
module load fasttree/2.1.11
module load hmmer/3.3

cd /srv/scratch/z5039045/genometreetk_test/pd_module
genometreetk pd NorthSea_0_Tree.newick close_5.txt
#					No. Taxa	PD		Percent PD
# Full tree				37		9.93	100.00%
# Outgroup taxa (PD)	32		9.30	93.669%
# Ingroup taxa (PD)		5		1.05	10.581%
# Ingroup taxa (PG)		5		0.63	6.331%


genometreetk pd NorthSea_0_Tree.newick distant_5.txt
# 					No. Taxa	PD		Percent PD
# Full tree				37		9.93	100.00%
# Outgroup taxa (PD)	32		8.77	88.348%
# Ingroup taxa (PD)		5		3.06	30.827%
# Ingroup taxa (PG)		5		1.16	11.652%


##################################### outgroup module ####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load fasttree/2.1.11
module load hmmer/3.3

# Outgroup Rooting tree with d__Archaea
cd /srv/scratch/z5039045/genometreetk_test/outgroup_module

# example command: genometreetk outgroup input_tree taxonomy_file outgroup_taxon output_tree
genometreetk outgroup Kelp_NM_dRep99_p32_species_tree.newick Kelp_NM_GTDB_r89.tsv d__Archaea Kelp_NM_dRep99_p32_species_tree_outgroup_rooted.newick

