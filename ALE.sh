
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



