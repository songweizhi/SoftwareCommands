
# add the following line to ~/.bash_profile
PATH=$PATH:/home-user/software/paml/v4.9/paml4.9e/bin


########################## Tutorial 1: Divergence time of apes ###########################

# MCMCTree uses for input 
# 1. a sequence alignment (nucleotide or protein)
# 2. a phylogenetic tree with fossil calibrations
# 3. a control ﬁle (usually called mcmctree.ctl) that contains the instructions for the program

cd /home-user/wzsong/Tutorials/MCMCTree/run01
mcmctree mcmctree.ctl

cd /home-user/wzsong/Tutorials/MCMCTree/run02
mcmctree mcmctree.ctl

cd /home-user/wzsong/Tutorials/MCMCTree/prior_distribution
mcmctree mcmctree.ctl

cd /home-user/wzsong/Tutorials/MCMCTree/HKY85_G5
mcmctree mcmctree.ctl

cd /home-user/wzsong/Tutorials/MCMCTree/Hessian
mcmctree mcmctree.ctl

cd /home-user/wzsong/Tutorials/MCMCTree/approx01
mcmctree mcmctree.ctl

cd /home-user/wzsong/Tutorials/MCMCTree/approx02
mcmctree mcmctree.ctl






