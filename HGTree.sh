/Users/weizhisong/Softwares/get_homologues/get_homologues-macosx-20160712/get_homologues.pl -h
/share/apps/clustalo/1.2.0/bin/clustalo
/share/apps/fasttree/2.1.7/FastTree
/share/apps/fasttree/2.1.7/FastTreeMP



# Mac
/Users/weizhisong/Softwares/FastTree
/Users/weizhisong/Softwares/Clustal_Omega/clustalo
/Users/weizhisong/Softwares/Gblocks/Gblocks_0.91b/Gblocks




# get homologues
cd /srv/scratch/z5039045/get_homologues_working_directory
# -C min %coverage in BLAST pairwise alignments
# -E max E-value 
# -S min %sequence identity in BLAST query/subj pairs
# -G use COGtriangle algorithm (COGS, PubMed=20439257)
# -t report sequence clusters including at least t taxa
# -f filter by %length difference within clusters 
/srv/scratch/z5039045/gh/get_homologues-x86_64-20160712/get_homologues.pl -f 70 -t 3 -S 70 -E 1e-05 -C 80 -G -d /srv/scratch/z5039045/get_homologues_working_directory/input_gbk


# sequence alignment
module load clustalo/1.2.2 
cd /srv/scratch/z5039045/Explicit_Tree

#--outfmt={a2m=fa[sta],clu[stal],msf,phy[lip],selex,st[ockholm],vie[nna]} MSA output file format (default: fasta)


/share/apps/clustalo/1.2.0/bin/clustalo --force -i ./input/aaa.fasta -o ./aaa.aln
/share/apps/clustalo/1.2.0/bin/clustalo --force -i ./posidonia_bin45_00741___rock_bin3_00030.fasta -o ./posidonia_bin45_00741___rock_bin3_00030.aln
/share/apps/clustalo/1.2.0/bin/clustalo --force -i ./1.seq -o ./1.fasta

/share/apps/clustalo/1.2.0/bin/clustalo --force --outfmt=phy -i ./1.seq -o ./1.phy


# build tree
module load fasttree/2.1.7
FastTree ./aaa.aln > ./aaa.tree
FastTree ./posidonia_bin45_00741___rock_bin3_00030.aln > ./posidonia_bin45_00741___rock_bin3_00030.tree





































