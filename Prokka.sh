
############################## install prokka on HKUST hpc3 ##############################

module load anaconda3
conda create -n prokka
conda activate prokka
conda install -c conda-forge -c bioconda -c defaults prokka
conda install -c conda-forge perl-xml-parser
cpan install XML::Simple
cpan install Bio::Root::Version
conda install -c conda-forge zstd


############################## running prokka on HKUST hpc3 ##############################

module load anaconda3
conda activate prokka
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix GCF_013340765.1 --locustag GCF_013340765.1 --strain GCF_013340765.1 --outdir GCF_013340765.1_prokka_wd GCF_013340765.1.gtdb.fna


##########################################################################################


# run prokka
conda activate prokka
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix GCF_013340765.1 --locustag GCF_013340765.1 --strain GCF_013340765.1 --outdir GCF_013340765.1_prokka_wd GCF_013340765.1.gtdb.fna


# run prokka
conda activate prokka
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin111 --locustag bin111 --strain bin111 --outdir bin111_prokka_wd bin111.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin1322 --locustag bin1322 --strain bin1322 --outdir bin1322_prokka_wd bin1322.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin15 --locustag bin15 --strain bin15 --outdir bin15_prokka_wd bin15.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin27 --locustag bin27 --strain bin27 --outdir bin27_prokka_wd bin27.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin30 --locustag bin30 --strain bin30 --outdir bin30_prokka_wd bin30.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin35 --locustag bin35 --strain bin35 --outdir bin35_prokka_wd bin35.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin51 --locustag bin51 --strain bin51 --outdir bin51_prokka_wd bin51.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin69 --locustag bin69 --strain bin69 --outdir bin69_prokka_wd bin69.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin96 --locustag bin96 --strain bin96 --outdir bin96_prokka_wd bin96.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix bin829 --locustag bin829 --strain bin829 --outdir bin829_prokka_wd bin829.fasta


#################### Prokka #################### 

module load perl/5.28.0
module load infernal/1.1.2 
module load blast+/2.9.0 
module load hmmer/3.3
module load prodigal/2.6.3
module load tbl2asn/20200706
module load parallel/20200722 
module load aragorn/1.2.38 
module load bedtools/2.27.1
module load barrnap/0.9 
module load prokka/1.14.5
cd /srv/scratch/z5039045/MetaCHIP/Demo/NS_18bins


# predict coding sequences from Bacterial MAGs
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin006 --locustag NorthSea_bin006 --strain NorthSea_bin006 --outdir NorthSea_bin006_prokka_wd NorthSea_bin006.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin026 --locustag NorthSea_bin026 --strain NorthSea_bin026 --outdir NorthSea_bin026_prokka_wd NorthSea_bin026.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin046 --locustag NorthSea_bin046 --strain NorthSea_bin046 --outdir NorthSea_bin046_prokka_wd NorthSea_bin046.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin046 --locustag NorthSea_bin046 --strain NorthSea_bin046 --outdir NorthSea_bin046_prokka_wd NorthSea_bin046.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix contig_2560 --locustag contig_2560 --strain contig_2560 --outdir contig_2560_prokka_wd contig_2560.fa


# predict coding sequences from Archaeal MAGs
prokka --force --compliant --cpus 12 --kingdom Archaea --prefix NorthSea_bin012 --locustag NorthSea_bin012 --strain NorthSea_bin012 --outdir NorthSea_bin012_prokka_wd NorthSea_bin012.fasta
prokka --force --compliant --cpus 12 --kingdom Archaea --prefix NorthSea_bin022 --locustag NorthSea_bin022 --strain NorthSea_bin022 --outdir NorthSea_bin022_prokka_wd NorthSea_bin022.fasta


cd /srv/scratch/z5039045/Adaptive_Nanopore/binning/0_get_sequencing_refs
prokka --cpus 12 --locustag bin_1 --outdir bin_1_prokka_wd bin.1.fa
prokka --cpus 12 --locustag bin_2 --outdir bin_2_prokka_wd bin.2.fa
prokka --cpus 12 --locustag bin_3 --outdir bin_3_prokka_wd bin.3.fa
prokka --cpus 12 --locustag bin_4 --outdir bin_4_prokka_wd bin.4.fa
prokka --cpus 12 --locustag bin_5 --outdir bin_5_prokka_wd bin.5.fa
prokka --cpus 12 --locustag bin_6 --outdir bin_6_prokka_wd bin.6.fa
prokka --cpus 12 --locustag bin_7 --outdir bin_7_prokka_wd bin.7.fa
prokka --cpus 12 --locustag bin_8 --outdir bin_8_prokka_wd bin.8.fa
prokka --cpus 12 --locustag bin_9 --outdir bin_9_prokka_wd bin.9.fa
prokka --cpus 12 --locustag bin_10 --outdir bin_10_prokka_wd bin.10.fa




