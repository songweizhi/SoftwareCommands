
################################### USEARCH for BLASTN ###################################


# usearch -ublast
# The ublast command can also be used if it is important to find as many hits as possible.
module load usearch/10.0.240

cd /srv/scratch/z5039045/usearch_test
usearch -makeudb_ublast combined2.ffn -output combined2.udb
usearch -ublast combined2.ffn -db combined2.udb -evalue 1e-5 -accel 0.8 -blast6out all_vs_all_overall.tab -strand both ‑self
usearch -ublast combined2.ffn -db combined2.udb -evalue 1e-5 -accel 0.8 -blast6out all_vs_all_0.9_0.9.tab -strand both -query_cov 0.7 -target_cov 0.7 ‑self

cd /srv/scratch/z5039045/MetaCHIP_demo/NorthSea_MetaCHIP_wd
usearch -makeudb_ublast NorthSea_combined.ffn -output NorthSea_combined.udb
usearch -ublast NorthSea_combined.ffn -db NorthSea_combined.udb -evalue 1e-5 -accel 0.5 -blast6out NorthSea_all_vs_all_ffn_ublast.tab -strand both -query_cov 0.7 -target_cov 0.7 ‑self
usearch -ublast NorthSea_combined.ffn -db NorthSea_combined.udb -evalue 1e-5 -accel 0.8 -blast6out NorthSea_all_vs_all_ffn_ublast.tab -strand both -query_cov 0.7 -target_cov 0.7 ‑self










#################################### workshop content ####################################

cd Day1

install.packages('seqinr')
install.packages('GUniFrac')
install.packages('RVAideMemoire')

library(seqinr)
library(GUniFrac)
library(RVAideMemoire)

# Decomment whatever system you have
setwd('/Users/songweizhi/Desktop/Day1/Usearch')
#Linux and Mac
#system("ln -s 00_DataNeeded/usearch/usearch10.0.240_i86linux32 usearch10.0.240") # on linux
system("ln -s 00_DataNeeded/usearch/usearch10.0.240_i86osx32 usearch10.0.240") # on mac
system('chmod +x usearch10.0.240') # on linux and mac

#Windows
#shell("copy 00_DataNeeded\\usearch\\usearch10.0.240_win32.exe usearch10.0.240") # on windows
#Windows Users might need install the virtual runtime environment for C in 00_DataNeeded before they can continue 'vcredist_x86.exe'

# TEST
system('./usearch10.0.240')

#	Quality trimming
#	http://www.usadellab.org/cms/?page=trimmomatic
dir.create("02_PreProcessedData")

system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample01_R1_001.fastq.gz 01_RawData/Sample01_R2_001.fastq.gz 02_PreProcessedData/Sample01_pairedForward.fastq 02_PreProcessedData/Sample01_unpairedForward.fastq 02_PreProcessedData/Sample01_pairedReverse.fastq 02_PreProcessedData/Sample01_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample02_R1_001.fastq.gz 01_RawData/Sample02_R2_001.fastq.gz 02_PreProcessedData/Sample02_pairedForward.fastq 02_PreProcessedData/Sample02_unpairedForward.fastq 02_PreProcessedData/Sample02_pairedReverse.fastq 02_PreProcessedData/Sample02_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample03_R1_001.fastq.gz 01_RawData/Sample03_R2_001.fastq.gz 02_PreProcessedData/Sample03_pairedForward.fastq 02_PreProcessedData/Sample03_unpairedForward.fastq 02_PreProcessedData/Sample03_pairedReverse.fastq 02_PreProcessedData/Sample03_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample04_R1_001.fastq.gz 01_RawData/Sample04_R2_001.fastq.gz 02_PreProcessedData/Sample04_pairedForward.fastq 02_PreProcessedData/Sample04_unpairedForward.fastq 02_PreProcessedData/Sample04_pairedReverse.fastq 02_PreProcessedData/Sample04_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample05_R1_001.fastq.gz 01_RawData/Sample05_R2_001.fastq.gz 02_PreProcessedData/Sample05_pairedForward.fastq 02_PreProcessedData/Sample05_unpairedForward.fastq 02_PreProcessedData/Sample05_pairedReverse.fastq 02_PreProcessedData/Sample05_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample06_R1_001.fastq.gz 01_RawData/Sample06_R2_001.fastq.gz 02_PreProcessedData/Sample06_pairedForward.fastq 02_PreProcessedData/Sample06_unpairedForward.fastq 02_PreProcessedData/Sample06_pairedReverse.fastq 02_PreProcessedData/Sample06_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample07_R1_001.fastq.gz 01_RawData/Sample07_R2_001.fastq.gz 02_PreProcessedData/Sample07_pairedForward.fastq 02_PreProcessedData/Sample07_unpairedForward.fastq 02_PreProcessedData/Sample07_pairedReverse.fastq 02_PreProcessedData/Sample07_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample08_R1_001.fastq.gz 01_RawData/Sample08_R2_001.fastq.gz 02_PreProcessedData/Sample08_pairedForward.fastq 02_PreProcessedData/Sample08_unpairedForward.fastq 02_PreProcessedData/Sample08_pairedReverse.fastq 02_PreProcessedData/Sample08_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample09_R1_001.fastq.gz 01_RawData/Sample09_R2_001.fastq.gz 02_PreProcessedData/Sample09_pairedForward.fastq 02_PreProcessedData/Sample09_unpairedForward.fastq 02_PreProcessedData/Sample09_pairedReverse.fastq 02_PreProcessedData/Sample09_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")
system("java -jar 00_DataNeeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE 01_RawData/Sample10_R1_001.fastq.gz 01_RawData/Sample10_R2_001.fastq.gz 02_PreProcessedData/Sample10_pairedForward.fastq 02_PreProcessedData/Sample10_unpairedForward.fastq 02_PreProcessedData/Sample10_pairedReverse.fastq 02_PreProcessedData/Sample10_unpairedReverse.fastq SLIDINGWINDOW:4:15 MINLEN:100")

#	Merge paired reads
#	http://drive5.com/usearch/manual/cmd_fastq_mergepairs.html
dir.create("03_MergedData")

system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample01_pairedForward.fastq -reverse 02_PreProcessedData/Sample01_pairedReverse.fastq -fastqout 03_MergedData/Sample01_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample02_pairedForward.fastq -reverse 02_PreProcessedData/Sample02_pairedReverse.fastq -fastqout 03_MergedData/Sample02_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample03_pairedForward.fastq -reverse 02_PreProcessedData/Sample03_pairedReverse.fastq -fastqout 03_MergedData/Sample03_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample04_pairedForward.fastq -reverse 02_PreProcessedData/Sample04_pairedReverse.fastq -fastqout 03_MergedData/Sample04_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample05_pairedForward.fastq -reverse 02_PreProcessedData/Sample05_pairedReverse.fastq -fastqout 03_MergedData/Sample05_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample06_pairedForward.fastq -reverse 02_PreProcessedData/Sample06_pairedReverse.fastq -fastqout 03_MergedData/Sample06_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample07_pairedForward.fastq -reverse 02_PreProcessedData/Sample07_pairedReverse.fastq -fastqout 03_MergedData/Sample07_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample08_pairedForward.fastq -reverse 02_PreProcessedData/Sample08_pairedReverse.fastq -fastqout 03_MergedData/Sample08_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample09_pairedForward.fastq -reverse 02_PreProcessedData/Sample09_pairedReverse.fastq -fastqout 03_MergedData/Sample09_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")
system("./usearch10.0.240 -fastq_mergepairs 02_PreProcessedData/Sample10_pairedForward.fastq -reverse 02_PreProcessedData/Sample10_pairedReverse.fastq -fastqout 03_MergedData/Sample10_merged.fastq -fastq_merge_maxee 1.0 -fastq_minmergelen 400 -fastq_maxmergelen 500 -relabel @ -fastq_maxdiffs 6 -fastq_pctid 90")


#	Quality filtering
#	http://www.drive5.com/usearch/manual/cmd_fastq_filter.html
# If multiple samples are combined into a single file as shown in some of the above examples, then you lose track of which read came from which sample. 
# This is addressed by adding a sample identifier to each read label. The simplest method is to use the -sample option
dir.create("04_FilteredData")

system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample01_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample01_merged_filtered.fasta -sample sample01")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample02_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample02_merged_filtered.fasta -sample sample02")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample03_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample03_merged_filtered.fasta -sample sample03")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample04_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample04_merged_filtered.fasta -sample sample04")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample05_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample05_merged_filtered.fasta -sample sample05")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample06_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample06_merged_filtered.fasta -sample sample06")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample07_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample07_merged_filtered.fasta -sample sample07")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample08_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample08_merged_filtered.fasta -sample sample08")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample09_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample09_merged_filtered.fasta -sample sample09")
system("./usearch10.0.240 -fastq_filter 03_MergedData/Sample10_merged.fastq -fastq_maxns 1 -fastaout 04_FilteredData/Sample10_merged_filtered.fasta -sample sample10")

#	Dereplication
#	http://www.drive5.com/usearch/manual/cmd_fastx_uniques.html
dir.create("05_DereplicatedData")

system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample01_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample01_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample02_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample02_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample03_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample03_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample04_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample04_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample05_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample05_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample06_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample06_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample07_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample07_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample08_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample08_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample09_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample09_merged_filtered_unique.fasta -sizeout")
system("./usearch10.0.240 -fastx_uniques 04_FilteredData/Sample10_merged_filtered.fasta -fastaout 05_DereplicatedData/Sample10_merged_filtered_unique.fasta -sizeout")


#	Join
dir.create("06_JoinedData")

# Decomment whatever system you have

system("cat 05_DereplicatedData/*.fasta > 06_JoinedData/AllSamples.fasta") #on Mac and Linux
#shell("type 05_DereplicatedData\\*.fasta > 06_JoinedData\\AllSamples.fasta") #on Windows

#	Dereplication
#	http://www.drive5.com/usearch/manual/cmd_fastx_uniques.html

dir.create("07_UniqueSequences")

system("./usearch10.0.240 -fastx_uniques 06_JoinedData/AllSamples.fasta -fastaout 07_UniqueSequences/AllSamples_uniques.fasta -sizein -sizeout -strand both")

#	Generating unique sequences using UNOISE
#	http://www.drive5.com/usearch/manual/cmd_cluster_otus.html
dir.create("08_DenoisedSequences")

#system("./usearch10.0.240 -cluster_otus 07_UniqueSequences/AllSamples_uniques.fasta -otus 08_DenoisedSequences/AllSamples_otus.fasta")
system("./usearch10.0.240 -unoise3 07_UniqueSequences/AllSamples_uniques.fasta -zotus 08_DenoisedSequences/AllSamples_denoised.fasta")

n = 1
file_in = file("08_DenoisedSequences/AllSamples_denoised.fasta", open = "r")
file_out = file("08_DenoisedSequences/AllSamples_denoised2.fasta", open = "w")
for (line in readLines(con = file_in))
{
  if(substr(line,1,1) == ">")
  {
    line = paste(">UNI", n, sep = "")
    n = n + 1
  }
  write(x = line, file = file_out)
}
close(file_in)
close(file_out)

rm(list=ls(all=TRUE))
#	Chimera Removal
#	http://drive5.com/usearch/manual/cmd_uchime2_ref.html
# http://drive5.com/usearch/manual/otu_qc_chimeras.html
dir.create("09_UchimeReference")

system("./usearch10.0.240 -search_pcr 00_DataNeeded/SILVA/SILVA_132_SSURef_tax_silva_NR95.fasta -db 00_DataNeeded/16SrRNA.fna -strand both -maxdiffs 4 -ampout 09_UchimeReference/SILVA_132_SSURef_tax_silva_NR95.clustered.fasta")
system("./usearch10.0.240 -makeudb_usearch 09_UchimeReference/SILVA_132_SSURef_tax_silva_NR95.clustered.fasta -output 09_UchimeReference/SILVA_132_SSURef_tax_silva_NR95.clustered.udb")
system("./usearch10.0.240 -uchime2_ref 08_DenoisedSequences/AllSamples_denoised2.fasta -db 09_UchimeReference/SILVA_132_SSURef_tax_silva_NR95.clustered.udb -strand plus -mode specific -notmatched 09_UchimeReference/AllSamples_unoise_nc.fasta")

#	OTU table generation
# An OTU table is made by the otutab command:
#	https://www.drive5.com/usearch/manual/cmd_otutab.html
dir.create("10_OtuTable")

system("./usearch10.0.240 -otutab 06_JoinedData/AllSamples.fasta -db 09_UchimeReference/AllSamples_unoise_nc.fasta -id 0.97 -otutabout 10_OtuTable/AllSamples_unoise_otu_table.txt")

#	Mapping of OTUs on Reference Database
#	http://www.drive5.com/usearch/manual/cmd_usearch_global.html
# An identity threshold must be specified using the ‑id option. A database file must be specified using the ‑db option. FASTA and .udb formats are supported. For large databases, .udb format is recommended
dir.create("11_TaxAssignment")

system("./usearch10.0.240 -usearch_global 09_UchimeReference/AllSamples_unoise_nc.fasta -db 09_UchimeReference/SILVA_132_SSURef_tax_silva_NR95.clustered.udb -id 0.9 -top_hit_only -blast6out 11_TaxAssignment/AllSamples_unoise_nc.txt -strand plus")

#Merge Table and Taxonomy
dir.create("12_FinalOtuTable")

SLV = read.delim("00_DataNeeded/SILVA/SILVA_132_SSURef_tax_silva_NR95.taxonomy", header = F)
names(SLV) = c("SilvaId", "taxonomy")

OTU = read.delim("10_OtuTable/AllSamples_unoise_otu_table.txt", header = T)
TAX = read.delim("11_TaxAssignment/AllSamples_unoise_nc.txt", header = F)

TAX = TAX[,1:3]
names(TAX) = c("X.OTU.ID", "SilvaId", "Identity")

TAX_SLV = merge(TAX, SLV, by = "SilvaId")
OTU_TAX = merge(OTU, TAX_SLV, by = "X.OTU.ID")

write.table(OTU_TAX, "12_FinalOtuTable/AllSamples_unoise_otu_table.txt", sep = "\t", row.names = F, col.names = T, quote = F)

rm(list=ls(all=TRUE))

#Multiple sequence alignment and generation of a phylogentic tree using muscle (SLOW: Faster Alignment with mafft and tree calculation with fasttree)
dir.create("13_PhylogeneticTree")

#Linux and Mac
#system("ln -s 00_DataNeeded/muscle/muscle3.8.31_i86linux32 muscle3.8.31") # on linux
system("ln -s 00_DataNeeded/muscle/muscle3.8.31_i86darwin32 muscle3.8.31") # on mac
#system('chmod +x muscle3.8.31') # on linux and mac

#Windows
#shell("copy 00_DataNeeded\\muscle\\muscle3.8.31_i86win32.exe muscle3.8.31") # on windows

system('./muscle3.8.31 -in 09_UchimeReference/AllSamples_unoise_nc.fasta -out 13_PhylogeneticTree/AllSamples_unoise_nc.aln -maxiters 2')
system('./muscle3.8.31 -maketree -in 13_PhylogeneticTree/AllSamples_unoise_nc.aln -out 13_PhylogeneticTree/AllSamples_unoise_nc.tre -cluster neighborjoining')

#FIN
