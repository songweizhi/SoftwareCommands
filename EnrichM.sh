# Running EnrichM (genomes annotation)
# First load the enrichm module by typing: module load enrichm
# The script:
# This is what I ran, because 1) I only wanted the KOs and 2) I was working on a HPC which uses parallel (it can run several jobs at once):
# enrichm annotate --threads 6 --parallel 6 --genome_directory <full path to directory where your genomes are> --ko --output ko_annotations --log ko_annotations.log
# Run the script in the directory where you would like your output.
# The --genome_directory flag specifies the location of your genomes on the server. You don’t have to specify each genome separately, just the directory they’re in.
# If you only want KO information you have to specifiy the flag --ko. 
# With --output you specify your output directory. Important here is that you don’t make this directory before running the command. The command itself makes the new directory for you with the output in it.
# Run the script using screen as it might take a while (dependent on how many genomes you process).
# Other info and options:
# https://github.com/geronimp/enrichM

# enrichm annotate --genome_directory /srv/projects/marine_sponge/data/current_spongeDB_bins/over80pctComplete/ --output 20190508_enrichm_annotate_binsOver80comp_koDiamond_pfam_tigrfam_cazy_ec_orthologs --ko --pfam --tigrfam --cazy --ec --orthologs --threads 8 --cut_ga &> 20190508_enrichm_annotate_binsOver80comp_koDiamond_pfam_tigrfam_cazy_ec_orthologs.log

# enrichment_test = stats.fisher_exact
# https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.fisher_exact.html

# overrepresentation_test = stats.mannwhitneyu
# The Mann-Whitney test is an alternative for the independent samples t-test when the assumptions required by the latter aren't met by the data.

##########################################################################################
##################################### install EnrichM ####################################
##########################################################################################

module load python/3.7.3
cd ~
mkdir mypython3env_enrichm
python3 -m venv --system-site-packages mypython3env_enrichm
. mypython3env_enrichm/bin/activate
pip install scikit-learn
pip install statsmodels
pip install tempdir
pip install --upgrade enrichm

# Download db files
cd /srv/scratch/z5039045/DB
enrichm data


######################################## run EnrichM #####################################

module unload python
module load python/3.7.3
source ~/mypython3env_enrichm/bin/activate
module load hmmer/3.3
module load diamond/0.9.24
module load prodigal/2.6.3
module load parallel/20190522
#module load mmseqs2/10-6d92c
module load R/3.5.3
module load mcl/14-137
export PATH=/home/z5039045/moreutils/bin:$PATH
export PATH=/srv/scratch/z5039045/Softwares/MMseqs2/build/bin:$PATH
export ENRICHM_DB=/srv/scratch/z5039045/DB/EnrichM/enrichm_database_v10

cd /srv/scratch/z5039045/enrichm_test

# First, anotate faa files
enrichm annotate --protein_directory faa_files --output faa_files_annotate --ko --pfam --tigrfam --cazy --ec --force --threads 6 --cut_ga --log faa_files_annotate.log

# Second,  enrichment analysis
enrichm enrichment --annotate_output faa_files_annotate --output faa_files_enrichment --ko --pfam --tigrfam --cazy --ec --force --log faa_files_enrichment.log --metadata faa_files_metadata.csv

enrichm enrichment --annotate_output faa_files_annotate --output faa_files_enrichment_ko --ko --force --log faa_files_enrichment.log --metadata faa_files_metadata.csv





enrichm annotate --genome_directory NS_37bins --output NS_37bins_annotate --log NS_37bins_annotate.log --ko --pfam --tigrfam --cazy --ec --force --threads 6 --cut_ga


