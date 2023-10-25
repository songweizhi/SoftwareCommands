# https://github.com/broadinstitute/pilon/wiki/Requirements-&-Usage


java -Xmx32G -jar /srv/scratch/z5039045/PacBio/pilon/pilon-1.18.jar --help




# files needed
/srv/scratch/z5039045/PacBio/raw_illumina_454_reads/
392_S6_L001_R1_001.fastq.gz       
392_S6_L001_R2_001.fastq.gz       
AD10_S4_L001_R1_001.fastq.gz    
AD10_S4_L001_R2_001.fastq.gz  
AD1_S5_L001_R1_001.fastq.gz
AD1_S5_L001_R2_001.fastq.gz
BL5_S3_L001_R1_001.fastq.gz
BL5_S3_L001_R2_001.fastq.gz
BL110_S2_L001_R1_001.fastq.gz
BL110_S2_L001_R2_001.fastq.gz
D2_454_raw_reads.fasta


/srv/scratch/z5039045/PacBio/pilon/genomes
AD10.fasta
AD1.fasta
AU392.fasta
BL110.fasta
BL5.fasta
D2.fasta


# index
module load bowtie/2.2.4
bowtie2-build -f /srv/scratch/z5039045/PacBio/pilon/genomes/AD10.fasta /srv/scratch/z5039045/PacBio/pilon/genomes/AD10&
bowtie2-build -f /srv/scratch/z5039045/PacBio/pilon/genomes/AD1.fasta /srv/scratch/z5039045/PacBio/pilon/genomes/AD1&
bowtie2-build -f /srv/scratch/z5039045/PacBio/pilon/genomes/AU392.fasta /srv/scratch/z5039045/PacBio/pilon/genomes/AU392&
bowtie2-build -f /srv/scratch/z5039045/PacBio/pilon/genomes/BL110.fasta /srv/scratch/z5039045/PacBio/pilon/genomes/BL110&
bowtie2-build -f /srv/scratch/z5039045/PacBio/pilon/genomes/BL5.fasta /srv/scratch/z5039045/PacBio/pilon/genomes/BL5&
bowtie2-build -f /srv/scratch/z5039045/PacBio/pilon/genomes/D2.fasta /srv/scratch/z5039045/PacBio/pilon/genomes/D2&


# align
bowtie2 -x /srv/scratch/z5039045/PacBio/pilon/genomes/AD10 -1 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/AD10_S4_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/AD10_S4_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/pilon/sams/AD10&
bowtie2 -x /srv/scratch/z5039045/PacBio/pilon/genomes/AD1 -1 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/AD1_S5_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/AD1_S5_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/pilon/sams/AD1&
bowtie2 -x /srv/scratch/z5039045/PacBio/pilon/genomes/AU392 -1 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/392_S6_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/392_S6_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/pilon/sams/AU392&
bowtie2 -x /srv/scratch/z5039045/PacBio/pilon/genomes/BL110 -1 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/BL110_S2_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/BL110_S2_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/pilon/sams/BL110&
bowtie2 -x /srv/scratch/z5039045/PacBio/pilon/genomes/BL5 -1 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/BL5_S3_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/BL5_S3_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/pilon/sams/BL5&
bowtie2 -x /srv/scratch/z5039045/PacBio/pilon/genomes/D2 -f /srv/scratch/z5039045/PacBio/raw_illumina_454_reads/D2_454_raw_reads.fasta -S /srv/scratch/z5039045/PacBio/pilon/sams/D2&


# sam2bam
module load samtools/1.2  
samtools view -bS /srv/scratch/z5039045/PacBio/pilon/sams/AD1 -o /srv/scratch/z5039045/PacBio/pilon/bams/AD1&
samtools view -bS /srv/scratch/z5039045/PacBio/pilon/sams/AD10 -o /srv/scratch/z5039045/PacBio/pilon/bams/AD10&
samtools view -bS /srv/scratch/z5039045/PacBio/pilon/sams/AU392 -o /srv/scratch/z5039045/PacBio/pilon/bams/AU392&
samtools view -bS /srv/scratch/z5039045/PacBio/pilon/sams/BL110 -o /srv/scratch/z5039045/PacBio/pilon/bams/BL110&
samtools view -bS /srv/scratch/z5039045/PacBio/pilon/sams/BL5 -o /srv/scratch/z5039045/PacBio/pilon/bams/BL5&
samtools view -bS /srv/scratch/z5039045/PacBio/pilon/sams/D2 -o /srv/scratch/z5039045/PacBio/pilon/bams/D2&


# sort bam
samtools sort /srv/scratch/z5039045/PacBio/pilon/bams/AD1 /srv/scratch/z5039045/PacBio/pilon/bams/AD1_sorted&
samtools sort /srv/scratch/z5039045/PacBio/pilon/bams/AD10 /srv/scratch/z5039045/PacBio/pilon/bams/AD10_sorted&
samtools sort /srv/scratch/z5039045/PacBio/pilon/bams/AU392 /srv/scratch/z5039045/PacBio/pilon/bams/AU392_sorted&
samtools sort /srv/scratch/z5039045/PacBio/pilon/bams/BL110 /srv/scratch/z5039045/PacBio/pilon/bams/BL110_sorted&
samtools sort /srv/scratch/z5039045/PacBio/pilon/bams/BL5 /srv/scratch/z5039045/PacBio/pilon/bams/BL5_sorted&
samtools sort /srv/scratch/z5039045/PacBio/pilon/bams/D2 /srv/scratch/z5039045/PacBio/pilon/bams/D2_sorted&


# get bai
samtools index /srv/scratch/z5039045/PacBio/pilon/bams/AD1_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/pilon/bams/AD10_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/pilon/bams/AU392_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/pilon/bams/BL110_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/pilon/bams/BL5_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/pilon/bams/D2_sorted.bam&


# pilon
java -Xmx32G -jar /srv/scratch/z5039045/PacBio/pilon/pilon-1.18.jar --genome /srv/scratch/z5039045/PacBio/pilon/genomes/AD10.fasta --bam /srv/scratch/z5039045/PacBio/pilon/bams/AD10_sorted.bam --output AD10 --outdir /srv/scratch/z5039045/PacBio/pilon/pilon_output --changes --vcf&
java -Xmx32G -jar /srv/scratch/z5039045/PacBio/pilon/pilon-1.18.jar --genome /srv/scratch/z5039045/PacBio/pilon/genomes/AD1.fasta --bam /srv/scratch/z5039045/PacBio/pilon/bams/AD1_sorted.bam --output AD1 --outdir /srv/scratch/z5039045/PacBio/pilon/pilon_output --changes --vcf&
java -Xmx32G -jar /srv/scratch/z5039045/PacBio/pilon/pilon-1.18.jar --genome /srv/scratch/z5039045/PacBio/pilon/genomes/AU392.fasta --bam /srv/scratch/z5039045/PacBio/pilon/bams/AU392_sorted.bam --output AU392 --outdir /srv/scratch/z5039045/PacBio/pilon/pilon_output --changes --vcf&
java -Xmx32G -jar /srv/scratch/z5039045/PacBio/pilon/pilon-1.18.jar --genome /srv/scratch/z5039045/PacBio/pilon/genomes/BL110.fasta --bam /srv/scratch/z5039045/PacBio/pilon/bams/BL110_sorted.bam --output BL110 --outdir /srv/scratch/z5039045/PacBio/pilon/pilon_output --changes --vcf&
java -Xmx32G -jar /srv/scratch/z5039045/PacBio/pilon/pilon-1.18.jar --genome /srv/scratch/z5039045/PacBio/pilon/genomes/BL5.fasta --bam /srv/scratch/z5039045/PacBio/pilon/bams/BL5_sorted.bam --output BL5 --outdir /srv/scratch/z5039045/PacBio/pilon/pilon_output --changes --vcf&
java -Xmx32G -jar /srv/scratch/z5039045/PacBio/pilon/pilon-1.18.jar --genome /srv/scratch/z5039045/PacBio/pilon/genomes/D2.fasta --bam /srv/scratch/z5039045/PacBio/pilon/bams/D2_sorted.bam --output D2 --outdir /srv/scratch/z5039045/PacBio/pilon/pilon_output --changes --vcf&

