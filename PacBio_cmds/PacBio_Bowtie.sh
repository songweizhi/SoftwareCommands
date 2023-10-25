#index
module load bowtie/2.2.9
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/AD10_Illumina.fas /srv/scratch/z5039045/PacBio/index_files/AD10_Illumina&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/AD10_PacBio.fas /srv/scratch/z5039045/PacBio/index_files/AD10_PacBio&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/AD1_Illumina.fas /srv/scratch/z5039045/PacBio/index_files/AD1_Illumina&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/AD1_PacBio.fas /srv/scratch/z5039045/PacBio/index_files/AD1_PacBio&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/AU392_Illumina.fas /srv/scratch/z5039045/PacBio/index_files/AU392_Illumina&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/AU392_PacBio.fas /srv/scratch/z5039045/PacBio/index_files/AU392_PacBio&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/BL110_Illumina.fas /srv/scratch/z5039045/PacBio/index_files/BL110_Illumina&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/BL110_PacBio.fas /srv/scratch/z5039045/PacBio/index_files/BL110_PacBio&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/BL5_Illumina.fas /srv/scratch/z5039045/PacBio/index_files/BL5_Illumina&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/BL5_PacBio.fas /srv/scratch/z5039045/PacBio/index_files/BL5_PacBio&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/D2_454.fas /srv/scratch/z5039045/PacBio/index_files/D2_454&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/D2_PacBio.fas /srv/scratch/z5039045/PacBio/index_files/D2_PacBio&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/LSS9_Illumina.fas /srv/scratch/z5039045/PacBio/index_files/LSS9_Illumina&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/LSS9_PacBio.fas /srv/scratch/z5039045/PacBio/index_files/LSS9_PacBio&

bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_0.fas /srv/scratch/z5039045/PacBio/index_files/unitig_0&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_32.fas /srv/scratch/z5039045/PacBio/index_files/unitig_32&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_46.fas /srv/scratch/z5039045/PacBio/index_files/unitig_46&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_51.fas /srv/scratch/z5039045/PacBio/index_files/unitig_51&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_8.fas /srv/scratch/z5039045/PacBio/index_files/unitig_8&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_2.fas /srv/scratch/z5039045/PacBio/index_files/unitig_2&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_34.fas /srv/scratch/z5039045/PacBio/index_files/unitig_34&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_48.fas /srv/scratch/z5039045/PacBio/index_files/unitig_48&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_54.fas /srv/scratch/z5039045/PacBio/index_files/unitig_54&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_3.fas /srv/scratch/z5039045/PacBio/index_files/unitig_3&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_4.fas /srv/scratch/z5039045/PacBio/index_files/unitig_4&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_5.fas /srv/scratch/z5039045/PacBio/index_files/unitig_5&
bowtie2-build -f /srv/scratch/z5039045/PacBio/index_files/unitig_6.fas /srv/scratch/z5039045/PacBio/index_files/unitig_6&




#align
cd /srv/scratch/z5039045/PacBio/raw_reads/
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/AD10_Illumina -1 /srv/scratch/z5039045/PacBio/raw_reads/AD10_S4_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/AD10_S4_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/AD10_Illumina
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/AD10_PacBio -1 /srv/scratch/z5039045/PacBio/raw_reads/AD10_S4_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/AD10_S4_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/AD10_PacBio
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/AD1_Illumina -1 /srv/scratch/z5039045/PacBio/raw_reads/AD1_S5_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/AD1_S5_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/AD1_Illumina
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/AD1_PacBio -1 /srv/scratch/z5039045/PacBio/raw_reads/AD1_S5_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/AD1_S5_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/AD1_PacBio
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/AU392_Illumina -1 /srv/scratch/z5039045/PacBio/raw_reads/392_S6_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/392_S6_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/AU392_Illumina
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/AU392_PacBio -1 /srv/scratch/z5039045/PacBio/raw_reads/392_S6_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/392_S6_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/AU392_PacBio
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/BL110_Illumina -1 /srv/scratch/z5039045/PacBio/raw_reads/BL110_S2_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/BL110_S2_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/BL110_Illumina
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/BL110_PacBio -1 /srv/scratch/z5039045/PacBio/raw_reads/BL110_S2_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/BL110_S2_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/BL110_PacBio
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/BL5_Illumina -1 /srv/scratch/z5039045/PacBio/raw_reads/BL5_S3_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/BL5_S3_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/BL5_Illumina
bowtie2 -X 1000 -x /srv/scratch/z5039045/PacBio/index_files/BL5_PacBio -1 /srv/scratch/z5039045/PacBio/raw_reads/BL5_S3_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/BL5_S3_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/BL5_PacBio
bowtie2 -x /srv/scratch/z5039045/PacBio/index_files/D2_454 -f /srv/scratch/z5039045/PacBio/raw_reads/D2_454_raw_reads.fasta -S /srv/scratch/z5039045/PacBio/sam_files/D2_454
bowtie2 -x /srv/scratch/z5039045/PacBio/index_files/D2_PacBio -f /srv/scratch/z5039045/PacBio/raw_reads/D2_454_raw_reads.fasta -S /srv/scratch/z5039045/PacBio/sam_files/D2_PacBio
bowtie2 -x /srv/scratch/z5039045/PacBio/index_files/AD10_PacBio -f /srv/scratch/z5039045/PacBio/genomes/AD10_Illumina.fas -S /srv/scratch/z5039045/PacBio/sam_files/AD10_c_c
bowtie2 -x /srv/scratch/z5039045/PacBio/index_files/AD1_PacBio -f /srv/scratch/z5039045/PacBio/genomes/AD1_Illumina.fas -S /srv/scratch/z5039045/PacBio/sam_files/AD1_c_c
bowtie2 -x /srv/scratch/z5039045/PacBio/index_files/AU392_PacBio -f /srv/scratch/z5039045/PacBio/genomes/AU392_Illumina.fas -S /srv/scratch/z5039045/PacBio/sam_files/AU392_c_c
bowtie2 -x /srv/scratch/z5039045/PacBio/index_files/BL110_PacBio -f /srv/scratch/z5039045/PacBio/genomes/BL110_Illumina.fas -S /srv/scratch/z5039045/PacBio/sam_files/BL110_c_c
bowtie2 -x /srv/scratch/z5039045/PacBio/index_files/BL5_PacBio -f /srv/scratch/z5039045/PacBio/genomes/BL5_Illumina.fas -S /srv/scratch/z5039045/PacBio/sam_files/BL5_c_c
bowtie2 -x /srv/scratch/z5039045/PacBio/index_files/D2_PacBio -f /srv/scratch/z5039045/PacBio/genomes/D2_454.fas -S /srv/scratch/z5039045/PacBio/sam_files/D2_c_c
bowtie2 -X 2000 -x /srv/scratch/z5039045/PacBio/index_files/AD10_PacBio -1 /srv/scratch/z5039045/PacBio/raw_reads/AD10_S4_L001_R1_001.fastq.gz -2 /srv/scratch/z5039045/PacBio/raw_reads/AD10_S4_L001_R2_001.fastq.gz -S /srv/scratch/z5039045/PacBio/sam_files/AD10_PacBio

bowtie2 -x MBARC26_2000 -f ../MBARC26_2000.fa -S MBARC26_2000.sam


#sam2bam
module load samtools/1.2
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/AD10_Illumina -o /srv/scratch/z5039045/PacBio/bam_files/AD10_Illumina
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/AD10_PacBio -o /srv/scratch/z5039045/PacBio/bam_files/AD10_PacBio
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/AD1_Illumina -o /srv/scratch/z5039045/PacBio/bam_files/AD1_Illumina
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/AD1_PacBio -o /srv/scratch/z5039045/PacBio/bam_files/AD1_PacBio
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/AU392_Illumina -o /srv/scratch/z5039045/PacBio/bam_files/AU392_Illumina
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/AU392_PacBio -o /srv/scratch/z5039045/PacBio/bam_files/AU392_PacBio
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/BL110_Illumina -o /srv/scratch/z5039045/PacBio/bam_files/BL110_Illumina
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/BL110_PacBio -o /srv/scratch/z5039045/PacBio/bam_files/BL110_PacBio
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/BL5_Illumina -o /srv/scratch/z5039045/PacBio/bam_files/BL5_Illumina
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/BL5_PacBio -o /srv/scratch/z5039045/PacBio/bam_files/BL5_PacBio
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/D2_454 -o /srv/scratch/z5039045/PacBio/bam_files/D2_454
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/D2_PacBio -o /srv/scratch/z5039045/PacBio/bam_files/D2_PacBio
samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/AD1_assembleed_sam -o /srv/scratch/z5039045/PacBio/bam_files/AD1_assembled

samtools view -bS /srv/scratch/z5039045/PacBio/sam_files/unitig_54 -o /srv/scratch/z5039045/PacBio/bam_files/unitig_54


#sort bam file
samtools sort /srv/scratch/z5039045/PacBio/bam_files/AD10_Illumina /srv/scratch/z5039045/PacBio/bam_files/AD10_Illumina_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/AD10_PacBio /srv/scratch/z5039045/PacBio/bam_files/AD10_PacBio_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/AD1_Illumina /srv/scratch/z5039045/PacBio/bam_files/AD1_Illumina_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/AD1_PacBio /srv/scratch/z5039045/PacBio/bam_files/AD1_PacBio_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/AU392_Illumina /srv/scratch/z5039045/PacBio/bam_files/AU392_Illumina_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/AU392_PacBio /srv/scratch/z5039045/PacBio/bam_files/AU392_PacBio_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/BL110_Illumina /srv/scratch/z5039045/PacBio/bam_files/BL110_Illumina_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/BL110_PacBio /srv/scratch/z5039045/PacBio/bam_files/BL110_PacBio_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/BL5_Illumina /srv/scratch/z5039045/PacBio/bam_files/BL5_Illumina_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/BL5_PacBio /srv/scratch/z5039045/PacBio/bam_files/BL5_PacBio_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/D2_454 /srv/scratch/z5039045/PacBio/bam_files/D2_454_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/D2_PacBio /srv/scratch/z5039045/PacBio/bam_files/D2_PacBio_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_files/AD1_assembled /srv/scratch/z5039045/PacBio/bam_files/AD1_assembled_sorted&

samtools sort /srv/scratch/z5039045/PacBio/bam_files/unitig_54 /srv/scratch/z5039045/PacBio/bam_files/unitig_54_sorted&
samtools sort /srv/scratch/z5039045/PacBio/bam_88_subsets/unitig_54.bam /srv/scratch/z5039045/PacBio/bam_88_subsets/unitig_54_sorted&

#get bai file
samtools index /srv/scratch/z5039045/PacBio/bam_files/AD10_Illumina_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/AD10_PacBio_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/AD1_Illumina_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/AD1_PacBio_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/AU392_Illumina_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/AU392_PacBio_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/BL110_Illumina_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/BL110_PacBio_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/BL5_Illumina_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/BL5_PacBio_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/D2_454_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/D2_PacBio_sorted.bam&
samtools index /srv/scratch/z5039045/PacBio/bam_files/AD1_assembled_sorted.bam&

samtools index /srv/scratch/z5039045/PacBio/bam_files/unitig_54_sorted.bam
samtools index /srv/scratch/z5039045/PacBio/bam_88_subsets/unitig_54_sorted.bam&


/srv/scratch/z5039045/PacBio/illumina_sequences/AD10_fastqc 





samtools bam2fq -nO -s /srv/scratch/z5039045/PacBio/bam_88_subsets/unitig_54.fastq /srv/scratch/z5039045/PacBio/bam_88_subsets/unitig_54_sorted.bam