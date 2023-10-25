
# https://academic.oup.com/bioinformatics/article/37/18/3029/6178277?login=false

############################### install mmseqs2 with conda ###############################

conda deactivate
conda create -n mmseqs2
conda activate mmseqs2
conda install -c conda-forge -c bioconda mmseqs2

# Download UniProtKB/Swiss-Prot, you may want to check other databases that are available in mmseqs2 with "mmseqs databases"
conda activate mmseqs2
cd /home-user/wzsong/DB
mkdir mmseqs2
mmseqs databases UniProtKB/Swiss-Prot mmseqs2/swissprot tmp
# In this case, path to the downloaded db file will be: /home-user/wzsong/DB/mmseqs2/swissprot

# Create a seqTaxDB from an existing BLAST database (just a note, no need to run)
# https://github.com/soedinglab/mmseqs2/wiki#create-a-seqtaxdb-from-an-existing-blast-database


####################################### run mmseqs2 ######################################

conda activate mmseqs2
mmseqs -h


############################# classify metagenomic assemblies ############################

# https://github.com/soedinglab/mmseqs2/wiki#taxonomy-assignment

# generate query DB
cd /home-user/wzsong/Tests/mmseqs2
mmseqs createdb scaffolds.fasta scaffolds.fasta.DB

# classify
mmseqs taxonomy scaffolds.fasta.DB /home-user/wzsong/DB/mmseqs2/swissprot taxonomyResult tmp

# converted to TSV
mmseqs createtsv scaffolds.fasta.DB taxonomyResult taxonomyResult.tsv

# reformat tsv
BioSAK parse_mmseqs_tsv -i taxonomyResult.tsv -o taxonomyResult_reformatted.tsv

