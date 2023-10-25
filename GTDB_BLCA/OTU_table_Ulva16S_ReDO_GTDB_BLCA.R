# analysis of 16S data from Singapore experiment
# experiment conducted in March 2019 - sequencing performed in May 2019

library(tidyverse)
library(seqinr)
library(reshape2)

#### 16S pipeline ####
system("cp 00_DataNeeded/usearch/usearch11.0.667_i86osx64 usearch11.0.667 ; chmod +x usearch11.0.667") # MacOS

system('./usearch11.0.667') # Test


#	Generating unique sequences using UNOISE
dir.create("09_DenoisedSequencesGTDB")
system("./usearch11.0.667 -unoise3 OTU_table_Silva132_Nr99/08_UniqueSequences/AllSamples_uniques.fasta -zotus 09_DenoisedSequencesGTDB/AllSamples_denoised.fasta")

#	Chimera Removal
dir.create("10_UchimeReferenceGTDB")
system("./usearch11.0.667 -uchime2_ref 09_DenoisedSequencesGTDB/AllSamples_denoised.fasta -db 00_DataNeeded/GTDB/GTDB_bac-arc_ssu_r86.fa -strand plus -mode high_confidence -notmatched 10_UchimeReferenceGTDB/AllSamples_unoise_nc.fasta")

# #	OTU table generation  
# # An OTU table is made by the otutab command
dir.create("11_OtuTableGTDB")
#NOTE:  I am using the Joined data from the Silva132 folder.
system("./usearch11.0.667 -otutab OTU_table_Silva132_Nr99/07_JoinedData/AllSamples2.fasta -otus 10_UchimeReferenceGTDB/AllSamples_unoise_nc.fasta -id 0.97 -otutabout 11_OtuTableGTDB/AllSamples_unoise_otu_table1.txt")

#############################################################################################################
############################################### original code ###############################################
#############################################################################################################

#NOTE: Back to the OTU_table_GTDB directory folder!
#	Mapping of OTUs on Reference Database 
# dir.create("12_TaxAssignmentGTDB")

# #The next line of script is commenteded but it needs to be run every time I will update my GTDB database in 00_Dataneeded. This comand will generate multiple files in my silva folder: it will basically create a blast database using the GTDB .fasta file before running the blast. And it does it using the "makeblastdb" command. 
# 
# system("00_DataNeeded/ncbi-blast-2.10.0+/bin/makeblastdb -in 00_DataNeeded/GTDB/GTDB_bac-arc_ssu_r86.fa -dbtype nucl")
# system("00_DataNeeded/ncbi-blast-2.10.0+/bin/blastn -query 10_UchimeReferenceGTDB/AllSamples_unoise_nc.fasta -outfmt 6 -out 12_TaxAssignmentGTDB/AllSamples_unoise_nc.txt -db 00_DataNeeded/GTDB/GTDB_bac-arc_ssu_r86.fa -evalue 1e-20 -num_threads 8")
# 
# # get best hit from blast output
# blast_tab <- read.delim(file = "12_TaxAssignmentGTDB/AllSamples_unoise_nc.txt", header = FALSE)
# best_hit <- NULL
# for(id in unique(blast_tab$V1))
# {
#   best_hit <- c(best_hit, which(blast_tab$V1 == id)[1])
# }
# blast_tab_red <- blast_tab[best_hit,]
# write.table(x = blast_tab_red, file = "12_TaxAssignmentGTDB/AllSamples_unoise_nc2.txt", append = F, quote = F, sep = "\t", row.names = F, col.names = F)
# 
# rm(list=ls(all=TRUE))
# #
# #
# #
# #
# #Merge Table and Taxonomy
# dir.create("13_FinalOtuTableGTDB")
# GTDB <- read.delim("Absolute_Abundances/00_DataNeeded/GTDB/GTDB.txt", header = FALSE, stringsAsFactors = FALSE) #21559 2
# 
# names(GTDB) = c("GTDBId", "taxonomy")
# # keep only 16S sequences (Bacteria)
# GTDB_tax_bacteria <- GTDB[grepl(pattern = "Bacteria", GTDB$taxonomy),] # 20486 Bacterial Id
# taxonomy <- as.character(GTDB_tax_bacteria$taxonomy)
# head(taxonomy)
# tail(taxonomy)
# # use this function to include "Unassigned" for empty taxa 
# split_lineages <- function (x) {
#   x         <-  strsplit(x, ';', fixed = TRUE)[[1]]
#   naNumber  <-  7 - length(x)
#   if (naNumber > 0) {
#     c(x, rep('Unassigned', naNumber))
#   } else {
#     x
#   }
# }
# 
# tax  <-  lapply(taxonomy, split_lineages)
# GTDB_taxa <- data.frame(do.call('rbind', tax))
# colnames(GTDB_taxa) <- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species")
# head(GTDB_taxa)
# #
# GTDB_taxa_df <- data.frame(GTDBId = GTDB_tax_bacteria$GTDBId, GTDB_taxa, stringsAsFactors = FALSE)
# head(GTDB_taxa_df)
# 
# # merge otu table and taxonomy
# OTU <- read.delim("11_OtuTableGTDB/AllSamples_unoise_otu_table1.txt", header = T)
# colnames(OTU)[1] <- "OTU_ID"
# dim(OTU) #4244
# head(OTU)
# TAX <- read.delim("12_TaxAssignmentGTDB/AllSamples_unoise_nc2.txt", header = F)
# dim(TAX) #4243
# TAX <- TAX[,c(1:4,11)]
# names(TAX) <- c("OTU_ID", "GTDBId", "Identity", "Alignment_Length", "Evalue")
# rownames(OTU) == rownames(TAX) #TRUE
# 
# TAX_GTDB <- TAX %>%
#   left_join(., GTDB_taxa_df, by = "GTDBId")
# dim(TAX_GTDB) #4243 12
# 
# OTU_TAX <- OTU %>%
#   left_join(., TAX_GTDB, by = "OTU_ID")
# head(OTU_TAX)
# colnames(OTU_TAX)
# dim(OTU_TAX) # 4244   72
# rownames(OTU_TAX) == rownames(TAX_GTDB) #TRUE
# 
# write.table(OTU_TAX, "13_FinalOtuTableGTDB/AllSamplesGTDB_unoise_otu_table.txt", sep = "\t", row.names = F, col.names = T, quote = F)
# 

##############################################################################################################
################################################## new code ##################################################
##############################################################################################################

# add clustalo and muscle to system path (required by BLCA)
system("cp 00_DataNeeded/clustalo/clustal-omega-1.2.3-macosx 00_DataNeeded/clustalo/clustalo ; chmod +x 00_DataNeeded/clustalo/clustalo") # MacOS
system("cp 00_DataNeeded/muscle/muscle3.8.31_i86darwin64 00_DataNeeded/muscle/muscle ; chmod +x 00_DataNeeded/muscle/muscle") # MacOS
Sys.setenv(PATH = paste(Sys.getenv("PATH"), "00_DataNeeded/clustalo", sep = ":"))
Sys.setenv(PATH = paste(Sys.getenv("PATH"), "00_DataNeeded/muscle", sep = ":"))

dir.create("12_TaxAssignmentGTDB_BLCA")

# run BLCA agsinst GTDB SSU database
system('python 00_DataNeeded/BLCA/2.blca_main.py -r 00_DataNeeded/BLCA/db_GTDB_SSU/GTDB_bac120_ar122_ssu_r89_BLCAparsed.taxonomy -q 00_DataNeeded/BLCA/db_GTDB_SSU/GTDB_bac120_ar122_ssu_r89_BLCAparsed.fasta -i 10_UchimeReferenceGTDB/AllSamples_unoise_nc.fasta -o 12_TaxAssignmentGTDB_BLCA/AllSamples_unoise_BLCA_out.1.txt')

# example command for run BLCA agsinst the SILVA SSU database
# system('python 00_DataNeeded/BLCA/2.blca_main.py -r 00_DataNeeded/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.taxonomy -q 00_DataNeeded/BLCA/db_SILVA_SSU/SILVA_138_SSURef_NR99_tax_silva_BLCAparsed.fasta -i 10_UchimeReferenceSILVA/AllSamples_unoise_nc.fasta -o 12_TaxAssignmentSILVA_BLCA/AllSamples_unoise_BLCA_out.1.txt')

# remove taxonomic ranks from BLCA's classification and put number in parenthesis (make it easy to read)
m = 1
for (each_line in readLines(file('12_TaxAssignmentGTDB_BLCA/AllSamples_unoise_BLCA_out.1.txt',open="r")) ){
  each_line_split = strsplit(each_line, '\t')
  OTU_ID = each_line_split[[1]][1]
  taxonomy = each_line_split[[1]][2]
  taxonomy_split = strsplit(taxonomy, ';')
  taxonomy_no_rank = ''
  n = 1
  for (taxon in taxonomy_split[[1]]){
    if (n%%2 == 1){
      taxon_split = strsplit(taxon, ':')
      if (length(taxon_split[[1]]) ==2)
      {taxon_no_rank = taxon_split[[1]][2]} 
      else 
      {taxon_no_rank = taxon_split[[1]][1]}
      taxonomy_no_rank = paste(taxonomy_no_rank, taxon_no_rank, sep = ");")} 
    else 
    {taxonomy_no_rank = paste(taxonomy_no_rank, taxon, sep = "(")}
    n = n + 1
  }
  taxonomy_no_rank = paste(taxonomy_no_rank, ')', sep = "")
  taxonomy_no_rank = substr(taxonomy_no_rank, 3, nchar(taxonomy_no_rank))
  if (taxonomy_no_rank == "Unclassified)"){taxonomy_no_rank = "Unclassified"}
  
  taxonomy_no_rank_with_OTU = paste(OTU_ID, taxonomy_no_rank, sep = "\t")
  
  if (m == 1)
  {cat(taxonomy_no_rank_with_OTU,file='12_TaxAssignmentGTDB_BLCA/AllSamples_unoise_BLCA_out.2.txt',sep="\n", append=FALSE)} 
  else 
  {cat(taxonomy_no_rank_with_OTU,file='12_TaxAssignmentGTDB_BLCA/AllSamples_unoise_BLCA_out.2.txt',sep="\n", append=TRUE)}
  m = m +1
}

# Merge Table and Taxonomy
dir.create("13_FinalOtuTableGTDB_BLCA")
OTU = read.delim("11_OtuTableGTDB/AllSamples_unoise_otu_table1.txt", header = T)
TAX = read.delim("12_TaxAssignmentGTDB_BLCA/AllSamples_unoise_BLCA_out.2.txt", header = F)
names(TAX) = c("X.OTU.ID", "Taxonomy")

OTU_TAX = merge(OTU, TAX, by = "X.OTU.ID")
write.table(OTU_TAX, "13_FinalOtuTableGTDB_BLCA/AllSamples_unoise_otu_table_BLCA.txt", sep = "\t", row.names = F, col.names = T, quote = F)

rm(list=ls(all=TRUE))


