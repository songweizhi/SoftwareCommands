
# /data/bio/busco/5/lineages/bacteria_odb10
# /data/bio/busco/5/lineages/eukaryota_odb10


module load metaeuk/20200908
module load prodigal/2.6.3
module load augustus/3.3.2
module load hmmer/3.3
module load blast+/2.11.0
module load python/3.8.2
module load sepp/4.3.10
module load busco/5.3.0

cd /srv/scratch/z5039045/Adaptive_Nanopore/binning/binning_separately/eukaryotic_contigs_min10000_p5_20220122_1443_4mer_0.7_cov
busco -i MyCC_MAGs -l /data/bio/busco/5/lineages/eukaryota_odb10 -o MyCC_MAGs_busco_wd -m genome --config /srv/scratch/z5039045/Softwares/busco_config.ini



# generate_plot.py









module load metaeuk/20200908
module load prodigal/2.6.3
module load augustus/3.3.2
module load hmmer/3.3
module load blast+/2.11.0
module load python/3.8.2
module load sepp/4.3.10
module load busco/5.3.0
cd /srv/scratch/z5039045/test_checkm
busco -i drep_14_1 -l /data/bio/busco/5/lineages/bacteria_odb10 -o drep_14_1_busco_wd_bacteria -m genome -f --config /srv/scratch/z5039045/Softwares/busco_config.ini
# Input_file	Dataset			Complete	Single	Duplicated	Fragmented	Missing	n_markers
# drep_14_1.fa	bacteria_odb10	72.6		36.3	36.3		21.8		5.6		124			
# 72.6 + 21.8 = 94.4

busco -i drep_14_1 -l /data/bio/busco/5/lineages/alphaproteobacteria_odb10 -o drep_14_1_busco_wd_alphaproteobacteria -m genome -f --config /srv/scratch/z5039045/Softwares/busco_config.ini
# Input_file	Dataset						Complete	Single	Duplicated	Fragmented	Missing	n_markers
# drep_14_1.fa	alphaproteobacteria_odb10	71.8		38.0	33.8		19.9		8.3		432			
# 71.8 + 19.9 = 91.7
