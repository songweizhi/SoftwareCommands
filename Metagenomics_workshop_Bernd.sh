################################
##        Trimmomatic         ##
##        Mac Terminal        ##   
##        04-Dec-2017         ##   
##        Workshop UNSW       ##   
################################

################################
##        Basic Cmds          ##
################################

# -	gzip filename: compress file with the name “filename”; filename gets appended with “.gz”
# -	gunzip filename: compress file with the name “filename”; “.gz” gets removed from filename


# Make files readable, writable and executable.
chmod 777 *

# Generate symbolic links to the gzipped fastq files (hint:‘ ln -s ../1_RawData/*.gz . ’) and the TruSeq3 adapter file 
cd /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/2_Processing
ln -s ../1_RawData/*.gz 
ln -s ../0_DataNeeded/Trimmomatic-0.36/adapters/TruSeq3-PE.fa


/Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/1_RawData/WORKSHOP-L001_R1_001.fastq.gz
/Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/1_RawData/WORKSHOP-L001_R2_001.fastq.gz
################################
##          FastQc            ##
################################
# 1)  Double click on the FastQC icon in the MacUser folder. Alternatively you go to fastqc folder and type ‘chmod +x fastqc’ then run fastqc by typing ‘./fastqc’
cd /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_dataneeded/fastqc
./fastqc
# 2)	Open the sequence files
# 3)	Check the various information provided in the left panel



################################
##        Trimmomatic         ##
################################

cd /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_dataneeded/Trimmomatic-0.36
java -jar trimmomatic-0.36.jar

cd /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/2_Processing
java -jar /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_dataneeded/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33 /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/1_RawData/WORKSHOP-L001_R1_001.fastq.gz /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/1_RawData/WORKSHOP-L001_R2_001.fastq.gz output_forward_paired.fq output_forward_unpaired.fq output_reverse_paired.fq output_reverse_unpaired.fq ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:36 HEADCROP:10 CROP:260


#########################################
##        Assembly with SPAdes         ##
#########################################

/Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_dataneeded/SPAdes-3.11.1-Darwin/bin/spades.py --only-assembler -1 output_forward_paired.fq -2 output_reverse_paired.fq -s output_forward_unpaired.fq -s output_reverse_unpaired.fq --meta -t 1 -m 3 -o metaSPAdes


# Check the output by going into the output directory “metaspades”. 
cd /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/2_Processing/metaSPAdes

perl /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_dataneeded/get_fasta_stats.pl -T contigs.fasta 

##############################################################
##        Mapping reads to an assembly with Bowtie          ##
##############################################################
# 01  build a map index for your assembled sequences.
/Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_DataNeeded/bowtie2-2.3.3.1-macos-x86_64/bowtie2-build contigs.fasta CTG 

# 02  create a mapping file called “mapping.sam”. (Note this file is very large).
/Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_DataNeeded/bowtie2-2.3.3.1-macos-x86_64/bowtie2 -x CTG -1 output_forward_paired.fq -2 output_reverse_paired.fq -U output_forward_unpaired.fq -U output_reverse_unpaired.fq -S mapping.sam

# 03  Open Tablet by typing ‘tablet’ (or clicking on the icon on Mac). Select “Import an assembly” and then select your mapping file as your “primary assembly file” and your assembled fasta file ‘contigs.fasta’ as your “reference file”. Press “Open” and wait for the assembly to load. 



#################################################
##        Genome binning with Metabat          ##
#################################################
# 01  convert the .sam format into the much smaller .bam format.
samtools view -bS mapping.sam > mapping.bam 

# 02  created the sorted .bam file.
samtools sort mapping.bam > mapping.sorted 

# 03  convert the .bam file into a sequence coverage file. 
/Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_DataNeeded/metabat2/jgi_summarize_bam_contig_depths --outputDepth depth.txt mapping.sorted

# 04  You should get a few new .fa files (.e.g. MetaBAT_bin.1.fa) that represent the bin sequences. 
/Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_DataNeeded/metabat2/metabat1 -i contigs.fasta -a depth.txt -o MetaBAT_bin 


##############################################################
##          Annotation with PROKKA and Prodigal             ##
##############################################################
# Prokka is a software tool for the rapid annotation of prokaryotic genomes. A typical 4 Mbp genome can be fully annotated 
# in less than 10 minutes on a quad-core computer, and scales well to 32 core SMP systems. It produces GFF3, GBK and SQN files 
# that are ready for editing in Sequin and ultimately submitted to Genbank/DDJB/ENA. It uses Prodigal, which is a well-known 
# tool to predict open reading frames.

# In addition, the sequencing centre needs to be provided and the minimum contig length is set to 200. The ‘--accver’ will add 
# the version of the genome/bin. We use the ‘--gcode 11’ option to tell prokka that we are dealing with the genetic code of 
# prokaryotes. The ‘--locustag XXX’ option will add XXX as prefix to all loci found in the genome. The locustag usually is a 
# short abbreviation giving basic information in taxonomy and/or other environmental features, such as the sample origin.

prokka --compliant --centre goettingen --accver 1 --gcode 11 --cpus 1 --locustag BIN1 --outdir BIN1 MetaBAT_bin.1.fa

# Prodigal to predict ORFs directly.

# The output will be two files: MetaBAT_bin.1.ffn will contain the nucleotide sequences oft he predicted ORF, while MetaBAT_bin.1.faa 
# will contain the protein sequences oft he predicted ORF.

/Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_DataNeeded/prodigal.osx.10.9.5 -i MetaBAT_bin.1.fa -a MetaBAT_bin.1.faa -d MetaBAT_bin.1.ffn -o MetaBAT_bin.1.txt




##############################################################
##               Annotation with Kaiju and KEGG             ##
##############################################################

# Kaiju is a program for sensitive and fast taxonomic classification of metagenomic or metatranscriptomics sequences. 
# Each sequence is assigned to a taxon in the NCBI taxonomy by comparing it to a reference database containing microbial 
# and viral protein sequences. By using protein-level classification, Kaiju achieves a higher sensitivity compared with 
# methods based on nucleotide comparison. Kaiju can use either the set of available complete genomes from NCBI RefSeq or 
# the microbial subset of the NCBI BLAST non-redundant protein database nr, optionally also including fungi and microbial 
# eukaryotes.
# 
# DNA sequences are translated into amino acid sequences, which are then searched in the database using a modified backward 
# search on a memory-efficient implementation of the Burrows-Wheeler transform, which finds maximum exact matches (MEMs), 
# optionally allowing mismatches in the protein alignment.


1) Change into the Prokka folder
2) Gzip the ffn file that contains the ORFs (Kaiju only accepts gzipped files)
3) Upload your file to the kaiju webserver http://kaiju.binf.ku.dk/server (Use default values)
4) Inspect the results (the taxon path count and Krona files are quite useful for classifying your bins)
5) Download the output files to the 2_Processing folder
6) Gunzip the kaiju.out.gz file
7) 
perl /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_DataNeeded/kaiju_reader.pl kaiju.out



# KEGG (Kyoto Encyclopedia of Genes and Genomes) is a collection of databases dealing with genomes, biological pathways, 
# diseases, drugs, and chemical substances. KEGG is utilized for bioinformatics research and education, including data 
# analysis in genomics, metagenomics, metabolomics and other omics studies, modelling and simulation in systems biology, 
# and translational research in drug development.

1)	Change into the Prokka folder
2)	Upload the faa file containing all the proteins predicted for the bin to blastkoala (http://www.kegg.jp/blastkoala/). 
You need to provide some basic data: the taxonomy of your bin (wait for kaiju results) and which database you would like 
to use (go for species_prokaryotes). You will receive an email asking for job confirmation.
3)	Inspect the results
4)	Download the annotation data to the 2_Processing folder
5)	
perl /Users/zzfanyi/Bioinfo/Scp_UnixMacTerminal/Metagenomics_workshop_04Dec17/MacUser/0_DataNeeded/kegg_reader.pl user_ko.txt

# KEGG also provides taxonomic data. However, this data is based on blast against all KEGG genomes (currently around 6000 complete genomes). 
# The smallest database for Kaiju (NCBI RefSeq) contains more than 8000 complete genomes.






##############################################################
##                          Others                          ##
##############################################################

# You can also annotate your entire metagenome (but this will run for a while):
1)	Type ‘prodigal -i metaSPAdes/contigs.fasta -a metagenome.faa -d metagenome.ffn -o metagenome.1.txt -p meta’ 
[For Mac users, please see prokka alternatives section]
2)	The ffn file contains the ORF sequences and can be uploaded after compression with gzip to Kaiju.
3)	The faa file, containing all the protein sequences, can be submitted to ghostkoala (http://www.kegg.jp/ghostkoala/)
4)	Inspect the output
5)	Try to run them through the two perl scripts

Other notable pipelines/tools for taxonomic and functional annotation:

IMG: https://img.jgi.doe.gov/
MG-RAST: http://metagenomics.anl.gov/
MEGAN: http://www-ab.informatik.uni-tuebingen.de/software/megan6/


 
Further reading:


Overview Metagenomics:
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3351745/

FastQC manual
https://biof-edu.colorado.edu/videos/dowell-short-read-class/day-4/fastqc-manual

Trimmomatic
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4103590/

SPAdes
https://www.ncbi.nlm.nih.gov/pubmed/22506599

Bowtie2
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3010897/

MetaBAT
https://peerj.com/articles/1165/

Prodigal
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2848648/

Prokka
https://www.ncbi.nlm.nih.gov/pubmed/24642063

KEGG
https://www.ncbi.nlm.nih.gov/pubmed/10592173

Kaiju
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4833860/
