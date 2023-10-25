
module load java/8u201-jdk
module load picard/2.18.26

java -jar /apps/picard/2.18.26/picard.jar 
java -jar /apps/picard/2.18.26/picard.jar CollectHsMetrics


java -jar /apps/picard/2.18.26/picard.jar CollectHsMetrics 
R=
I=
O=

# all
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/get_cp_num/GI_0902_35_15_mapc10_all_get_16S_cp_num_wd
R=/srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/GI_0830_iden99_MarkerMAG_wd/GI_128_16S_0.999_polished_min1200bp_c99.0.fasta
I=GI_0902_35_15_mapc10_all_linked_16S_2_50_both_random_sorted.sam
O=GI_0902_35_15_mapc10_all_linked_16S_2_50_both_random_sorted.txt

# linked
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/get_cp_num/GI_0902_35_15_mapc10_linked_get_16S_cp_num_wd

java -jar /apps/picard/2.18.26/picard.jar CollectHsMetrics R=GI_0902_35_15_mapc10_linked_linked_16s.fa I=GI_0902_35_15_mapc10_linked_linked_16S_2_50_both_random_sorted.sam O=GI_0902_35_15_mapc10_linked_linked_16S_2_50_both_random_sorted.txt
