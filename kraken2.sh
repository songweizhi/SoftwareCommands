
########################### annotate against standard database ###########################

module load kraken2/2.1.2
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/coral
kraken2 --db /data/bio/kraken2/kraken2_standard_db --output ctrl1_scaffolds_kraken2_hit.txt --report ctrl1_scaffolds_kraken2_report.txt --use-names --threads 12 ctrl1_scaffolds.fasta 


########################### annotate against protozoa database ###########################

# build protozoa database 
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/DB/kraken2
kraken2-build --download-library protozoa --db protozoa

# annotate against protozoa database 
module load kraken2/2.1.2
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/coral
kraken2 --db /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/DB/kraken2/protozoa --output ctrl1_scaffolds_kraken2_hit_protozoa.txt --report ctrl1_scaffolds_kraken2_report_protozoa.txt --use-names --threads 12 ctrl1_scaffolds.fasta 


##########################################################################################


/home-user/thliao/bin/kraken2

# db path: 
/mnt/maple/thliao/data/kraken2_db


https://ccb.jhu.edu/software/kraken/MANUAL.html



# from Tianhua
/home-user/thliao/bin/kraken2 --threads 30 --db /mnt/maple/thliao/data/kraken2_db --use-mpa-style --report CTRL1_R1.report /mnt/ivy/nxiang/practice/metagenome/comb_raw_merge_Sep13/CTRL1_R1_P_merge.fa > CTRL1_R1_classifications_2.txt 
