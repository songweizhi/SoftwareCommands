# From genomes to pangenomes: understanding variation among individuals and species (2017-03-09)
# http://digital.csic.es/bitstream/10261/146411/1/pangenome_workshop09032017.html

# Releases
# https://github.com/eead-csic-compbio/get_homologues/releases

# install
# refer to the manual


/srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20170918/get_homologues.pl -f 70 -t 3 -S 70 -E 1e-05 -C 70 -G -d input_gbk_5
/srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20170918/get_homologues.pl -f 70 -t 3 -S 70 -E 1e-05 -C 70 -G -d faa_files

# -f filter by %length difference within clusters			70
# -t report sequence clusters including at least t taxa		3
# -S min %sequence identity in BLAST query/subj pairs		70
# -E max E-value											1e-05
# -C min %coverage in BLAST pairwise alignments				70
# -G use COGtriangle algorithm (COGS, PubMed=20439257)		


module load blast+
/srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20170918/get_homologues.pl -f 70 -S 70 -E 1e-05 -C 70 -i test.faa



usearch -cluster_fast query.fasta -id 0.9 -centroids nr.fasta -uc clusters.uc

module load usearch/11.0.667
cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/BH_ER_050417_Matam16S_wd/test

module load usearch/11.0.667
usearch -cluster_fast test.faa -id 0.9 -centroids test_0.9.fasta -uc test_0.9.uc -sort length -quiet








#################### get_homologues #################### 
# no needed module
cd /srv/scratch/z5095298/Julie/SPONGES_FOR_TT_3/19_Prokka/MyCC/get_homologues
perl /srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20170918/get_homologues.pl -f 70 -t 1 -S 70 -E 1e-05 -C 70 -G -d input_gbks
ls /srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20170918/*
perl /srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20170918/compare_clusters.pl -d input_gbks_homologues/D6Cluster_f70_1taxa_algCOG_e0_E1e-05_C70_S70_ -o pangenome_structure -t 1
perl /srv/scratch/z5039045/Softwares/gh/get_homologues-x86_64-20170918/get_homologues.pl -f 70 -t 1 -S 70 -E 1e-05 -C 70 -G -d input_gbks -c
