
################################### with Shan's dataset ##################################

# fq2fa
module load idba/1.1.3 
cd /srv/scratch/z5039045/link_16S_MAG/Shan
fq2fa ST13_R1_P.fastq ST13_R1_P.fasta
fq2fa ST13_R2_P.fastq ST13_R2_P.fasta

# rename paired reads 
BioSAK rename_reads_for_Reago -in ST13_R1_P.fasta -out ST13_R1_P_renamed.fasta -p ST13 -d 1
BioSAK rename_reads_for_Reago -in ST13_R2_P.fasta -out ST13_R2_P_renamed.fasta -p ST13 -d 2

# map paired reads to Matam assembled 16S sequences
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/link_16S_MAG/Shan/ST13_matam_assembly_fq
bowtie2-build -f scaffolds.NR.min_500bp.abd.fa scaffolds.NR.min_500bp.abd
bowtie2 -x scaffolds.NR.min_500bp.abd -1 ../ST13_R1_P_renamed.fasta -2 ../ST13_R2_P_renamed.fasta -S mapped_to_16S_no-unal.sam -f --local --no-unal

# test on a simulated dataset
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/link_16S_MAG/simulated
bowtie2-build -f 16S_seq.fasta 16S_seq
bowtie2 -x 16S_seq -1 reads_R1.fasta -2 reads_R2.fasta -S simulated_mapped_to_16S_no-unal.sam -f --local --no-unal


################################### with Jadi's dataset ##################################

# copy data
cd /srv/scratch/z5039045/link_16S_MAG/Jadi_data
cp -r /home/z5039045/torsten/tahsin/jadi2018/2R/2R2 ./
cp -r /home/z5039045/torsten/tahsin/jadi2018/MAGbins/2R/2R2/Refined_outputs/Refined_bins ./

# QC reads
module load java/8u121
module load trimmomatic/0.38
module load fastqc/0.11.8
cd /srv/scratch/z5039045/link_16S_MAG/Jadi_data/2R2
gunzip 2R2_S1_L001_R1_001.fastq.gz
gunzip 2R2_S1_L001_R2_001.fastq.gz
gunzip 2R2_S1_L002_R1_001.fastq.gz
gunzip 2R2_S1_L002_R2_001.fastq.gz
gunzip 2R2_S1_L003_R1_001.fastq.gz
gunzip 2R2_S1_L003_R2_001.fastq.gz
gunzip 2R2_S1_L004_R1_001.fastq.gz
gunzip 2R2_S1_L004_R2_001.fastq.gz
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE 2R2_S1_L001_R1_001.fastq 2R2_S1_L001_R2_001.fastq 2R2_S1_L001_R1_001_Q30_P.fastq 2R2_S1_L001_R1_001_Q30_UP.fastq 2R2_S1_L001_R2_001_Q30_P.fastq 2R2_S1_L001_R2_001_Q30_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:30 TRAILING:30 CROP:135 HEADCROP:20 SLIDINGWINDOW:6:30 MINLEN:36
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE 2R2_S1_L002_R1_001.fastq 2R2_S1_L002_R2_001.fastq 2R2_S1_L002_R1_001_Q30_P.fastq 2R2_S1_L002_R1_001_Q30_UP.fastq 2R2_S1_L002_R2_001_Q30_P.fastq 2R2_S1_L002_R2_001_Q30_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:30 TRAILING:30 CROP:135 HEADCROP:20 SLIDINGWINDOW:6:30 MINLEN:36
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE 2R2_S1_L003_R1_001.fastq 2R2_S1_L003_R2_001.fastq 2R2_S1_L003_R1_001_Q30_P.fastq 2R2_S1_L003_R1_001_Q30_UP.fastq 2R2_S1_L003_R2_001_Q30_P.fastq 2R2_S1_L003_R2_001_Q30_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:30 TRAILING:30 CROP:135 HEADCROP:20 SLIDINGWINDOW:6:30 MINLEN:36
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE 2R2_S1_L004_R1_001.fastq 2R2_S1_L004_R2_001.fastq 2R2_S1_L004_R1_001_Q30_P.fastq 2R2_S1_L004_R1_001_Q30_UP.fastq 2R2_S1_L004_R2_001_Q30_P.fastq 2R2_S1_L004_R2_001_Q30_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:30 TRAILING:30 CROP:135 HEADCROP:20 SLIDINGWINDOW:6:30 MINLEN:36
fastqc 2R2_S1_L001_R1_001_Q30_P.fastq 2R2_S1_L001_R2_001_Q30_P.fastq
fastqc 2R2_S1_L002_R1_001_Q30_P.fastq 2R2_S1_L002_R2_001_Q30_P.fastq
fastqc 2R2_S1_L003_R1_001_Q30_P.fastq 2R2_S1_L003_R2_001_Q30_P.fastq
fastqc 2R2_S1_L004_R1_001_Q30_P.fastq 2R2_S1_L004_R2_001_Q30_P.fastq

# fq2fa
module load idba/1.1.3
cd /srv/scratch/z5039045/link_16S_MAG/Jadi_data/2R2
fq2fa 2R2_S1_L001_R1_001_Q30_P.fastq 2R2_S1_L001_R1_001_Q30_P.fasta
fq2fa 2R2_S1_L001_R2_001_Q30_P.fastq 2R2_S1_L001_R2_001_Q30_P.fasta
fq2fa 2R2_S1_L002_R1_001_Q30_P.fastq 2R2_S1_L002_R1_001_Q30_P.fasta
fq2fa 2R2_S1_L002_R2_001_Q30_P.fastq 2R2_S1_L002_R2_001_Q30_P.fasta
fq2fa 2R2_S1_L003_R1_001_Q30_P.fastq 2R2_S1_L003_R1_001_Q30_P.fasta
fq2fa 2R2_S1_L003_R2_001_Q30_P.fastq 2R2_S1_L003_R2_001_Q30_P.fasta
fq2fa 2R2_S1_L004_R1_001_Q30_P.fastq 2R2_S1_L004_R1_001_Q30_P.fasta
fq2fa 2R2_S1_L004_R2_001_Q30_P.fastq 2R2_S1_L004_R2_001_Q30_P.fasta

# rename paired reads 
module load python/3.7.3
source ~/mypython3env/bin/activate
cd /srv/scratch/z5039045/link_16S_MAG/Jadi_data/2R2
BioSAK rename_reads_for_Reago -in 2R2_S1_L001_R1_001_Q30_P.fasta -out 2R2_S1_L001_R1_001_Q30_P_renamed.fasta -p 2R2_S1_L001 -d 1
BioSAK rename_reads_for_Reago -in 2R2_S1_L001_R2_001_Q30_P.fasta -out 2R2_S1_L001_R2_001_Q30_P_renamed.fasta -p 2R2_S1_L001 -d 2
BioSAK rename_reads_for_Reago -in 2R2_S1_L002_R1_001_Q30_P.fasta -out 2R2_S1_L002_R1_001_Q30_P_renamed.fasta -p 2R2_S1_L002 -d 1
BioSAK rename_reads_for_Reago -in 2R2_S1_L002_R2_001_Q30_P.fasta -out 2R2_S1_L002_R2_001_Q30_P_renamed.fasta -p 2R2_S1_L002 -d 2
BioSAK rename_reads_for_Reago -in 2R2_S1_L003_R1_001_Q30_P.fasta -out 2R2_S1_L003_R1_001_Q30_P_renamed.fasta -p 2R2_S1_L003 -d 1
BioSAK rename_reads_for_Reago -in 2R2_S1_L003_R2_001_Q30_P.fasta -out 2R2_S1_L003_R2_001_Q30_P_renamed.fasta -p 2R2_S1_L003 -d 2
BioSAK rename_reads_for_Reago -in 2R2_S1_L004_R1_001_Q30_P.fasta -out 2R2_S1_L004_R1_001_Q30_P_renamed.fasta -p 2R2_S1_L004 -d 1
BioSAK rename_reads_for_Reago -in 2R2_S1_L004_R2_001_Q30_P.fasta -out 2R2_S1_L004_R2_001_Q30_P_renamed.fasta -p 2R2_S1_L004 -d 2

# combine reads
cat 2R2_S1_L001_R1_001_Q30_P_renamed.fasta 2R2_S1_L002_R1_001_Q30_P_renamed.fasta 2R2_S1_L003_R1_001_Q30_P_renamed.fasta 2R2_S1_L004_R1_001_Q30_P_renamed.fasta > 2R2_R1_Q30_P_renamed.fasta
cat 2R2_S1_L001_R2_001_Q30_P_renamed.fasta 2R2_S1_L002_R2_001_Q30_P_renamed.fasta 2R2_S1_L003_R2_001_Q30_P_renamed.fasta 2R2_S1_L004_R2_001_Q30_P_renamed.fasta > 2R2_R2_Q30_P_renamed.fasta

# run link_16S_MAG
module unload R
module load R/4.0.2
module load blast+/2.9.0
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/link_16S_MAG/Jadi_data
BioSAK link_16S_MAG -p 2R2 -r1 2R2_reads/2R2_R1_Q30_P_renamed.fasta -r2 2R2_reads/2R2_R2_Q30_P_renamed.fasta -m 16S/09_DenoisedSequences/AllSamples_denoised.fasta -mag Refined_bins -x fasta -t 12 -tmp











