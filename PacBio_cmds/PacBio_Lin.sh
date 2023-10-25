# blasr
module load smrtlink/3.1.1
module load samtools/1.3.1

# fasta files
/srv/scratch/z5039045/Lin/ifs/Analysis_Results/m160514_211050_42208_c100951842550000001823213106251657_s1_X0.1.subreads.fasta
/srv/scratch/z5039045/Lin/ifs/Analysis_Results/m160514_211050_42208_c100951842550000001823213106251657_s1_X0.2.subreads.fasta
/srv/scratch/z5039045/Lin/ifs/Analysis_Results/m160514_211050_42208_c100951842550000001823213106251657_s1_X0.3.subreads.fasta

# mapping (https://github.com/PacificBiosciences/Bioinformatics-Training/wiki/Evaluating-Assemblies)
cd /srv/scratch/z5039045/Lin

blasr input.fofn CC6-YY-74.fasta -bestn 1 -sam -nproc 12 -out CC6-YY-74.sam
samtools view -bS CC6-YY-74.sam -o CC6-YY-74.bam
samtools sort CC6-YY-74.bam CC6-YY-74_sorted
samtools index CC6-YY-74_sorted.bam

blasr input.fofn CC6-YY-74_recircularise.fasta -bestn 1 -sam -nproc 12 -out CC6-YY-74_recircularise.sam
samtools view -bS CC6-YY-74_recircularise.sam -o CC6-YY-74_recircularise.bam
samtools sort CC6-YY-74_recircularise.bam CC6-YY-74_recircularise_sorted
samtools index CC6-YY-74_recircularise_sorted.bam
