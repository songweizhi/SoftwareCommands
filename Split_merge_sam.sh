
module load samtools/1.7


# split sam
samtools view -b 12D42.bam 2.10_chromosome > 12D42_2.10_chromosome.bam
samtools view -b 12D42.bam 2.10_plasmid1 > 12D42_2.10_plasmid1.bam
samtools view -b 12D42.bam 2.10_plasmid2 > 12D42_2.10_plasmid2.bam
samtools view -b 12D42.bam 2.10_plasmid3 > 12D42_2.10_plasmid3.bam
samtools view -b 12D42.bam D2_c > 12D42_D2_c.bam
samtools view -b 12D42.bam D2_p > 12D42_D2_p.bam


# index bam files
samtools index 12D42_2.10_chromosome.bam
samtools index 12D42_2.10_plasmid1.bam
samtools index 12D42_2.10_plasmid2.bam
samtools index 12D42_2.10_plasmid3.bam
samtools index 12D42_D2_c.bam
samtools index 12D42_D2_p.bam


# merge bam files
samtools merge 12D42_D2.bam 12D42_D2_c.bam 12D42_D2_p.bam
samtools index 12D42_D2.bam



