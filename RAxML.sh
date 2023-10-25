module load raxml/8.2.10 

################################# Manual starts #################################
# The Easy & Fast Way
# 
# The easy and fast way to infer trees with RAxML and to analyze really large datasets (several genes or more than 1,000 taxa) or to conduct a large number of BS replicates is to use the novel rapid BS algorithm and combine it with an ML search.
# 
# RAxML will then conduct a full ML analysis, i.e., a certain number of BS replicates and a search for a
# 
# 53 best–scoring ML tree on the original alignment.
# 
# To just do a BS search you would type:
# 
raxmlHPC ­x 12345 ­p 12345 ­# 100 ­m GTRGAMMA ­s ex_al ­n TEST 
# 
# or using the bootstrap convergence criterion:
# 
raxmlHPC ­x 12345 ­p 12345 ­# autoMRE ­m GTRGAMMA ­s ex_al ­n TEST
# 
# This will conduct rapid bootstrapping and and an ML search under the GAMMA model of rate heterogeneity.
# 
# Now, if you want to run a full analysis, i.e., BS and ML search type:
# 
# raxmlHPC ­f a ­x 12345 ­p 12345 ­# 100 ­m GTRGAMMA ­s ex_al ­n TEST
# 
# This will first conduct a BS search and once that is done a search for the best–scoring ML tree. Such a program run will return the bootstrapped trees (RAxML_bootstrap.TEST), the best scoring ML tree (RAxML_bestTree.TEST) and the BS support values drawn on the best-scoring tree as node labels (RAxML_bipartitions.TEST) as well as, more correctly since support values refer to branches as branch labels (RAxML_bipartitionsBranchLabels.TEST).
# 
# Finally, note that, by increasing the number of BS replicates via ­# you will also make the ML search more thorough, since for ML optimization every 5th BS tree is used as a starting point to search for ML trees.
# 
# When ­# autoMRE is specified RAxML will execute a maximum of 1000 BS replicate searches, but it may, of course converge earlier.
# 
# From what I have observed so far, this new ML search algorithm yielded better trees than what is obtained via 20 standard ML searches on distinct starting trees for all datasets with ≤ 1,000 sequences.
# 
# For larger datasets it might be worthwhile to conduct an additional ML search as described below, just to be sure.
# 
# Warning: note that the rapid BS search will currently ignore commands associated to user tree files passed via ­t or ­z.
# 
# However, the constraint and backbone tree options (­g and ­r) do work with rapid BS.
################################# Manual ends #################################


module load raxml/8.2.10 

cd /srv/scratch/z5095298/Julie/SPONGES_FOR_TT/15_Phylogenetic_tree/RAxML
raxmlHPC -x 12345 -m GTRGAMMA -n test.out -s Thau_16S_SA9_FL15_Simster42_root1.aln -p 12345 -f a -# autoMRE

raxmlHPC -x 12345 -m GTRGAMMA -n Thau_16S_SA9_FL15_Simster19_root1_OneLine.out -s Thau_16S_SA9_FL15_Simster19_root1_OneLine.aln -p 12345 -f a -# 1000



################################# Cmds from Bernd 19 Jan 2019 #################################

# DNA: 
raxmlHPC-PTHREADS -T 8 -­m GTRGAMMA ­-s dna.aln -­p 12345 -­n TEST -# 1000

# Protein: 
raxmlHPC-PTHREADS -T 8 -­m PROTGAMMAWAG ­-s protein.aln -­p 12345 -­n TEST -# 1000

# (Both without bootstrapping, if needed add -# 1000)



################################# Cmds for  New Katana system 28 July 2019 #################################

#!/bin/bash

#PBS -l nodes=1:ppn=10
#PBS -l mem=100gb
#PBS -l walltime=23:59:00
#PBS -M zzfanyi@gmail.com
#PBS -m ae

module load raxml/8.2.12

cd /srv/scratch/z5095298/Julie/SPONGES_FOR_TT/15_Phylogenetic_tree/RAxML/14_HPCpthreads_PROTGAMMAWAG_BS500_Thau_SCG_SA9_FL15_3sisters_NitSpUBA527/
# Protein:
raxmlHPC-PTHREADS -f a -N 100 -m PROTGAMMAWAG -p 12345 -x 12345 -s species_tree.aln -n HPCpthreads_PROTGAMMAWAG_BS500_Thau_SCG_SA9_FL15_3sisters_NitSpUBA527_N500.tree -T 8
raxmlHPC-PTHREADS -f a -N 500 -m PROTGAMMAWAG -p 12345 -x 12345 -s species_tree.aln -n HPCpthreads_PROTGAMMAWAG_BS500_Thau_SCG_SA9_FL15_3sisters_NitSpUBA527_N500.tree -T 8
raxmlHPC-PTHREADS -f a -N 1000 -m PROTGAMMAWAG -p 12345 -x 12345 -s species_tree.aln -n HPCpthreads_PROTGAMMAWAG_BS500_Thau_SCG_SA9_FL15_3sisters_NitSpUBA527_N1000.tree -T 8


cd /srv/scratch/z5039045/RAxML
raxmlHPC-PTHREADS -f a -N 50 -m PROTGAMMAWAG -p 12345 -x 12345 -s NorthSea.aln -n NorthSea.tree -T 12





