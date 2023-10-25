
################################### 1 Quality Control #################################### 

# BBAY68, BBAY69 and BBAY70 are three replicate bacterial communities isolated from 
# the surface of the marine alga Caulerpa filiformis (Roth-Schulze et al., 2016). 
# The paired-end sequence data was generated on an Illumina HiSeq2000 platform.

# raw reads of three replicates (there will be 10 fastq files in your case)
BBAY68_R1.fastq 
BBAY68_R2.fastq
BBAY69_R1.fastq 
BBAY69_R2.fastq
BBAY70_R1.fastq 
BBAY70_R2.fastq

# run trimmomatic to remove adapter sequences and bad quality reads
module load java/8u121
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE BBAY68_R1.fastq BBAY68_R2.fastq BBAY68_R1_Q20_P.fastq BBAY68_R1_Q20_UP.fastq BBAY68_R2_Q20_P.fastq BBAY68_R2_Q20_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:30 MINLEN:50
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE BBAY69_R1.fastq BBAY69_R2.fastq BBAY69_R1_Q20_P.fastq BBAY69_R1_Q20_UP.fastq BBAY69_R2_Q20_P.fastq BBAY69_R2_Q20_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:30 MINLEN:50
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE BBAY70_R1.fastq BBAY70_R2.fastq BBAY70_R1_Q20_P.fastq BBAY70_R1_Q20_UP.fastq BBAY70_R2_Q20_P.fastq BBAY70_R2_Q20_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:30 MINLEN:50

# run fastqc to check the quaities of filtered reads
module load fastqc/0.11.8
fastqc BBAY68_R1_Q30_P.fastq 
fastqc BBAY68_R2_Q30_P.fastq
fastqc BBAY69_R1_Q30_P.fastq 
fastqc BBAY69_R2_Q30_P.fastq
fastqc BBAY70_R1_Q30_P.fastq 
fastqc BBAY70_R2_Q30_P.fastq


############################### 2 Assemble with metaspades ############################### 

# combine the three first reads files (there will be 5 first reads files in your case)
cat BBAY68_R1_Q30_P.fastq BBAY69_R1_Q30_P.fastq BBAY70_R1_Q30_P.fastq > BBAY68_69_70_R1.fastq

# combine the three second reads files (there will be 5 second reads files in your case)
cat BBAY68_R2_Q30_P.fastq BBAY69_R2_Q30_P.fastq BBAY70_R2_Q30_P.fastq > BBAY68_69_70_R2.fastq

# run spades
module load spades/3.12.0
cd /srv/scratch/z5039045/HgtSIM/metaspades
spades.py --meta -1 BBAY68_69_70_R1.fastq -2 BBAY68_69_70_R2.fastq -o BBAY68_69_70_spades_wd -k 21,33,55,75,99,127


# remove short contigs (2500bp) from the scaffold.fa file with the select_contig.pl script
perl select_contig.pl -m 2500 scaffolds.fasta BBAY68_69_70_K20-100_scaffold_lt2500.fa

# get contig statistics with get_fasta_stats.pl scripts
perl get_fasta_stats.pl -T BBAY68_69_70_K20-100_scaffold_lt2500.fa


####################################### 3 Mapping ######################################## 

# index assemblies with bowtie2
module load bowtie/2.3.5.1
bowtie2-build -f BBAY68_69_70_K20-100_scaffold_lt2500.fa BBAY68_69_70_K20-100_scaffold_lt2500

# mapping with bowtie2
module load bowtie/2.3.5.1
bowtie2 -x BBAY68_69_70_K20-100_scaffold_lt2500 -1 BBAY68_R1_Q30_P.fastq -2 BBAY68_R2_Q30_P.fastq -S BBAY68.sam -p 6 -q
bowtie2 -x BBAY68_69_70_K20-100_scaffold_lt2500 -1 BBAY69_R1_Q30_P.fastq -2 BBAY69_R2_Q30_P.fastq -S BBAY69.sam -p 6 -q
bowtie2 -x BBAY68_69_70_K20-100_scaffold_lt2500 -1 BBAY70_R1_Q30_P.fastq -2 BBAY70_R2_Q30_P.fastq -S BBAY70.sam -p 6 -q

# convert sam files to bam files with samtools
module load samtools/1.10
samtools view -bS BBAY68.sam -o BBAY68.bam
samtools view -bS BBAY69.sam -o BBAY69.bam
samtools view -bS BBAY70.sam -o BBAY70.bam

# sort bam files with samtools
samtools sort BBAY68.bam -o BBAY68_sorted.bam
samtools sort BBAY69.bam -o BBAY69_sorted.bam
samtools sort BBAY70.bam -o BBAY70_sorted.bam

# index sorted bam files with samtools
samtools index BBAY68_sorted.bam
samtools index BBAY69_sorted.bam
samtools index BBAY70_sorted.bam


######################################## 4 Binning #######################################

# get depth file with Metabat (if your reads are paire-end, your might want to provide the "--pairedContigs" argument) 
module load metabat/2.12.1
jgi_summarize_bam_contig_depths --outputDepth BBAY68_69_70_depth.txt --pairedContigs BBAY68_69_70_paired.txt BBAY68_sorted.bam BBAY69_sorted.bam BBAY70_sorted.bam

# run MetaBAT
module load metabat/2.12.1
metabat -i BBAY68_69_70_K20-100_scaffold_lt2500.fa -a BBAY68_69_70_depth.txt -p depth/BBAY68_69_70_paired.txt -o BBAY68_69_70

# run MyCC
module load python/2.7.15
module load perl/5.28.0
module load bedtools/2.27.1
module load hmmer/3.3
module load barrnap/0.9
module load aragorn/1.2.38
module load cdhit/4.6.8
module load parallel/20200722
module load prodigal/2.6.3
module load mycc/20170301
MyCC.py BBAY68_69_70_K20-100_scaffold_lt2500.fa -a BBAY68_69_70_depth.txt 56mer


############################# 5 Binning_refiner (or DAS_tool) ############################ 

# refine genome bins
Binning_refiner -i input_bin_folder -p Refined -plot
# input folder example
# https://github.com/songweizhi/Binning_refiner/tree/master/examples/input_bin_folder

# get the quality of refined genome bins with CheckM
module load python/2.7.8
module load hmmer/3.1b2
module load pplacer/1.1.alpha16
module load prodigal/2.6.3
checkm lineage_wf <bin folder> <output folder>


############################### gene prediction with Prokka ############################## 

module load perl/5.28.0
module load infernal/1.1.2 
module load blast+/2.9.0 
module load hmmer/3.2.1
module load prodigal/2.6.3
module load tbl2asn/25.8
module load parallel/20190522 
module load aragorn/1.2.38 
module load bedtools/2.27.1
module load barrnap/0.9 
module load prokka/1.14.5
prokka --force --prefix Refined_mag1 --locustag Refined_mag1 --outdir Refined_mag1 Refined_mag1.fasta --cpus 6
prokka --force --prefix Refined_mag2 --locustag Refined_mag2 --outdir Refined_mag2 Refined_mag2.fasta --cpus 6
prokka --force --prefix Refined_mag3 --locustag Refined_mag3 --outdir Refined_mag3 Refined_mag3.fasta --cpus 6


####################################### annotation ####################################### 

# functional annotation with COG, KEGG and Pfam/TIGRFAM databases
