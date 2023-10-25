# Working directory
cd /srv/scratch/z5039045/PacBio/Falcon/BS107_2.10


# Copy 210WT.samphased.fasta and 210WT.samphased.sam to working directory
cp /srv/scratch/z3452659/ThomasPacBio-Nov15/analysis/2017-07-09.SAMPhasedBLASR/210WT.samphased.fasta .
cp /srv/scratch/z3452659/ThomasPacBio-Nov15/analysis/2017-07-09.SAMPhasedBLASR/210WT.samphased.sam .


# Get bam and bai file for visualization with Tablet
module load samtools/1.2
samtools view -bS 210WT.samphased.sam -o 210WT.samphased.bam
samtools sort 210WT.samphased.bam 210WT.samphased_sorted.bam
samtools index 210WT.samphased_sorted.bam


# The genome assignment of contigs in file 210WT.samphased.fasta
Ctg_ID			Assignment	Purity(%)	Length(bp)
ctg210WT		2.10		99.88		3758221
ctg210WTp1		2.10		99.76		237764
ctg210WTp3		2.10		97.25		70382
ctg210WTN2		BS107		99.96		1234841
ctg210WTN4		BS107		99.98		1150623
ctg210WTN1		BS107		99.88		794630
ctg210WTN3		BS107		100.0		456367
ctg210WTp1N1	BS107		100.0		117649
ctg210WTp1N2	BS107		100.0		95429
ctg210WTp3N		BS107		99.83		68114
ctg210WTp2		Ambiguous	46.07(from 2.10)	94479
ctg210WTp2N		Ambiguous	57.2(from 2.10)	94471


# Get reads not mapped to 2.10 contigs (ctg210WT, ctg210WTp1 and ctg210WTp3)
module load python/3.5.2
python3 get_reads_from_sam.py -sam 210WT.samphased.sam -ctg ctgs_assigned_to_2.10.txt -option 0 -out reads_not_mapped_to_2.10_ctgs.fasta

# Get reads mapped to 2.10 contigs (ctg210WT, ctg210WTp1 and ctg210WTp3)
python3 get_reads_from_sam.py -sam 210WT.samphased.sam -ctg ctgs_assigned_to_2.10.txt -option 1 -out reads_mapped_to_2.10_ctgs.fasta


# get_reads_from_sam.py help information
usage: get_reads_from_sam.py [-h] -sam SAM -ctgs CTGS -option OPTION -out OUT
arguments:
  -sam            Input sam file
  -ctgs           Contig list
  -option         '0' to export unmapped reads, '1' to export mapped reads
  -out            Output fasta file
  