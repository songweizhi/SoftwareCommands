
###################################### install dRep ######################################

# install drep
module load python/3.7.4
source ~/mypython3env/bin/activate
pip install drep
pip install --upgrade drep


######################################## run dRep ########################################

module purge
module load python/3.7.4
source ~/mypython3env/bin/activate
module load perl/5.36.0
module load prodigal/2.6.3
module load mash/2.3-gcc-8.5.0
module load mummer/3.23
module load fastani/1.33
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Sponge_2023_08_25/s1_get_genome
dRep dereplicate Nitrosopumilaceae_50_5_GTDB_NCBI_367_Sponge_dRep99_wd -g Nitrosopumilaceae_50_5_GTDB_NCBI_367_Sponge/*.fasta -pa 0.9 -sa 0.99 --genomeInfo Nitrosopumilaceae_50_5_GTDB_NCBI_367_Sponge_quality.txt -comp 50 -p 12


# run dereplication
dRep dereplicate Tara_NM_dRep97_wd -g Tara_NM/*.fa -pa 0.9 -sa 0.97 --genomeInfo Tara_NM_CheckM_0.4_0.05.csv -comp 50 -p 12
dRep dereplicate Tara_NM_dRep99_wd -g Tara_NM/*.fa -pa 0.9 -sa 0.99 --genomeInfo Tara_NM_CheckM_0.4_0.05.csv -comp 50 -p 12


cd /srv/scratch/z5039045/chloroflexi_genome/drep_test
dRep dereplicate Test_dRep99_wd -g genomes/*.fna -pa 0.9 -sa 0.99 --genomeInfo quality_checkm.txt -comp 50 -p 12


cd /srv/scratch/z5039045/Adaptive_Nanopore/Chris_MAGs
dRep dereplicate All_MAGs_dRep97_wd -g all_together/*.fa -pa 0.9 -sa 0.97 --genomeInfo mag_info.txt -comp 50 -p 12
dRep dereplicate All_MAGs_dRep99_wd -g all_together/*.fa -pa 0.9 -sa 0.99 --genomeInfo mag_info.txt -comp 50 -p 12


# format of genome quality information
genome,completeness,contamination
Enterococcus_casseliflavus_EC20.fasta,98.28,0.0
Enterococcus_faecalis_T2.fna,98.28,0.0
Enterococcus_faecalis_TX0104.fa,96.55,0.0
Enterococcus_faecalis_YI6-1.fna,98.28,0.0
Escherichia_coli_Sakai.fna,100.0,0.0


########################################## CUHK ##########################################

# conda config --add channels bioconda
# conda install drep
# conda install fastani 
# 
# 
# cd /home-user/wzsong/Tests
# rm -r 2_combined_genomes_dRep99_wd
# dRep dereplicate 2_combined_genomes_dRep99_wd -g 2_combined_genomes/*.fna -pa 0.9 -sa 0.99 --genomeInfo 2_combined_genomes_quality.txt.txt -comp 50 -p 12
# 

########################################## Mac ###########################################

cd /Users/songweizhi/Documents/Research/Sponge_Hologenome
dRep dereplicate 2_combined_genomes_dRep99_wd -g 2_combined_genomes/*.fna -pa 0.9 -sa 0.99 --genomeInfo 2_combined_genomes_quality.txt.txt -comp 50 -p 12




