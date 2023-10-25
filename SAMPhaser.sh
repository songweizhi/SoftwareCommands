
python /srv/scratch/z5039045/Softwares/SAMPhaser/code/samphaser.py -h




samtools faidx genome.fasta                          # Index genome
samtools view -bo genome.bam -S genome.sam"          # Convert SAM to BAM
samtools sort -@ 16 -f genome.bam genome.sort.bam    # Sort BAM file (16 threads)
samtools index -b genome.sort.bam                    # Index sorted BAM file
samtools mpileup -BQ0 -d10000000 -f genome.fasta genome.sort.bam > genome.pileup  # Make Pileup file.

python ~/slimsuite/tools/samphaser.py -seqin <genome.fasta> -pileup <genome.pileup>


