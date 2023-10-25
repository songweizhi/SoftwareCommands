
# Unicycler (NOT for metagenome, Unicycler is designed exclusively for bacterial isolates!!!)
# Give Unicycler both Illumina reads and long reads, and it will conduct a short-read-first hybrid assembly.

module load python/3.7.3
module load blast+/2.11.0
module load java/8u231-jre
module load gcc/4.9.4
module load bowtie/2.3.5.1
module load samtools/1.13
module load spades/3.15.0
module load pilon/1.24
module load racon/1.4.5
module load unicycler/0.4.7
cd /srv/scratch/z5039045/Adaptive_Nanopore
unicycler -1 Illumina_R1.fastq -2 Illumina_R2.fastq -l combined_pass_trimmed50bp.fastq -s Illumina_UP.fastq -o Unicycler_hybrid_assembly_wd -t 12

