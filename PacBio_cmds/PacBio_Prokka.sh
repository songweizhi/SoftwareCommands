# Commands for Prokka

module load perl/5.20.1
module load prokka/1.11
module load infernal/1.1.1
module load blast+/2.2.31
module load hmmer/3.1b2
module load prodigal/2.6.3
module load tbl2asn/24.9

prokka --force --locustag AD1 --outdir /srv/scratch/z5039045/PacBio/prokka/AD1 /srv/scratch/z5039045/PacBio/prokka/input_genome/AD1.fasta&
prokka --force --locustag AD10 --outdir /srv/scratch/z5039045/PacBio/prokka/AD10 /srv/scratch/z5039045/PacBio/prokka/input_genome/AD10.fasta&
prokka --force --locustag AU392 --outdir /srv/scratch/z5039045/PacBio/prokka/AU392 /srv/scratch/z5039045/PacBio/prokka/input_genome/AU392.fasta&
prokka --force --locustag BL5 --outdir /srv/scratch/z5039045/PacBio/prokka/BL5 /srv/scratch/z5039045/PacBio/prokka/input_genome/BL5.fasta&
prokka --force --locustag BL110 --outdir /srv/scratch/z5039045/PacBio/prokka/BL110 /srv/scratch/z5039045/PacBio/prokka/input_genome/BL110.fasta&
prokka --force --locustag D2 --outdir /srv/scratch/z5039045/PacBio/prokka/D2 /srv/scratch/z5039045/PacBio/prokka/input_genome/D2.fasta&
prokka --force --locustag LSS9 --outdir /srv/scratch/z5039045/PacBio/prokka/LSS9 /srv/scratch/z5039045/PacBio/prokka/input_genome/LSS9.fasta&
