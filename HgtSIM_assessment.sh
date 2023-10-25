
######################################## identity ########################################

# GemSIM
cd /srv/scratch/z5039045/HgtSIM/identities/70
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R input_genomes -a abundance.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o iden70 -q 33 -u d -s 30 -n 10000000 -l d -p

cd /srv/scratch/z5039045/HgtSIM/identities/75
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R input_genomes -a abundance.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o iden75 -q 33 -u d -s 30 -n 10000000 -l d -p

cd /srv/scratch/z5039045/HgtSIM/identities/80
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R input_genomes -a abundance.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o iden80 -q 33 -u d -s 30 -n 10000000 -l d -p

cd /srv/scratch/z5039045/HgtSIM/identities/85
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R input_genomes -a abundance.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o iden85 -q 33 -u d -s 30 -n 10000000 -l d -p

cd /srv/scratch/z5039045/HgtSIM/identities/90
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R input_genomes -a abundance.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o iden90 -q 33 -u d -s 30 -n 10000000 -l d -p

cd /srv/scratch/z5039045/HgtSIM/identities/95
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R input_genomes -a abundance.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o iden95 -q 33 -u d -s 30 -n 10000000 -l d -p

cd /srv/scratch/z5039045/HgtSIM/identities/100
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R input_genomes -a abundance.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o iden100 -q 33 -u d -s 30 -n 10000000 -l d -p


# trimmomatic
module load java/8u91
module load fastqc/0.10.1

java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE iden70_fir.fastq iden70_sec.fastq iden70_fir_Q30_P.fastq iden70_fir_Q30_UP.fastq iden70_sec_Q30_P.fastq iden70_sec_Q30_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 HEADCROP:22 SLIDINGWINDOW:6:30 MINLEN:50

cd /srv/scratch/z5039045/HgtSIM/identities/75
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE iden75_fir.fastq iden75_sec.fastq iden75_fir_Q30_P.fastq iden75_fir_Q30_UP.fastq iden75_sec_Q30_P.fastq iden75_sec_Q30_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 HEADCROP:22 SLIDINGWINDOW:6:30 MINLEN:50
fastqc iden75_fir_Q30_P.fastq
fastqc iden75_sec_Q30_P.fastq

cd /srv/scratch/z5039045/HgtSIM/identities/80
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE iden80_fir.fastq iden80_sec.fastq iden80_fir_Q30_P.fastq iden80_fir_Q30_UP.fastq iden80_sec_Q30_P.fastq iden80_sec_Q30_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 HEADCROP:22 SLIDINGWINDOW:6:30 MINLEN:50
fastqc iden80_fir_Q30_P.fastq
fastqc iden80_sec_Q30_P.fastq

cd /srv/scratch/z5039045/HgtSIM/identities/85
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE iden85_fir.fastq iden85_sec.fastq iden85_fir_Q30_P.fastq iden85_fir_Q30_UP.fastq iden85_sec_Q30_P.fastq iden85_sec_Q30_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 HEADCROP:22 SLIDINGWINDOW:6:30 MINLEN:50
fastqc iden85_fir_Q30_P.fastq
fastqc iden85_sec_Q30_P.fastq

cd /srv/scratch/z5039045/HgtSIM/identities/90
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE iden90_fir.fastq iden90_sec.fastq iden90_fir_Q30_P.fastq iden90_fir_Q30_UP.fastq iden90_sec_Q30_P.fastq iden90_sec_Q30_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 HEADCROP:22 SLIDINGWINDOW:6:30 MINLEN:50
fastqc iden90_fir_Q30_P.fastq
fastqc iden90_sec_Q30_P.fastq

cd /srv/scratch/z5039045/HgtSIM/identities/95
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE iden95_fir.fastq iden95_sec.fastq iden95_fir_Q30_P.fastq iden95_fir_Q30_UP.fastq iden95_sec_Q30_P.fastq iden95_sec_Q30_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 HEADCROP:22 SLIDINGWINDOW:6:30 MINLEN:50
fastqc iden95_fir_Q30_P.fastq
fastqc iden95_sec_Q30_P.fastq

cd /srv/scratch/z5039045/HgtSIM/identities/100
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE iden100_fir.fastq iden100_sec.fastq iden100_fir_Q30_P.fastq iden100_fir_Q30_UP.fastq iden100_sec_Q30_P.fastq iden100_sec_Q30_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 HEADCROP:22 SLIDINGWINDOW:6:30 MINLEN:50
fastqc iden100_fir_Q30_P.fastq
fastqc iden100_sec_Q30_P.fastq


# Assemble

module load idba/1.1.1

# fq2fa
cd /srv/scratch/z5039045/HgtSIM/identities/70 
fq2fa --merge iden70_fir_Q30_P.fastq iden70_sec_Q30_P.fastq iden70.fasta

cd /srv/scratch/z5039045/HgtSIM/identities/75
fq2fa --merge iden75_fir_Q30_P.fastq iden75_sec_Q30_P.fastq iden75.fasta

cd /srv/scratch/z5039045/HgtSIM/identities/80
fq2fa --merge iden80_fir_Q30_P.fastq iden80_sec_Q30_P.fastq iden80.fasta

cd /srv/scratch/z5039045/HgtSIM/identities/85
fq2fa --merge iden85_fir_Q30_P.fastq iden85_sec_Q30_P.fastq iden85.fasta

cd /srv/scratch/z5039045/HgtSIM/identities/90
fq2fa --merge iden90_fir_Q30_P.fastq iden90_sec_Q30_P.fastq iden90.fasta

cd /srv/scratch/z5039045/HgtSIM/identities/95
fq2fa --merge iden95_fir_Q30_P.fastq iden95_sec_Q30_P.fastq iden95.fasta

cd /srv/scratch/z5039045/HgtSIM/identities/100
fq2fa --merge iden100_fir_Q30_P.fastq iden100_sec_Q30_P.fastq iden100.fasta


# transfer data to raijin
scp /srv/scratch/z5039045/HgtSIM/identities/70/iden70.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/70
scp /srv/scratch/z5039045/HgtSIM/identities/75/iden75.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/75
scp /srv/scratch/z5039045/HgtSIM/identities/80/iden80.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/80
scp /srv/scratch/z5039045/HgtSIM/identities/85/iden85.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/85
scp /srv/scratch/z5039045/HgtSIM/identities/90/iden90.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/90
scp /srv/scratch/z5039045/HgtSIM/identities/95/iden95.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/95
scp /srv/scratch/z5039045/HgtSIM/identities/100/iden100.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/100


# run idba_ud
cd /short/du5/wzs561/HgtSIM/70
/short/du5/wzs561/idba-master/bin/idba_ud --pre_correction --num_threads 14 --mink 20 --maxk 124 --step 20 --read iden70.fasta --out iden70_k20-124
 
cd /short/du5/wzs561/HgtSIM/75
/short/du5/wzs561/idba-master/bin/idba_ud --pre_correction --num_threads 14 --mink 20 --maxk 124 --step 20 --read iden75.fasta --out iden75_k20-124

cd /short/du5/wzs561/HgtSIM/80
/short/du5/wzs561/idba-master/bin/idba_ud --pre_correction --num_threads 14 --mink 20 --maxk 124 --step 20 --read iden80.fasta --out iden80_k20-124

cd /short/du5/wzs561/HgtSIM/85
/short/du5/wzs561/idba-master/bin/idba_ud --pre_correction --num_threads 14 --mink 20 --maxk 124 --step 20 --read iden85.fasta --out iden85_k20-124

cd /short/du5/wzs561/HgtSIM/90
/short/du5/wzs561/idba-master/bin/idba_ud --pre_correction --num_threads 14 --mink 20 --maxk 124 --step 20 --read iden90.fasta --out iden90_k20-124

cd /short/du5/wzs561/HgtSIM/95
/short/du5/wzs561/idba-master/bin/idba_ud --pre_correction --num_threads 14 --mink 20 --maxk 124 --step 20 --read iden95.fasta --out iden95_k20-124

cd /short/du5/wzs561/HgtSIM/100
/short/du5/wzs561/idba-master/bin/idba_ud --pre_correction --num_threads 14 --mink 20 --maxk 124 --step 20 --read iden100.fasta --out iden100_k20-124



# remove short contigs
cd /srv/scratch/z5039045/HgtSIM/identities/70/iden70_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden70_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T scaffold_iden70_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities/75/iden75_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden75_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T scaffold_iden75_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities/80/iden80_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden80_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T scaffold_iden80_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities/85/iden85_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden85_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T scaffold_iden85_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities/90/iden90_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden90_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T scaffold_iden90_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities/95/iden95_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden95_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T scaffold_iden95_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities/100/iden100_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden100_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T scaffold_iden100_lt2500.fa


# get the number of IDBA_UD recovered transfer events 
module load python/3.5.2
module load blast+/2.2.31

cd /srv/scratch/z5039045/HgtSIM/identities_1/70/iden70_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden70_lt2500.fa -t input_sequence_mutant_nc.fasta
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
79
80

cd /srv/scratch/z5039045/HgtSIM/identities_1/75/iden75_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden75_lt2500.fa -t input_sequence_mutant_nc.fasta
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
76
76

cd /srv/scratch/z5039045/HgtSIM/identities_1/80/iden80_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden80_lt2500.fa -t input_sequence_mutant_nc.fasta
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
73
73

cd /srv/scratch/z5039045/HgtSIM/identities_1/85/iden85_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden85_lt2500.fa -t input_sequence_mutant_nc.fasta
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
70
71

cd /srv/scratch/z5039045/HgtSIM/identities_1/90/iden90_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden90_lt2500.fa -t input_sequence_mutant_nc.fasta
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
53
53

cd /srv/scratch/z5039045/HgtSIM/identities_1/95/iden95_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden95_lt2500.fa -t input_sequence_mutant_nc.fasta
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
21
21

cd /srv/scratch/z5039045/HgtSIM/identities_1/100/iden100_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden100_lt2500.fa -t input_sequence_mutant_nc.fasta
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
56
59





# identity_2

# run GemSIM (Step 1-1)
module load python/3.5.2

cd /srv/scratch/z5039045/HgtSIM/identities_2/70 
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/75
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/80
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/85
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/90
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/95
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/100
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg GemSIM_config.txt 


# run FastQC (Step 1-2)
cd /srv/scratch/z5039045/HgtSIM/identities_2/70 
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/75
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/80
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/85
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/90
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/95
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg GemSIM_config.txt 

cd /srv/scratch/z5039045/HgtSIM/identities_2/100
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg GemSIM_config.txt 


# run IDBA_UD (Step 2)
cd /srv/scratch/z5039045/HgtSIM/identities_2/70 
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg GemSIM_config.txt -qsub

cd /srv/scratch/z5039045/HgtSIM/identities_2/75
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg GemSIM_config.txt -qsub

cd /srv/scratch/z5039045/HgtSIM/identities_2/80
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg GemSIM_config.txt -qsub

cd /srv/scratch/z5039045/HgtSIM/identities_2/85
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg GemSIM_config.txt -qsub

cd /srv/scratch/z5039045/HgtSIM/identities_2/90
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg GemSIM_config.txt -qsub

cd /srv/scratch/z5039045/HgtSIM/identities_2/95
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg GemSIM_config.txt -qsub

cd /srv/scratch/z5039045/HgtSIM/identities_2/100
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg GemSIM_config.txt -qsub


# copy files to raijin
scp /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/combined.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/70/iden70.fasta
scp /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/combined.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/75/iden75.fasta
scp /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/combined.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/80/iden80.fasta
scp /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/combined.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/85/iden85.fasta
scp /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/combined.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/90/iden90.fasta
scp /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/95/iden95.fasta
scp /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/combined.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/100/iden100.fasta


# copy assemblies to Katana
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/70/iden70_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/75/iden75_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/80/iden80_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/85/iden85_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/90/iden90_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/95/iden95_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/100/iden100_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/combined_k20-124


# remove short contigs
cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/combined_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden70_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/combined_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden75_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/combined_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden80_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/combined_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden85_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/combined_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden90_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden95_lt2500.fa

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/combined_k20-124
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 scaffold.fa scaffold_iden100_lt2500.fa


# get the number of IDBA_UD recovered transfer events 
module load python/3.5.2
module load blast+/2.2.31

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/combined_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden70_lt2500.fa -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/combined_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden75_lt2500.fa -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/combined_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden80_lt2500.fa -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/combined_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden85_lt2500.fa -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/combined_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden90_lt2500.fa -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden95_lt2500.fa -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/combined_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold_iden100_lt2500.fa -t input_sequence_mutant_nc.fasta


####################################### identity 3 ##############################################


# input_genomes from identities_2
# abundance.txt from identities_1

# 
cp -r identities_2/70/input_genomes identities_3/70/ &
cp -r identities_2/75/input_genomes identities_3/75/ &
cp -r identities_2/80/input_genomes identities_3/80/ &
cp -r identities_2/85/input_genomes identities_3/85/ &
cp -r identities_2/90/input_genomes identities_3/90/ &
cp -r identities_2/95/input_genomes identities_3/95/ &
cp -r identities_2/100/input_genomes identities_3/100/ &

cp identities_1/70/abundance.txt identities_3/70/ &
cp identities_1/75/abundance.txt identities_3/75/ &
cp identities_1/80/abundance.txt identities_3/80/ &
cp identities_1/85/abundance.txt identities_3/85/ &
cp identities_1/90/abundance.txt identities_3/90/ &
cp identities_1/95/abundance.txt identities_3/95/ &
cp identities_1/100/abundance.txt identities_3/100/ &

# run GemSIM
cp identities_1/70/qsub_GemSIM_iden70.sh identities_3/70/ &
cp identities_1/75/qsub_GemSIM_iden75.sh identities_3/75/ &
cp identities_1/80/qsub_GemSIM_iden80.sh identities_3/80/ &
cp identities_1/85/qsub_GemSIM_iden85.sh identities_3/85/ &
cp identities_1/90/qsub_GemSIM_iden90.sh identities_3/90/ &
cp identities_1/95/qsub_GemSIM_iden95.sh identities_3/95/ &
cp identities_1/100/qsub_GemSIM_iden100.sh identities_3/100/ &

# run QC
cp identities_1/70/qsub_QC_iden70.sh identities_3/70/ &
cp identities_1/75/qsub_QC_iden75.sh identities_3/75/ &
cp identities_1/80/qsub_QC_iden80.sh identities_3/80/ &
cp identities_1/85/qsub_QC_iden85.sh identities_3/85/ &
cp identities_1/90/qsub_QC_iden90.sh identities_3/90/ &
cp identities_1/95/qsub_QC_iden95.sh identities_3/95/ &
cp identities_1/100/qsub_QC_iden100.sh identities_3/100/ &

# run IDBA_UD
cp identities_1/70/qsub_idba_ud_iden70.sh identities_3/70/ &
cp identities_1/75/qsub_idba_ud_iden75.sh identities_3/75/ &
cp identities_1/80/qsub_idba_ud_iden80.sh identities_3/80/ &
cp identities_1/85/qsub_idba_ud_iden85.sh identities_3/85/ &
cp identities_1/90/qsub_idba_ud_iden90.sh identities_3/90/ &
cp identities_1/95/qsub_idba_ud_iden95.sh identities_3/95/ &
cp identities_1/100/qsub_idba_ud_iden100.sh identities_3/100/ &

# copy assemblies to Katana
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/70/iden70_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/75/iden75_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/80/iden80_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/85/iden85_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/90/iden90_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/95/iden95_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined_k20-124
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/100/iden100_k20-124/scaffold.fa /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/combined_k20-124


scp -r wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/70/iden70_* /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/
scp -r wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/75/iden75_* /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/
scp -r wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/80/iden80_* /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/
scp -r wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/85/iden85_* /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/
scp -r wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/90/iden90_* /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/
scp -r wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/95/iden95_* /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/
scp -r wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/100/iden100_* /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/


cp 70/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 70/2_IDBA_UD/iden70_k20-50/ &
cp 70/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 70/2_IDBA_UD/iden70_k20-124/ &
cp 70/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 70/2_IDBA_UD/iden70_k60-90/ &
cp 70/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 70/2_IDBA_UD/iden70_k90-124/ &
cp 70/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 70/2_IDBA_UD/iden70_k40-70 &
cp 70/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 70/2_IDBA_UD/iden70_k60-100 &
cp 70/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 70/2_IDBA_UD/iden70_k60-120 &
cp 70/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 70/2_IDBA_UD/iden70_k80-110 &

cp 75/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 75/2_IDBA_UD/iden75_k40-70 &
cp 75/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 75/2_IDBA_UD/iden75_k60-100 &
cp 75/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 75/2_IDBA_UD/iden75_k60-120 &
cp 75/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 75/2_IDBA_UD/iden75_k80-110 &
cp 75/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 75/2_IDBA_UD/iden75_k20-50/ &
cp 75/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 75/2_IDBA_UD/iden75_k20-124/ &
cp 75/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 75/2_IDBA_UD/iden75_k60-90/ &
cp 75/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 75/2_IDBA_UD/iden75_k90-124/ &

cp 80/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 80/2_IDBA_UD/iden80_k40-70 &
cp 80/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 80/2_IDBA_UD/iden80_k60-100 &
cp 80/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 80/2_IDBA_UD/iden80_k60-120 &
cp 80/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 80/2_IDBA_UD/iden80_k80-110 &
cp 80/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 80/2_IDBA_UD/iden80_k20-50/ &
cp 80/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 80/2_IDBA_UD/iden80_k20-124/ &
cp 80/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 80/2_IDBA_UD/iden80_k60-90/ &
cp 80/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 80/2_IDBA_UD/iden80_k90-124/ &

cp 85/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 85/2_IDBA_UD/iden85_k40-70 &
cp 85/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 85/2_IDBA_UD/iden85_k60-100 &
cp 85/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 85/2_IDBA_UD/iden85_k60-120 &
cp 85/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 85/2_IDBA_UD/iden85_k80-110 &
cp 85/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 85/2_IDBA_UD/iden85_k20-50/ &
cp 85/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 85/2_IDBA_UD/iden85_k20-124/ &
cp 85/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 85/2_IDBA_UD/iden85_k60-90/ &
cp 85/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 85/2_IDBA_UD/iden85_k90-124/ &

cp 90/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 90/2_IDBA_UD/iden90_k40-70 &
cp 90/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 90/2_IDBA_UD/iden90_k60-100 &
cp 90/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 90/2_IDBA_UD/iden90_k60-120 &
cp 90/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 90/2_IDBA_UD/iden90_k80-110 &
cp 90/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 90/2_IDBA_UD/iden90_k20-50/ &
cp 90/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 90/2_IDBA_UD/iden90_k20-124/ &
cp 90/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 90/2_IDBA_UD/iden90_k60-90/ &
cp 90/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 90/2_IDBA_UD/iden90_k90-124/ &

cp 95/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 95/2_IDBA_UD/iden95_k40-70 &
cp 95/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 95/2_IDBA_UD/iden95_k60-100 &
cp 95/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 95/2_IDBA_UD/iden95_k60-120 &
cp 95/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 95/2_IDBA_UD/iden95_k80-110 &
cp 95/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 95/2_IDBA_UD/iden95_k20-50/ &
cp 95/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 95/2_IDBA_UD/iden95_k20-124/ &
cp 95/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 95/2_IDBA_UD/iden95_k60-90/ &
cp 95/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 95/2_IDBA_UD/iden95_k90-124/ &

cp 100/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 100/2_IDBA_UD/iden100_k40-70 &
cp 100/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 100/2_IDBA_UD/iden100_k60-100 &
cp 100/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 100/2_IDBA_UD/iden100_k60-120 &
cp 100/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 100/2_IDBA_UD/iden100_k80-110 &
cp 100/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 100/2_IDBA_UD/iden100_k20-50/ &
cp 100/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 100/2_IDBA_UD/iden100_k20-124/ &
cp 100/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 100/2_IDBA_UD/iden100_k60-90/ &
cp 100/2_IDBA_UD/combined_k20-124/input_sequence_mutant_nc.fasta 100/2_IDBA_UD/iden100_k90-124/ &


# get the number of IDBA_UD recovered transfer events 
module load python/3.5.2
module load blast+/2.2.31

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
0
cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
6
cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
0
cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
25


cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
0
cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
6
cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
7
cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
90


cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
0
cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
9
cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
52
cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
96


cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
0
cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
10
cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
85
cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
98


cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
0
cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
3
cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
96
cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
98


cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
0
cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
9
cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
99
cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
99


cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
0
cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
32
cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
9
cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta
14







cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000


cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

#################################### flanking regions ####################################

module load python/3.5.2

# run Prokka for output genomes with flanking regions
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/70
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/75
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/80
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/85
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/90
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/95
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/100
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

# combine ffn files
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/70
cat prokka_output/*/*.ffn > combined_iden70.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/75
cat prokka_output/*/*.ffn > combined_iden75.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/80
cat prokka_output/*/*.ffn > combined_iden80.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/85
cat prokka_output/*/*.ffn > combined_iden85.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/90
cat prokka_output/*/*.ffn > combined_iden90.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/95
cat prokka_output/*/*.ffn > combined_iden95.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/100
cat prokka_output/*/*.ffn > combined_iden100.ffn

# get the number of Prokka recovered transfer events 
module load blast+/2.2.31
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/70
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden70.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/75
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden75.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/80
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden80.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/85
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden85.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/90
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden90.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/95
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden95.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/with_flanking_sequences/100
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden100.ffn -t input_sequence_mutant_nc.fasta


TAGATGAGTGATTAGTTAGTTA


# simulate transfers without flanking regions
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 100 -lf 0 -rf 0 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 95 -lf 0 -rf 0 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 90 -lf 0 -rf 0 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 85 -lf 0 -rf 0 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 80 -lf 0 -rf 0 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 75 -lf 0 -rf 0 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 70 -lf 0 -rf 0 &

# run Prokka for output genomes without flanking regions
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/70
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/75
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/80
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/85
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/90
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/95
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/100
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna


# combine ffn files
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/70
cat prokka_output/*/*.ffn > combined_iden70.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/75
cat prokka_output/*/*.ffn > combined_iden75.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/80
cat prokka_output/*/*.ffn > combined_iden80.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/85
cat prokka_output/*/*.ffn > combined_iden85.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/90
cat prokka_output/*/*.ffn > combined_iden90.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/95
cat prokka_output/*/*.ffn > combined_iden95.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/100
cat prokka_output/*/*.ffn > combined_iden100.ffn



# get the number of Prokka recovered transfer events 
module load blast+/2.2.31
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/70
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden70.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/75
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden75.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/80
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden80.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/85
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden85.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/90
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden90.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/95
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden95.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/without_flanking_sequences/100
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden100.ffn -t input_sequence_mutant_nc.fasta




# new flanking
#new_1
TAGATAGATGAGGGGGGGGGGTTAGTTAGTTA
#new_2
TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA

# simulate transfers with new flanking sequences
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 100 -lf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA -rf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 95 -lf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA -rf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 90 -lf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA -rf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 85 -lf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA -rf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 80 -lf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA -rf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 75 -lf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA -rf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 70 -lf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA -rf TAATTAAATAACCCCCCCCCCGGGGGGGGGGTTATTTAATTA &

# run Prokka for output genomes with new flanking regions
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/70
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/75
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/80
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/85
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/90
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/95
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/100
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Genomes_with_transfers -genome_extension fna

# combine ffn files
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/70
cat prokka_output/*/*.ffn > combined_iden70.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/75
cat prokka_output/*/*.ffn > combined_iden75.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/80
cat prokka_output/*/*.ffn > combined_iden80.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/85
cat prokka_output/*/*.ffn > combined_iden85.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/90
cat prokka_output/*/*.ffn > combined_iden90.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/95
cat prokka_output/*/*.ffn > combined_iden95.ffn

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/100
cat prokka_output/*/*.ffn > combined_iden100.ffn

# get the number of Prokka recovered transfer events 
module load blast+/2.2.31
cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/70
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden70.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/75
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden75.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/80
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden80.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/85
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden85.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/90
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden90.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/95
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden95.ffn -t input_sequence_mutant_nc.fasta

cd /srv/scratch/z5039045/HgtSIM/flanking_sequences/new_flanking_sequences_2/100
python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden100.ffn -t input_sequence_mutant_nc.fasta

python3 /srv/scratch/z5039045/HgtSIM/Prokka_recovered_transfers.py -a combined_iden95.ffn -t output_sequence_nc_95.fasta



python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 90 -lf 0 -rf 0




#################################### sequencing depth ####################################

# copy files to raijin
scp /srv/scratch/z5039045/HgtSIM/identities_3/70/iden70.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/depth_3time_higher/70/
scp /srv/scratch/z5039045/HgtSIM/identities_3/75/iden75.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/depth_3time_higher/75/
scp /srv/scratch/z5039045/HgtSIM/identities_3/80/iden80.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/depth_3time_higher/80/
scp /srv/scratch/z5039045/HgtSIM/identities_3/85/iden85.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/depth_3time_higher/85/
scp /srv/scratch/z5039045/HgtSIM/identities_3/90/iden90.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/depth_3time_higher/90/
scp /srv/scratch/z5039045/HgtSIM/identities_3/95/iden95.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/depth_3time_higher/95/
scp /srv/scratch/z5039045/HgtSIM/identities_3/100/iden100.fasta wzs561@raijin.nci.org.au:/short/du5/wzs561/HgtSIM/depth_3time_higher/100/














# new Aug 30, 2017

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 0

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000


cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k40-70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k60-100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k60-120
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k80-110
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k20-50
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k20-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k60-90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1









