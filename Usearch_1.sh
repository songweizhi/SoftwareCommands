
##################################### usearch_global #####################################

/srv/scratch/z5039045/Softwares/usearch11 -usearch_global combined2.ffn -db combined2.ffn -blast6out combined2_usearch.tab -id 0.5 -strand both

# blastn
makeblastdb -in combined2.ffn -dbtype nucl -parse_seqids   
blastn -query combined2.ffn -db combined2.ffn -out combined2_blastn.tab -evalue 1e-5 -num_threads 6 -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qlen slen" -task blastn


###################################### tree_subset #######################################

# https://drive5.com/usearch/manual/cmd_tree_subset.html

cd /srv/scratch/z5039045/usearch_test/tree_subset
/srv/scratch/z5039045/Softwares/usearch11 -tree_subset species_tree.newick -labels labels.txt -newickout species_tree_subset.tree


######################################### subtree ########################################

# https://drive5.com/usearch/manual/cmd_subtree.html

cd /srv/scratch/z5039045/usearch_test/tree_subset
/srv/scratch/z5039045/Softwares/usearch11 -subtree species_tree.newick -labels labels.txt -newickout species_tree_subset.tree



###################################### cluster_tree ######################################

# https://drive5.com/usearch/manual/cmd_cluster_tree.html



###################################### fastq to fasta ######################################

module load usearch/11.0.667
usearch -fastq_filter GI_R1_10000000.fastq -fastaout GI_R1_10000000.fasta
usearch -fastq_filter GI_R1_10000000.fastq -fastaout GI_R1_10000000——2.fasta -fastq_ascii 64
    
  usearch -fastq_filter reads.fastq -fastaout reads.fasta -fastq_ascii 64


######################################### UCLUST #########################################

cd /srv/scratch/z5039045/Test_and_backup/usearch_test/UCLUST

# cluster_smallmem (first sort by length, then cluster)
/srv/scratch/z5039045/Softwares/usearch/usearch11 -sortbylength NorthSea_combined.faa -fastaout NorthSea_combined_sorted.faa -minseqlength 50
/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_smallmem NorthSea_combined_sorted.faa -id 0.7 -uc clusters.uc -sort length

# cluster_fast (identity cutoff 0.5)
/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast NorthSea_combined.faa -id 0.5 -uc NorthSea_clusters_0.5.uc -sort length



# test on ALpha and Beta genomes
cd /srv/scratch/z5039045/Test_and_backup/usearch_test/UCLUST
/srv/scratch/z5039045/Softwares/usearch/usearch11 -sortbylength mNC_combined.faa -fastaout mNC_combined_sorted.faa -minseqlength 50
/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.3 -uc mNC_clusters_0.3.uc -sort length
/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.5 -uc mNC_clusters_0.5_t1.uc -sort length
/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.25 -uc mNC_clusters_0.25_t2.uc -sort length
/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.2 -uc mNC_clusters_0.2_t3.uc -sort length -clusters clusters




/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.3 -uc mNC_clusters_0.3.uc.t1 -sort length -clusters mNC_0.3.uc.t1/mNC_0.3.uc.t1_
UCLUST	The number of clusters with at least 3 genes: 5589
UCLUST	The number of genes included in qualified clusters: 32787
UCLUST	Average gene number per cluster: 5.9


/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.3 -uc mNC_clusters_0.3.uc.t2 -sort length -clusters mNC_0.3.uc.t2/mNC_0.3.uc.t2_ -query_cov 0.7 -target_cov 0.7
UCLUST	The number of clusters with at least 3 genes: 5341
UCLUST	The number of genes included in qualified clusters: 30720
UCLUST	Average gene number per cluster: 5.8

/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.3 -uc mNC_clusters_0.3.uc.t3 -sort length -query_cov 0.75 -target_cov 0.75
UCLUST	The number of clusters with at least 3 genes: 5296
UCLUST	The number of genes included in qualified clusters: 30326
UCLUST	Average gene number per cluster: 5.7

/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.3 -uc mNC_clusters_0.3.uc.t4 -sort length -query_cov 0.75 -target_cov 0.75 -minqt 0.75 -maxqt 1.33
UCLUST	The number of clusters with at least 3 genes: 5397
UCLUST	The number of genes included in qualified clusters: 30874
UCLUST	Average gene number per cluster: 5.7

/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.3 -uc mNC_clusters_0.3.uc.t5 -sort length -query_cov 0.7 -target_cov 0.7 -minqt 0.7 -maxqt 1.43 -clusters mNC/mNC
UCLUST	The number of clusters with at least 3 genes: 5428
UCLUST	The number of genes included in qualified clusters: 31245
UCLUST	Average gene number per cluster: 5.8


# GET_HO
GET_HO	The number of clusters with at least 3 genes: 4427
GET_HO	The number of genes included in qualified clusters: 38872
GET_HO	Average gene number per cluster: 8.8


# test on big dataset (very fast)
cd /srv/scratch/z5039045/MetaCHIP_rebuttal/Soil368_MetaCHIP_wd
/srv/scratch/z5039045/Softwares/usearch/usearch11 -sortbylength mNC_combined.faa -fastaout mNC_combined_sorted.faa -minseqlength 50
/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast mNC_combined_sorted.faa -id 0.3 -uc mNC_clusters_0.3.uc.t5 -sort length -query_cov 0.7 -target_cov 0.7 -minqt 0.7 -maxqt 1.43 -clusters mNC/mNC

/srv/scratch/z5039045/Softwares/usearch/usearch11 -cluster_fast Soil368_combined.faa -id 0.5 -uc Soil368_clusters_0.5.uc

