
##########################################################################################

# Install whatshap with Conda
conda create -n whatshap_env2 whatshap
conda install -n whatshap_env2 -c bioconda whatshap=1.6

conda activate whatshap_env2
# conda install -c bioconda freebayes
whatshap -h

# run freebayes
conda activate whatshap_env2
freebayes -h

# run whatshap
conda activate whatshap_env2
whatshap -h
whatshap phase -o phased.vcf --reference=reference.fasta input.vcf input.bam
whatshap haplotag -h


##########################################################################################

# bin.3.fa
module load python/3.7.3
source ~/mypython3env/bin/activate
module load minimap2/2.22
module load samtools/1.15
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving/00_reassemble_wd/metawrap_50_5_bins_remaining_reads_min0bp_dir/flye_reassemble_wd_bin.3
minimap2 -d assembly.fasta.mmi assembly.fasta
minimap2 -t 12 -a assembly.fasta.mmi ../bin.3_reads_min0bp.fastq > assembly.sam 
BioSAK sam2bam -sam assembly.sam -t 12

# run freebayes
deactivate
module purge
conda activate whatshap_env2
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving/00_reassemble_wd/metawrap_50_5_bins_remaining_reads_min0bp_dir/flye_reassemble_wd_bin.3
freebayes -f assembly.fasta assembly_sorted.bam > assembly.var.vcf
#freebayes -f assembly.fasta -r contig_69 assembly_sorted.bam > contig_69.var.vcf
BioSAK exe_cmds -c freebayes_cmds.txt -t 12
cat contig.var.vcf.files/*vcf > combined.contig.var.vcf

# run whatshap
conda activate whatshap_env2
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving/00_reassemble_wd/metawrap_50_5_bins_remaining_reads_min0bp_dir/flye_reassemble_wd_bin.3
whatshap phase -o combined.contig.var.phased.vcf.TEST --reference=assembly.fasta combined.contig.var.formatted.vcf assembly_sorted.bam
whatshap phase -o combined.contig.var.phased.vcf --reference=assembly.fasta contig.var.vcf.files/contig_1.var.vcf assembly_sorted.bam

whatshap phase -o contig_1.var.phased.vcf --reference=assembly.fasta contig.var.vcf.files/contig_1.var.vcf assembly_sorted.bam
whatshap phase -o contig_21.var.phased.vcf --reference=assembly.fasta contig.var.vcf.files/contig_21.var.vcf assembly_sorted.bam









