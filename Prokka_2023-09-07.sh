#################### Prokka #################### 

module purge
module load prokka/1.14.6
module load bedtools2/2.30.0
module load tbl2asn/2022-04-26

# predict coding sequences from Bacterial MAGs
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin006 --locustag NorthSea_bin006 --strain NorthSea_bin006 --outdir NorthSea_bin006_prokka_wd NorthSea_bin006.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin026 --locustag NorthSea_bin026 --strain NorthSea_bin026 --outdir NorthSea_bin026_prokka_wd NorthSea_bin026.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin046 --locustag NorthSea_bin046 --strain NorthSea_bin046 --outdir NorthSea_bin046_prokka_wd NorthSea_bin046.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin046 --locustag NorthSea_bin046 --strain NorthSea_bin046 --outdir NorthSea_bin046_prokka_wd NorthSea_bin046.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix contig_2560 --locustag contig_2560 --strain contig_2560 --outdir contig_2560_prokka_wd contig_2560.fa


module purge
module load prokka/1.14.6
module load bedtools2/2.30.0
module load tbl2asn/2022-04-26
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix GCA_000017245 --locustag GCA_000017245 --strain GCA_000017245 --outdir GCA_000017245_prokka_wd GCA_000017245.fna


# JinJin Tao
prokka GCA_024586915.1_ASM2458691v1_genomic.fna --outdir /GCA_024586915.1/prokka --kingdom Bacteria -prefix GCA_024586915.1 --locustag GCA_023073395.1
