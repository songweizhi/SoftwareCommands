
############################ compare blastn and mmseqs search ############################

# run blastn
module load blast-plus/2.12.0 
cd /srv/scratch/z5265700/NASA/mmseqs_test
makeblastdb -in combined.ffn -dbtype nucl -parse_seqids -logfile /dev/null
blastn -query S1_mou_fdl_bin2.ffn -db combined.ffn -out S1_mou_fdl_bin2.tab.blastn -evalue 1e-5 -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qlen slen" -task blastn -num_threads 1

# run mmseqs
module load mmseqs2/14-7e284
cd /srv/scratch/z5265700/NASA/mmseqs_test
mmseqs createdb combined.ffn combined.ffn.db
mmseqs createindex combined.ffn.db combined.ffn.tmp --search-type 3
mmseqs createdb S1_mou_fdl_bin2.ffn S1_mou_fdl_bin2.ffn.db
mmseqs search S1_mou_fdl_bin2.ffn.db combined.ffn.db S1_mou_fdl_bin2.tab.db combined.ffn.tmp --threads 1
mmseqs convertalis S1_mou_fdl_bin2.ffn.db combined.ffn.db S1_mou_fdl_bin2.tab.db S1_mou_fdl_bin2.tab.mmseq --format-output query,target,pident,alnlen,mismatch,gapopen,qstart,qend,tstart,tend,evalue,bits,qlen,tlen


##################################### mmseqs cluster #####################################

module load mmseqs2/14-7e284
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Test/mmseqs_cluster_test
mmseqs createdb combined.ffn DB
mmseqs cluster DB DB_clu tmp --min-seq-id 0.600 --seq-id-mode 0 --min-aln-len 200 --cov-mode 0 -c 0.75 --similarity-type 2
mmseqs createtsv DB DB DB_clu DB_clu.tsv
mmseqs createseqfiledb DB DB_clu DB_clu_seq
mmseqs result2flat DB DB DB_clu_seq DB_clu_seq.fasta

# test
rm DB*
rm -r tmp
module load mmseqs2/14-7e284
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Test/mmseqs_cluster_test
mmseqs createdb combined.ffn DB
mmseqs cluster DB DB_clu tmp --cov-mode 1

#mmseqs cluster DB DB_clu tmp -s 7.5 --min-seq-id 0.600 --seq-id-mode 0 --min-aln-len 200 --cov-mode 0 -c 0.75 --similarity-type 2
#mmseqs cluster DB DB_clu tmp -s 7.5 --min-seq-id 0.600 --seq-id-mode 0 --min-aln-len 200 --cov-mode 0 -c 0.5 --similarity-type 2
mmseqs createtsv DB DB DB_clu DB_clu.tsv


# test (faa) 
rm DB*
rm -r tmp
module load mmseqs2/14-7e284
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Test/mmseqs_cluster_test
mmseqs createdb combined.faa DB
# mmseqs cluster DB DB_clu tmp --cov-mode 1
mmseqs cluster DB DB_clu tmp --min-seq-id 0.5 --cov-mode 1 -c 0.75  
mmseqs createtsv DB DB DB_clu DB_clu.tsv
# --max-seqs INT                  Maximum results per query sequence allowed to pass the prefilter (affects sensitivity) [20]

 
########## test with small dataset (good!) ##########

module load mmseqs2/14-7e284
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Test/small_dataset
mmseqs createdb combined.faa combined.faa.db
#mmseqs cluster combined.faa.db combined.faa.db.clu combined.faa.db.clu.tmp --threads 10 --min-seq-id 0.3 --cov-mode 1 -c 0.7 -s 7.5
#mmseqs cluster combined.faa.db combined.faa.db.clu combined.faa.db.clu.tmp --threads 10 --min-seq-id 0.3 --cov-mode 1 -c 0.7
mmseqs linclust combined.faa.db combined.faa.db.clu combined.faa.db.clu.tmp --threads 10 --min-seq-id 0.3 --cov-mode 1 -c 0.7
mmseqs createtsv combined.faa.db combined.faa.db combined.faa.db.clu mmseqs.tsv


##################################### mmseqs linclust ####################################

module load mmseqs2/14-7e284
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/NASA/mmseqs_linclust_test
mmseqs createdb combined.ffn combined.ffn.db --dbtype 2
mmseqs linclust combined.ffn.db combined.ffn.db.clu combined.ffn.db.clu.tmp --threads 12 --remove-tmp-files
mmseqs createtsv combined.ffn.db combined.ffn.db combined.ffn.db.clu combined.ffn.db.clu.tsv



module load usearch/11.0.667
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/NASA/mmseqs_linclust_test_faa
usearch -cluster_fast combined.faa -id 0.5 -uc usearch_clusters_0.5_t1.uc -sort length

usearch -usearch_global query.fasta -db proteins.udb -id 0.8 -alnout hits.aln


cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/NASA/usearch_global_test
usearch -makeudb_usearch combined.ffn -output combined.ffn.udb
usearch -usearch_global combined.ffn -db combined.ffn -id 0.75
usearch -usearch_local combined.ffn -db combined.ffn -id 0.75


# very slow
module load vsearch/2.22.1
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/NASA/vsearch_global_test
vsearch --makeudb_usearch combined.ffn --output combined.ffn.vdb
vsearch --usearch_global combined.ffn --db combined.ffn.vdb --self --id 0.6 --blast6out combined.ffn.blast6 --maxaccepts 0 --maxrejects 0

################################## mmseqs linclust (aa) ##################################

module load mmseqs2/14-7e284
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/NASA/mmseqs_linclust_test_faa
mmseqs createdb combined.faa combined.faa.db
mmseqs linclust combined.faa.db combined.faa.db.clu combined.faa.db.clu.tmp --threads 12 --remove-tmp-files --min-seq-id 0.600 --seq-id-mode 0 --min-aln-len 90 --cov-mode 0 -c 0.75 --similarity-type 2
mmseqs createtsv combined.faa.db combined.faa.db combined.faa.db.clu combined.faa.db.clu.tsv

#
module load usearch/11.0.667
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/NASA/mmseqs_linclust_test_faa
usearch -cluster_fast combined.faa -id 0.5 -uc usearch_clusters_0.5_t1.uc -sort length
