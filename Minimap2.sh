
module load minimap2/2.22

cd /srv/scratch/z5039045/Adaptive_Nanopore/Minimap_wd
minimap2 -d assembly_min10000.fasta.mmi assembly_min10000.fasta
minimap2 -a assembly_min10000.fasta.mmi combined_pass.fastq > assembly_min10000.sam 



module load minimap2/2.22
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd12_flye_wd/binning_wd_nonEukaryota/nonEukaryota_MetaWRAP_50_5_wd/metawrap_50_5_bin11
minimap2 -d bin.11.fa.mmi bin.11.fa
minimap2 -a bin.11.fa.mmi /srv/scratch/z5039045/Adaptive_Nanopore/combined_pass_rd12_trimmed50bp.fastq > bin.11.sam 

minimap2 -t 12 --secondary=no -a assembly.fa.mmi reads_min5000bp.fastq > assembly.fa.no.secondary.sam 



