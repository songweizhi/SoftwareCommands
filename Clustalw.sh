
# Geodia_28S
module load clustalw/2.1
cd /srv/scratch/z5039045/Shell_project/Geodia_28S
clustalw -ALIGN -TYPE=DNA -INFILE=Geodia_28S.fasta
clustalw -BOOTSTRAP=1000 -CLUSTERING=NJ -BOOTLABELS=branch -OUTPUTTREE=phylip -INFILE=Geodia_28S.aln


# Geodia_28S_less_Geodia_refs_no_S89
clustalw -ALIGN -TYPE=DNA -INFILE=Geodia_28S_less_Geodia_refs_no_S89.fasta
clustalw -BOOTSTRAP=1000 -CLUSTERING=NJ -BOOTLABELS=branch -OUTPUTTREE=phylip -INFILE=Geodia_28S_less_Geodia_refs_no_S89.aln


# Hexactinellida
module load clustalw/2.1
cd /srv/scratch/z5039045/Shell_project/Hexactinellidas
clustalw -ALIGN -TYPE=DNA -INFILE=Hexactinellidas.fa
clustalw -BOOTSTRAP=1000 -CLUSTERING=NJ -BOOTLABELS=branch -OUTPUTTREE=phylip -INFILE=Hexactinellidas.aln


# CO1
module load clustalw/2.1
cd /srv/scratch/z5039045/Shell_project/Tree_CO1
clustalw -ALIGN -TYPE=DNA -INFILE=CO1.fasta
clustalw -BOOTSTRAP=1000 -CLUSTERING=NJ -BOOTLABELS=branch -OUTPUTTREE=phylip -INFILE=CO1.aln


# CO1_ext
module load clustalw/2.1
cd /srv/scratch/z5039045/Shell_project/Tree_CO1_ext
clustalw -ALIGN -TYPE=DNA -INFILE=CO1_ext.fasta
clustalw -BOOTSTRAP=1000 -CLUSTERING=NJ -BOOTLABELS=branch -OUTPUTTREE=phylip -INFILE=CO1_ext.aln


# CO1_ext mafft
module load mafft/7.407 
mafft --quiet --maxiterate 1000 --adjustdirection --clustalout CO1_ext.fasta > CO1_ext_mafft.aln
clustalw -BOOTSTRAP=1000 -CLUSTERING=NJ -BOOTLABELS=branch -OUTPUTTREE=phylip -INFILE=CO1_ext_mafft.aln
