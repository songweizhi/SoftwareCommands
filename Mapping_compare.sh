module load java/8u121
module load bbmap/38.51
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/mapping_test

bowtie2 -x ref/combined_16S -1 combined_5x_R1.fasta -2 combined_5x_R2.fasta -S combined_5x_default.sam -p 6 -f --local --no-unal 
bowtie2 -x ref/combined_16S -1 combined_5x_R1.fasta -2 combined_5x_R2.fasta -S combined_5x_all.sam -p 6 -f --local --no-unal -a
bowtie2 -x ref/combined_16S -1 combined_5x_R1.fasta -2 combined_5x_R2.fasta -S combined_5x.sam -p 6 -f --local --no-unal -k 1


bbmap.sh ref=ref/combined_16S.ffn in=combined_5x_R1.fasta in2=combined_5x_R1.fasta local=t ambig=toss outm=combined_5x_bbmap.sam
