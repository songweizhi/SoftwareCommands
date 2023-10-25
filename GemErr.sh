# 
module load python/2.7.9
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R input_genomes -a abundance_1.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o replicate_1 -q 33 -u d -s 30 -n 10000000 -l d -p

# trimmomatic
module load java/8u91 
cd /srv/scratch/z5039045/error_model/2_QC
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE Y2591_R1.fastq Y2591_R2.fastq Y2591_R1_Q20_P.fastq Y2591_R1_Q20_UP.fastq Y2591_R2_Q20_P.fastq Y2591_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 CROP:235 HEADCROP:20 SLIDINGWINDOW:6:20 MINLEN:50



# run fastqc to check the quaities of filtered reads
# https://biof-edu.colorado.edu/videos/dowell-short-read-class/day-4/fastqc-manual
module load fastqc/0.10.1
fastqc Y2591_R1_Q20_P.fastq &
fastqc Y2591_R2_Q20_P.fastq &
fastqc Y2591_R1_Q20_UP.fastq &
fastqc Y2591_R2_Q20_UP.fastq &
fastqc Y2591_R1.fastq
fastqc Y2591_R2.fastq


# filter with CROP:240 HEADCROP:25
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE Y2591_R1.fastq Y2591_R2.fastq Y2591_R1_P.fastq Y2591_R1_UP.fastq Y2591_R2_P.fastq Y2591_R2_UP.fastq CROP:240 HEADCROP:25 MINLEN:50

fastqc Y2591_R1_P.fastq &
fastqc Y2591_R2_P.fastq &

# idba_ud
module load idba/1.1.1
fq2fa --merge Y2591_R1_Q20_P.fastq Y2591_R2_Q20_P.fastq Y2591_Q20.fasta

# remove short contigs
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 2500 Y2591_scaffold.fa Y2591_scaffold_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T Y2591_scaffold_lt2500.fa 

# mapping with bowtie2
module load bowtie/2.2.9

# index assemblies
bowtie2-build -f Y2591_scaffold_lt2500.fa Y2591_scaffold_lt2500

# mapping
bowtie2 -x Y2591_scaffold_lt2500 -1 Y2591_R1_P.fastq -2 Y2591_R2_P.fastq -S Y2591.sam -q








# convert sam files to bam files
samtools view -bS Y2591.sam -o Y2591.bam

# sort bam files with samtools
samtools sort Y2591.bam Y2591_sorted

# index sorted bam files with samtools
samtools index Y2591_sorted.bam




