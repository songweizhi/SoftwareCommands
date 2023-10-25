
module load salmon/1.2.1
salmon index -t Trinity.fasta -i Trinity_fasta_index -p 12
salmon quant -i Trinity_fasta_index -1 reads1.fastq -2 reads2.fastq -o transcripts_quant --validateMappings --libType A

