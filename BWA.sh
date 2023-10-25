
module load bwa/0.7.17 
bwa



cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/Kelp_0.999_aa_MarkerMAG_wd/Kelp_0.999_aa_step_1_wd/bwa_test
bwa index BH_ER_050417_assembled_16S_uclust_0.999.fasta

bwa mem BH_ER_050417_assembled_16S_uclust_0.999.fasta ../../../Kelp_R1.fasta ../../../Kelp_R2.fasta > test_bwa.sam

./bwa mem ref.fa read-se.fq.gz | gzip -3 > aln-se.sam.gz
./bwa mem ref.fa read1.fq read2.fq | gzip -3 > aln-pe.sam.gz


bowtie2 -x BH_ER_050417_assembled_16S_uclust_0.999 -1 ../../../Kelp_R1.fasta -2 ../../../Kelp_R2.fasta -S test_1_very_sensitive.sam -f -a --local --no-unal --quiet --threads 12 --very-sensitive-local













