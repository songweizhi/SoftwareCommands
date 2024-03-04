
##########################################################################################
################################# Install ALE with Docker ################################
##########################################################################################

# launch the program from the folder containing those data
cd /Users/songweizhi/Software/ALE/example_data
docker run -v $PWD:$PWD -w $PWD boussau/alesuite


# The first command to use is
docker run -v $PWD:$PWD -w $PWD boussau/alesuite ALEobserve $PWD/HBG745965_real.1.treelist


# The second command to use could be:
docker run -v $PWD:$PWD -w $PWD boussau/alesuite ALEml_undated $PWD/S.tree $PWD/HBG745965_real.1.treelist.ale
# or
docker run -v $PWD:$PWD -w $PWD boussau/alesuite ALEmcmc_undated $PWD/S.tree $PWD/HBG745965_real.1.treelist.ale


######################################### Notes ##########################################

# https://github.com/ssolo/ALE

# ALE reconciles a sample of gene trees with a species tree. 

# The sample of gene trees is typically obtained from a Bayesian MCMC program (e.g. PhyloBayes or mrBayes or RevBayes...) 
# or may be obtained using bootstrap replicates (although this would be less correct). 

# The species tree needs to be rooted. 

# Both inputs need to be provided as files containing Newick strings. 

# ALE will use the sample of gene trees to piece together (amalgamate) reconciled gene trees while estimating their probabilities. 

# Here the probability of a gene tree depends on both sequence information (provided by 
# the gene tree frequencies in the initial sample) and rates of D, T, L events, which can 
# be optimized or sampled depending on the program chosen. 

# Two models have been implemented for reconciling gene trees with a species tree. 
# A dated model, which assumes that the nodes of the species tree are ordered relative to each other, 
# and an undated model which only requires that the species tree is rooted.

# Two steps are required to obtained reconciled amalgamated gene trees: 
# first the preparation of the data by constructing an ALE object, 
# then the actual inference of the reconciled amalgamated gene trees.

# Construction of the ALE object
ALEobserve geneFamily.treelist 1000

# Inference of the reconciled gene trees
# The DTL rates can be provided, or estimated. For the undated model, there are 2 ways to estimate these rates: 
# Maximum Likelihood estimation with ALEml_undated, or 
# Bayesian MCMC sampling with ALEmcmc_undated.

# Maximum likelihood estimation with ALEml_undated
ALEml_undated species_tree.newick geneFamily.ale sample=number_of_samples separators=gene_name_separator O_R=OriginationAtRoot delta=DuplicationRate tau=TransferRate lambda=LossRate beta=weight_of_sequence_evidence fraction_missing=fraction_missing.txt


# Bayesian MCMC sampling with ALEmcmc_undated
ALEmcmc_undated species_tree.newick geneFamily.ale sample=number_of_samples separators=gene_name_separator O_R=OriginationAtRootPrior delta=DuplicationRatePrior tau=TransferRatePrior lambda=LossRatePrior sampling_rate=sampling_rate beta=weight_of_sequence_evidence


##########################################################################################
################## Gene tree species tree reconciliation with ALE (Tom) ##################
##########################################################################################

# Align, trim lots of files at once:
ls *fa | parallel muscle -in {} -out {.}.aln
ls *aln | parallel trimAl -in {} -automated1 -phylip -out {.}.phy


# Build ML trees for all gene family alignments. Use the *ufboot files for reconciliation.
iqtree -s alignmentFile -m TEST -bb 1000 -wbtl
# or do many at once:
ls *phy | parallel iqtree -s {} -m TEST -bb 1000 -wbtl


# Convert Newick bootstrapped files to ALE files, run undated reconciliation:
ls *ufboot | parallel ALEobserve {}
ls *ale | parallel ALEml_undated speciesTree {}


# To compare gene family likelihoods under a set of rooted species trees, 
# you can have the reconciliation files in a number of different directories --- each named according to a rooting hypothesis. Then:
write_consel_file.py dir1 dir2 dir3 (etc) > myfile.mt


# The output can be used as a .mt file for CONSEL (NOTE: The order of the rooting hypotheses in myfile.mt is arbitrary, and may not be the same as the order in which the arguments appear on the input line. So check the file, and reorder the lines if you wish). For example:
makermt myfile
consel myfile
catpv myfile


# Pull out relevant data from the reconciliation files for branch-wise analysis:
build_DTL_table.py geneTreeDir/ > table.txt


# Do some analysis :-)


###################################### Useful things #####################################

# Check gene trees contain only species tree names:
python check_valid_species_names.py speciesTreeNewick geneTreeDir

# Edit names if necessary (e.g. with edit_tree_names.py):
python edit_tree_names.py







################################### install ALE on Mac ###################################

brew install gcc
brew install git
brew install cmake

cd /Users/songweizhi/Software
#tar xzvf boost_1_66_0.tar.bz2
#cd /Users/songweizhi/Software/boost_1_66_0
tar xzvf boost_1_63_0.tar.gz
cd /Users/songweizhi/Software/boost_1_63_0
./bootstrap.sh --with-libraries=mpi,serialization
./b2



################################### install ALE on Mac ###################################

brew install gcc
export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig"
brew install git
brew install cmake

# download boost, a version between 1.55 and 1.63 (included): https://sourceforge.net/projects/boost/files/boost/
tar xzvf boost_1_63_0.tar.gz
tar xzvf boost_1_55_0.tar.gz

# install Boost libraries
# cd /Users/songweizhi/Software/boost_1_63_0
# ./bootstrap.sh --with-libraries=mpi,serialization
# ./b2
# sudo ./b2 install
brew install boost

# install Bio++ libraries
cd /Users/songweizhi/Software
mkdir bpp
cd bpp
git clone https://github.com/BioPP/bpp-core
git clone https://github.com/BioPP/bpp-seq
git clone https://github.com/BioPP/bpp-phyl
cd bpp-core
git checkout tags/v2.4.1 -b version2.4.1
cd ../bpp-seq
git checkout tags/v2.4.1 -b version2.4.1
cd ../bpp-phyl
git checkout tags/v2.4.1 -b version2.4.1
cd ..

cd bpp-core-build/
cmake ../bpp-core -DCMAKE_INSTALL_PREFIX=/usr/ -DBUILD_TESTING=FALSE
make
# sudo make install
sudo make install DESTDIR=/Users/songweizhi/Software/bpp/bpp-core-build

cd ../bpp-seq-build/
cmake ../bpp-seq -DCMAKE_INSTALL_PREFIX=/usr/ -DBUILD_TESTING=FALSE
make
sudo make install


cd ../bpp-phyl-build/
cmake ../bpp-phyl -DCMAKE_INSTALL_PREFIX=/usr/ -DBUILD_TESTING=FALSE
make
sudo make install


################################## install ALE on server #################################
 
cd /Users/songweizhi/Desktop/demo_install
docker run -v $PWD:$PWD -w $PWD boussau/alesuite ALEobserve OMA00004_for_ALE.ufboot
docker run -v $PWD:$PWD -w $PWD boussau/alesuite ALEml_undated OMA00004_genome_tree_for_ALE.treefile OMA00004_for_ALE.ufboot.ale

cd /Users/songweizhi/Desktop/demo_install
docker run -v $PWD:$PWD -w $PWD gregmich/alesuite_new ALEobserve OMA00004_for_ALE.ufboot
docker run -v $PWD:$PWD -w $PWD gregmich/alesuite_new ALEml_undated OMA00004_genome_tree_for_ALE.treefile OMA00004_for_ALE.ufboot.ale


####################################### install ALE ######################################

# PWD="/Users/songweizhi/Software/000/ALE/example_data"
# 
# /Users/songweizhi/Software/000/ALE/example_data/HBG745965_real.1.treelist
# 
# cd /Users/songweizhi/Desktop/ALEtutorial/ALE-master/example_data
# docker run -v $PWD:$PWD  -w $PWD boussau/alesuite ALEobserve $PWD/HBG745965_real.1.treelist


##########################################################################################

# ALE

# You need two things to run a reconciliation: a gene tree and a species tree. 
# The species tree can be a dated tree, but this is not a requirement (see the section differences between ALE dated and ALE undated). 
# The gene tree can be a distribution of gene trees, as the ones inferred by using the ultrafast bootsrap of IQ-TREE (toggle the -w option to write the individual trees). 

# Notes ！！！ 
# Using a gene tree distribution instead of a single tree is encouraged, because it informs ALE about the uncertainty in the topology of the gene tree and allows it to make better predictions.

# Example dataset
# In this example, we are going to use some simulated data I generated using Zombi. 
# I generated a small species tree with 10 leaves and I simulated 100 gene families that were present in the root. 
# The families evolved following events of Duplications, Transfers and Losses. 
# Zombi outputs the final gene trees, which is what we will use in this tutorial (there is no need to use a distribution of trees in this case because given that we are using simulated dated, we are certain about the topology of the tree).

# The first thing to do is, for every gene family, (files in the Trees folder), obtain the .ale file. 
# The .ale file contains the CCPs (conditional clade probabilities), which are used later by ALE to estimate the likelihood of the different reconciliations. 
# The files are very easy to obtain, the command is:

# The genes in the gene tree must have a mapping to the species tree. The usual way is using this format: SPECIES_GENEID


cd /home-user/wzsong/Tests/ALE/ALEtutorial/Trees
ALEobserve 10_prunedtree.nwk
# output file:
# 10_prunedtree.nwk.ale


cd /home-user/wzsong/Tests/ALE/ALEtutorial/Trees
ALEml_undated /home-user/wzsong/Tests/ALE/ALEtutorial/SpeciesTree/SpeciesTree.nwk 10_prunedtree.nwk.ale
# output files:
# 10_prunedtree.nwk.ale.ucons_tree
# 10_prunedtree.nwk.ale.uml_rec
# 10_prunedtree.nwk.ale.uTs


cd /home-user/wzsong/Tests/ALE/ALEtutorial/uml_recs
python3 /home-user/wzsong/Tests/ALE/ALEtutorial/ale_splitter.py -i SpeciesTree.nwk_1_prunedtree.nwk.ale.uml_rec -sftr
# output files:
# SpeciesTree.nwk_1_prunedtree.nwk.ale.info
# SpeciesTree.nwk_1_prunedtree.nwk.ale.rec_table
# SpeciesTree.nwk_1_prunedtree.nwk.ale.recs
# SpeciesTree.nwk_1_prunedtree.nwk.ale.stree


################################ Interpreting ALE results ################################

##### uTs file #####

#from	to	freq.
	10	n12(1)	0.64
	14	n12(1)	0.36
	11	12	0.01
	12	17	0.01
# the weight of the transfer: the number of times that the transfer has been found divided by the number of reconciliations


##### uml_rec file #####

Input ale from:	SpeciesTree.nwk_1_prunedtree.nwk.ale
>logl: -13.6768  										# The LogLikelihood of the reconciliation
rate of	 Duplications	Transfers	Losses				# Be aware that although these numbers are called rates, they should not be interpreted as standard rates, since ALE undated does not consider time.
ML 	0.0790517	1.32545e-06	1e-10
100 reconciled G-s:

##### How to interpret fractional values? #####

# The correct way to interpret this number is as a probability of a transfer taking place in this family.


# of	 Duplications	Transfers	Losses	Originations	copies	singletons	extinction_prob	presence	LL
S_terminal_branch	n10(0)	0	0	0	0	2	2	9.26738e-11	1	-53.0277
S_terminal_branch	n12(1)	0	0	0	0	2	2	9.26738e-11	1	-52.9536
S_terminal_branch	n13(2)	1	0	0	0	3	1	9.26738e-11	1	-52.8735
S_terminal_branch	n14(3)	0	0	0	0	2	2	9.26738e-11	1	-52.8735
S_terminal_branch	n15(4)	0	0	0	0	2	2	9.26738e-11	1	-53.0764
S_terminal_branch	n16(5)	0	0	0	0	2	2	9.26738e-11	1	-53.0764
S_terminal_branch	n17(6)	0	0	0	0	2	2	9.26738e-11	1	-41.7006
S_terminal_branch	n18(7)	0	0	0	0	2	2	9.26738e-11	1	-41.7006
S_terminal_branch	n7(8)	0	0	0	0	2	2	9.26738e-11	1	-53.0277
S_terminal_branch	n8(9)	0	0	0	0	2	2	9.26738e-11	1	-53.0277
S_internal_branch	10	0	0	0	0	2	2	9.26738e-11	1	-52.9536
S_internal_branch	11	0	0	0	0	2	2	9.26738e-11	1	-40.9895
S_internal_branch	12	1	0	0	0	2	0	9.26738e-11	1	-25.6364
S_internal_branch	13	0	0	0	0	2	2	9.26738e-11	1	-53.0604
S_internal_branch	14	0	0	0	0	2	2	9.26738e-11	1	-53.0277
S_internal_branch	15	0	0	0	0	2	2	9.26738e-11	1	-53.0604
S_internal_branch	16	0	0	0	0	2	2	9.26738e-11	1	-40.9895
S_internal_branch	17	1	0	0	0	2	0	9.26738e-11	1	-25.6364
S_internal_branch	18	0	0	0	1	1	1	9.26738e-11	1	-13.6768

# Branch 			- 	Code of the branch according to the Species Tree
# BranchType 		- 	Whether the branch is a terminal branch or an inner branch
# Duplications 		- 	Average number of Duplications events in the branch
# Transfers			- 	Average number of Transfer events in the branch
# Losses 			- 	Average number of Loss events in the branch
# Originations 		- 	Fraction of times that the Gene Family starts in this specific branch
# Copies 			- 	Average number of copies in the branch
# Singletons 		- 	Average number of genes that are seeing as vertically evolving, i.e. the gene can be found at the beginning of the branch and at the end
# Extinctinonprob 	- 	The likelihood that a gene present in this branch will eventually go extinct
# Presence 			- 	Between 0 and 1, number of times the gene family is present in this branch
# LL 				- 	The likelihood of the gene family originating at this specific branch


############################### run ALE on a real dataset ################################

cd /home-user/wzsong/Tests/ALE/real_dataset
ALEobserve OG0001758.treefile
# output file:
# 10_prunedtree.nwk.ale


cd /home-user/wzsong/Tests/ALE/real_dataset
ALEml_undated concatenated_rooted_subset.treefile OG0001758.treefile.ale
# output files:
# 10_prunedtree.nwk.ale.ucons_tree
# 10_prunedtree.nwk.ale.uml_rec
# 10_prunedtree.nwk.ale.uTs


cd /home-user/wzsong/Tests/ALE/real_dataset
python3 /home-user/wzsong/Tests/ALE/ALEtutorial/ale_splitter.py -i OG0001758.treefile.ale.uml_rec -sftr
# output files:
# SpeciesTree.nwk_1_prunedtree.nwk.ale.info
# SpeciesTree.nwk_1_prunedtree.nwk.ale.rec_table
# SpeciesTree.nwk_1_prunedtree.nwk.ale.recs
# SpeciesTree.nwk_1_prunedtree.nwk.ale.stree












