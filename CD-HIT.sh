
######################################### CD-HIT #########################################

module load cdhit/4.8.1

# https://github.com/weizhongli/cdhit/wiki
module load cd-hit/4.6.8

# Cluster peptide sequences
/share/apps/cdhit/4.6.8/bin/cd-hit

# Cluster nucleotide sequences
/share/apps/cdhit/4.6.8/bin/cd-hit-est

# output interpretation (https://github.com/weizhongli/cdhit/wiki/3.-User%27s-Guide#CDHIT)
">" starts a new cluster  
"*" at the end means that this sequence is the representative of this cluster  
"%" is the identity between this sequence and the representative

# Choose of word size (http://weizhong-lab.ucsd.edu/cd-hit/wiki/doku.php?id=cd-hit_user_guide)
-n 5 for thresholds 0.7 ~ 1.0
-n 4 for thresholds 0.6 ~ 0.7
-n 3 for thresholds 0.5 ~ 0.6
-n 2 for thresholds 0.4 ~ 0.5



/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_all.aln -o species_tree_all_cluster
cd /srv/scratch/z5039045/test_cd-hit
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree.aln -o species_tree_cluster_0.5 -c 0.5 -G 0.5
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree.aln -o species_tree_cluster_0.4 -c 0.4 -n 2 -G 0.4
/share/apps/cdhit/4.6.8/bin/cd-hit -i combined_16s_uniq.fasta -o combined_16s_uniq.cluster


#
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_1.0.fasta -o species_tree_1.0.cluster -c 0.9 -n 2
cluster: 20 
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_1.0.fasta -o species_tree_1.0.cluster -c 0.8 -n 2
cluster: 20 
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_1.0.fasta -o species_tree_1.0.cluster -c 0.7 -n 2
cluster: 18
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_1.0.fasta -o species_tree_1.0.cluster -c 0.6 -n 2
cluster: 16
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_1.0.fasta -o species_tree_1.0.cluster -c 0.5 -n 2
cluster: 11
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_1.0.fasta -o species_tree_1.0.cluster -c 0.4 -n 2
cluster: 6


/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.8.fasta -o species_tree_0.8.cluster -c 0.9 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.8.fasta -o species_tree_0.8.cluster -c 0.8 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.8.fasta -o species_tree_0.8.cluster -c 0.7 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.8.fasta -o species_tree_0.8.cluster -c 0.6 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.8.fasta -o species_tree_0.8.cluster -c 0.5 -n 2
cluster: 16
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.8.fasta -o species_tree_0.8.cluster -c 0.4 -n 2
cluster: 11


/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.6.fasta -o species_tree_0.6.cluster -c 0.9 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.6.fasta -o species_tree_0.6.cluster -c 0.8 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.6.fasta -o species_tree_0.6.cluster -c 0.7 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.6.fasta -o species_tree_0.6.cluster -c 0.6 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.6.fasta -o species_tree_0.6.cluster -c 0.5 -n 2
cluster: 18
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.6.fasta -o species_tree_0.6.cluster -c 0.4 -n 2
cluster: 13


/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.4.fasta -o species_tree_0.4.cluster -c 0.9 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.4.fasta -o species_tree_0.4.cluster -c 0.8 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.4.fasta -o species_tree_0.4.cluster -c 0.7 -n 2
cluster: 20
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.4.fasta -o species_tree_0.4.cluster -c 0.6 -n 2
cluster: 19
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.4.fasta -o species_tree_0.4.cluster -c 0.5 -n 2
cluster: 18
/share/apps/cdhit/4.6.8/bin/cd-hit -i species_tree_0.4.fasta -o species_tree_0.4.cluster -c 0.4 -n 2
cluster: 16



################################# usearch -cluster_fast ##################################

module load usearch/9.0.2132

# Output files interpretation 
Standard output files are supported. 
Cluster centroids (representative sequences) are written to a FASTA file specified by the -centroids option. 
Consensus sequences are written to a FASTA file specified by -consout and 
multiple alignments are written to filenames derived from the -msaout option. 
Note that using -consout and -msaout may add significantly to the compute time and memory required for clustering. 
You can specify a directory to contain one FASTA file per cluster using the -clusters option.


# UC output file interpretation (https://www.drive5.com/usearch/manual/opt_uc.html)
Field	Description
1	 	Record type S, H, C or N (see table below).
2	 	Cluster number (0-based).
3	 	Sequence length (S, N and H) or cluster size (C).
4	 	For H records, percent identity with target.
5	 	For H records, the strand: + or - for nucleotides, . for proteins.
6	 	Not used, parsers should ignore this field. Included for backwards compatibility.
7	 	Not used, parsers should ignore this field. Included for backwards compatibility.
8	 	Compressed alignment or the symbol '=' (equals sign). The = indicates that the query is 100% identical to the target sequence (field 10).
9	 	Label of query sequence (always present).
10	 	Label of target sequence (H records only).




usearch -cluster_fast reads.fasta -centroids c.fasta -id 0.90

usearch -cluster_fast species_tree_1.0.fasta -id 0.6 -alnout species_tree_1.0_0.6_Usearch_alnout.txt
usearch -cluster_fast species_tree_1.0.fasta -id 0.6 -uc species_tree_1.0_0.6_Usearch_uc.txt
usearch -cluster_fast species_tree_1.0.fasta -id 0.6 -userout species_tree_1.0_0.6_Usearch_userout.txt



usearch -cluster_fast species_tree_1.0.fasta -centroids species_tree_1.0_Usearch_centroids.fasta -consout species_tree_1.0_Usearch_consout.fasta -id 0.90



usearch -cluster_fast species_tree_0.4.fasta -id 0.3 -uc species_tree_0.4_0.3_Usearch_uc.txt





