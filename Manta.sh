
######################################## run Manta (failed) #######################################

module load bowtie/2.3.5.1
module load samtools/1.10
cd /srv/scratch/z5039045/Zillur

# index reference for bowtie2 (mapping)
bowtie2-build -f GR1.fasta GR1.fasta

# mapping reads to reference 
bowtie2 -x GR1 -1 J17381_R1_Q25_P.fastq -2 J17381_R2_Q25_P.fastq -S GR1.sam -p 12 --no-unal

# convert sam to bam
samtools view -bS GR1.sam -o GR1.bam
samtools sort GR1.bam -o GR1_sorted.bam
samtools index GR1_sorted.bam
rm GR1.sam
rm GR1.bam

# index reference for manta
samtools faidx GR1.fasta

# get manta config file
module load python/2.7.15
module load manta/1.4.0
configManta.py --bam GR1_sorted.bam --referenceFasta GR1.fasta --runDir G1_manta_wd
/srv/scratch/z5039045/Zillur/G1_manta_wd/runWorkflow.py -m local

