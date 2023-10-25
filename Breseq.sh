
######################################## run breseq #######################################

# annotate reference genome with Prokka (get gff file for reference sequence)
module load perl/5.28.0
module load infernal/1.1.2 
module load blast+/2.9.0 
module load hmmer/3.2.1
module load prodigal/2.6.3
module load tbl2asn/20200706
module load parallel/20190522 
module load aragorn/1.2.38 
module load bedtools/2.27.1
module load barrnap/0.9 
module load prokka/1.14.5
cd /srv/scratch/z5039045/Zillur
prokka --force --prefix GR1 --locustag GR1 --strain GR1 --outdir GR1 GR1.fasta


# run breseq with gff file
module load R/3.6.3
module load bowtie/2.3.5.1
module load samtools/1.10
module load breseq/0.35.4
cd /srv/scratch/z5039045/Zillur
breseq -r GR1.gff J17381_R1_Q25_P.fastq J17381_R2_Q25_P.fastq -o G1_gff_breseq -j 12


# output interpretation
# https://barricklab.org/twiki/pub/Lab/ToolsBacterialGenomeResequencing/documentation/output.html

##########################################################################################



























