
##################################### install CheckM #####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3
pip3 install checkm-genome --upgrade --no-deps

checkm data setRoot /srv/scratch/z5039045/DB/CheckM


####################################### run CheckM #######################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3

cd /srv/scratch/z5039045/chloroflexi_genome
checkm lineage_wf MAG_files MAG_files_checkm_wd -f MAG_files_quality.txt -x fna -t 12
checkm lineage_wf BH_ER_050417_refined_bins BH_ER_050417_checkm_wd -f BH_ER_050417_refined_MAG_qualities.txt -x fasta -t 12
checkm lineage_wf GI_refined_bins GI_refined_bins_checkm_wd -f GI_refined_bins_quality.txt -x fasta -t 12


##########################################################################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3

cd /srv/scratch/z5039045/chloroflexi_genome
checkm lineage_wf 


###################################### heterogeneity######################################

# --aai_strain	 AAI threshold used to identify strain heterogeneity (default: 0.9)

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3
cd /srv/scratch/z5039045/test_checkm
checkm lineage_wf drep_14_1 drep_14_1_checkm_wd_0.5 -f drep_14_1_quality_0.5.txt -x fa -t 12 --aai_strain 0.5
checkm lineage_wf drep_14_1 drep_14_1_checkm_wd_0.6 -f drep_14_1_quality_0.6.txt -x fa -t 12 --aai_strain 0.6
checkm lineage_wf drep_14_1 drep_14_1_checkm_wd_0.7 -f drep_14_1_quality_0.7.txt -x fa -t 12 --aai_strain 0.7
checkm lineage_wf drep_14_1 drep_14_1_checkm_wd_0.8 -f drep_14_1_quality_0.8.txt -x fa -t 12 --aai_strain 0.8
checkm lineage_wf drep_14_1 drep_14_1_checkm_wd_0.9 -f drep_14_1_quality_0.9.txt -x fa -t 12 --aai_strain 0.9
checkm lineage_wf drep_14_1 drep_14_1_checkm_wd_0.95 -f drep_14_1_quality_0.95.txt -x fa -t 12 --aai_strain 0.95
checkm lineage_wf drep_14_1 drep_14_1_checkm_wd_1.0 -f drep_14_1_quality_1.0.txt -x fa -t 12 --aai_strain 1

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------
#      Bin Id         Marker lineage      # genomes   # markers   # marker sets   0   1    2    3   4   5+   Completeness   Contamination   Strain heterogeneity  
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------
# 0.5  drep_14_1   k__Bacteria (UID203)      5449        104            58        7   33   61   1   1   1       93.08           66.54              100.00         
# 0.6  drep_14_1   k__Bacteria (UID203)      5449        104            58        7   33   61   1   1   1       93.08           66.54              100.00         
# 0.7  drep_14_1   k__Bacteria (UID203)      5449        104            58        7   33   61   1   1   1       93.08           66.54              100.00         
# 0.8  drep_14_1   k__Bacteria (UID203)      5449        104            58        7   33   61   1   1   1       93.08           66.54              100.00         
# 0.9  drep_14_1   k__Bacteria (UID203)      5449        104            58        7   33   61   1   1   1       93.08           66.54              98.75
# 0.95 drep_14_1   k__Bacteria (UID203)      5449        104            58        7   33   61   1   1   1       93.08           66.54              95.00             
# 1.0  drep_14_1   k__Bacteria (UID203)      5449        104            58        7   33   61   1   1   1       93.08           66.54              0.00          
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------

# all plot are the same
checkm marker_plot drep_14_1_checkm_wd_0.5 drep_14_1 drep_14_1_checkm_wd_0.5 -x fa
checkm marker_plot drep_14_1_checkm_wd_0.6 drep_14_1 drep_14_1_checkm_wd_0.6 -x fa
checkm marker_plot drep_14_1_checkm_wd_0.7 drep_14_1 drep_14_1_checkm_wd_0.7 -x fa
checkm marker_plot drep_14_1_checkm_wd_0.8 drep_14_1 drep_14_1_checkm_wd_0.8 -x fa
checkm marker_plot drep_14_1_checkm_wd_0.9 drep_14_1 drep_14_1_checkm_wd_0.9 -x fa
checkm marker_plot drep_14_1_checkm_wd_1.0 drep_14_1 drep_14_1_checkm_wd_1.0 -x fa

# export sequences if identified markers
checkm qa drep_14_1_checkm_wd_0.9/lineage.ms drep_14_1_checkm_wd_0.9 -f drep_14_1_checkm_wd_0.9.fa -o 9


##########################################################################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving
checkm lineage_wf MetaWRAP_edge_bins_combined_only_reassembled MetaWRAP_edge_bins_combined_only_reassembled_checkm_wd_0.95 -f MetaWRAP_edge_bins_combined_only_reassembled_quality_aai0.95.txt -x fa -t 12 --aai_strain 0.95


##########################################################################################

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


##########################################################################################

# f__Maricaulaceae
module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3
cd /srv/scratch/z5039045/test
checkm lineage_wf f__Maricaulaceae_s_gnm_folder f__Maricaulaceae_s_gnm_folder_checkm_wd -f drep_14_1_quality_0.9.txt -x fna -t 12
checkm marker_plot f__Maricaulaceae_s_gnm_folder_checkm_wd f__Maricaulaceae_s_gnm_folder f__Maricaulaceae_s_gnm_folder_checkm_wd -x fna
checkm qa f__Maricaulaceae_s_gnm_folder_checkm_wd/lineage.ms f__Maricaulaceae_s_gnm_folder_checkm_wd -f f__Maricaulaceae_s_gnm_folder_checkm_wd.fa -o 9


##########################################################################################
