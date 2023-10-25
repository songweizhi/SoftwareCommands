
########################### build reference package with taxit ###########################

# installation
module load python/3.7.3
cd ~
. mypython3env/bin/activate
pip install taxtastic


# Say we have the following:
# seqs.fasta: The multiply aligned reference sequences in FASTA format.
# tree.nwk: The tree built from reference alignment, in Newick format.
# tree_stats.txt: The log file from FastTree or the statistics file from RAxML/phyml.
# Build a reference package my.refpkg for a locus locus_name (e.g. 16s_rRNA) in a single command as follows:

module load python/3.7.3
cd ~
. mypython3env/bin/activate
taxit create -l 16s_rRNA -P my.refpkg --aln-fasta seqs.fasta --tree-stats tree_stats.txt --tree-file tree.nwk


################################## pplacer (2019-07-27) ##################################

module load pplacer/1.1.alpha19

# Place genomes into the tree
pplacer -m WAG -j 12 -c reference_package_file -o output_json_file input_msa_file
pplacer -c vaginal_16s.refpkg src/p4z1r36.fasta


# Convert the pplacer json output into a newick tree.
guppy tog -o tree_file.newick pplacer_json_out







########################################## Test ########################################## 


export PATH=/Users/songweizhi/Softwares/FastTree/bin:$PATH
fasttree -log NS36.FastTree.log -quiet NS36.aln > NS36.FastTree.tree

# build reference package
taxit create -l NS36 -P NS36.refpkg --aln-fasta NS36.aln --tree-stats NS36.FastTree.log --tree-file NS36.FastTree.tree





# Place genomes into the tree
module load pplacer/1.1.alpha19
pplacer -m WAG -j 12 -c NS36.refpkg -o NS36.json NS37.aln







