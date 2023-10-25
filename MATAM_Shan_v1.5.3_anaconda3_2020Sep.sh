
# Willis
cd /srv/scratch/z5039045/qsub_scripts/
# Shan
cd /srv/scratch/z5095298/qsub_scripts/

scp /srv/scratch/z5095298/software/Conda/Anaconda3-5.0.1-Linux-x86_64.sh z5039045@katana2.restech.unsw.edu.au:/srv/scratch/z5039045

##########################################################
###                   Quick install                    ###
##########################################################


# Step 1. Install Anaconda:  

bash /srv/scratch/z5039045/Anaconda3-5.0.1-Linux-x86_64.sh # install Anaconda3
# export PATH="/home/z5039045/anaconda3/bin:$PATH"
# export PATH="$PATH:/home/z5039045/anaconda3/bin"
$PATH
export PATH=/home/z5039045/anaconda3/bin:$PATH
$PATH
# chose different PATH by pressing 'enter' or something else.
# Anaconda would be installed in home directory: /home/z5039045/anaconda3
cd /home/z5039045/

# Step 2. Add the followings channels:
conda config --add channels conda-forge
conda config --add channels defaults
conda config --add channels r
conda config --add channels bioconda
conda config --add channels bonsai-team
conda config --add channels salford_systems

# Step 3. Install matam v1.4.0:
# /home/z5039045/anaconda3/bin/conda install matam
# # or:
/home/z5039045/anaconda3/bin/conda install -c bonsai-team matam 
# Proceed ([y]/n)? y
# 
# _libgcc_mutex- 100% |#########################################################################################################################| Time: 0:00:00   1.13 MB/s
# blas-1.0-mkl.t 100% |#########################################################################################################################| Time: 0:00:00   3.39 MB/s
# conda-env-2.6. 100% |#########################################################################################################################| Time: 0:00:00   1.64 MB/s
# openjdk-8.0.15 100% |#########################################################################################################################| Time: 0:00:15   8.57 MB/s
# libgcc-ng-9.1. 100% |#########################################################################################################################| Time: 0:00:00  24.50 MB/s
# libgcc-7.2.0-h 100% |#########################################################################################################################| Time: 0:00:00   8.11 MB/s
# perl-5.26.2-h1 100% |#########################################################################################################################| Time: 0:00:02   7.09 MB/s
# coreutils-8.25 100% |#########################################################################################################################| Time: 0:00:01   6.03 MB/s
# wget-1.19.1-he 100% |#########################################################################################################################| Time: 0:00:00   1.99 MB/s
# krona-2.7.1-pl 100% |#########################################################################################################################| Time: 0:00:00 601.88 kB/s
# samtools-1.4.1 100% |#########################################################################################################################| Time: 0:00:00   1.24 MB/s
# pycosat-0.6.3- 100% |#########################################################################################################################| Time: 0:00:00  24.35 MB/s
# rdptools-2.0.3 100% |#########################################################################################################################| Time: 0:00:16   8.16 MB/s
# tqdm-4.7.2-py3 100% |#########################################################################################################################| Time: 0:00:00  13.81 MB/s
# conda-package- 100% |#########################################################################################################################| Time: 0:00:00   1.36 MB/s
# conda-4.8.4-py 100% |#########################################################################################################################| Time: 0:00:00   4.77 MB/s
# 
# Krona installed.  You still need to manually update the taxonomy
# databases before Krona can generate taxonomic reports.  The update
# script is ktUpdateTaxonomy.sh.  The default location for storing
# taxonomic databases is /home/z5039045/anaconda3/opt/krona/taxonomy
# 
# If you would like the taxonomic data stored elsewhere, simply replace
# this directory with a symlink.  For example:
# 
# rm -rf /home/z5039045/anaconda3/opt/krona/taxonomy
# mkdir /path/on/big/disk/taxonomy
# ln -s /path/on/big/disk/taxonomy /home/z5039045/anaconda3/opt/krona/taxonomy
# ktUpdateTaxonomy.sh
# 

# or: 
# /home/z5039045/anaconda3/bin/conda install -c bioconda matam #v.1.6.0
# Collecting package metadata (repodata.json): failed
# 
# UnavailableInvalidChannel: The channel is not accessible or is invalid.
#   channel name: salford_systems
#   channel url: https://conda.anaconda.org/salford_systems
#   error code: 404
# 
# You will need to adjust your conda configuration to proceed.
# Use `conda config --show channels` to view your configuration's current state,
# and use `conda config --show-sources` to view config file locations.
# or:
# conda install /srv/scratch/z5039045/software/matam-1.6.0-he513fc3_1.tar.bz2#v.1.6.0
# Downloading and Extracting Packages
#                                                                                                                                       ####################################################################################################################################################################################################################################################################################################### | 100% 
# Preparing transaction: done
# Verifying transaction: done
# Executing transaction: done

# Step 4. Update taxonomy databases:
# After Krona installed,  You still need to manually update the taxonomy
# databases before Krona can generate taxonomic reports.  The update
# script is ktUpdateTaxonomy.sh.  The default location for storing
# taxonomic databases is /home/z5039045/anaconda3/opt/krona/taxonomy,
bash /home/z5039045/anaconda3/bin/ktUpdateTaxonomy.sh ## we do not really need to do this.
# Fetching taxdump.tar.gz...
#    Fetching checksum...
#    Checksum for taxdump.tar.gz matches server.
# Extracting taxonomy...
# 
# Cleaning up...
# 
# Finished.

# '
# # If you would like the taxonomic data stored elsewhere, simply replace
# # this directory with a symlink.  For example:
# rm -rf /home/z5039045/anaconda3/opt/krona/taxonomy
# mkdir /path/on/big/disk/taxonomy
# ln -s /path/on/big/disk/taxonomy /home/z5039045/anaconda3/opt/krona/taxonomy
# ktUpdateTaxonomy.sh' ## we do not really need to do this.





# help to check the version of 'sort'
sort --version
# sort (GNU coreutils) 8.25
# Copyright (C) 2016 Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
# 
## check on your own server, it may be different.
module load python/3.6.5
module load java/7u51
module load gcc/8.4.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9

sort --version
# sort (GNU coreutils) 8.25
# Copyright (C) 2016 Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
# 
# Written by Mike Haertel and Paul Eggert.









# My datasets:
module load python/3.6.5
module load java/7u51
module load gcc/8.4.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9



# Step 01. Prepare the database, index the database:
# this step may take hours.
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/index_default_ssu_rrna_db.py -h

python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/index_default_ssu_rrna_db.py -d /srv/scratch/z5039045/Julie/SPONGES_FOR_TT/13_MATAM/db_SILVA_128_SSURef_NR95__2017dl/ #SILVA_NR95 db downloaded in 2017


# Step 02:
# SSU rRNA recovery only
# read help message:
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -h

# example:
# 16 bacterial species simulated dataset
# Running de-novo assembly
cd /srv/scratch/z5039045/link_16S_MAG/test_matam/16sp_simulated_dataset/
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95 -i /srv/scratch/z5039045/link_16S_MAG/test_matam/16sp_simulated_dataset/16sp.art_HS25_pe_100bp_50x.fq --cpu 6 --max_memory 100000 -v -o /srv/scratch/z5039045/link_16S_MAG/test_matam/16sp_simulated_dataset/Test_matam_Shan


## matam_assembly.py terminated with no error
## 2017-11-07 16:30:12,912 - INFO - Run terminated in 2276.0977 seconds wall time
## matam_assembly.py terminated with no error
## 2018-04-30 20:27:58,030 - INFO - Run terminated in 3238.0346 seconds wall time
## generate files:
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.blast
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.fastq
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.log
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.sam
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.asqg
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.cpts_N1_E1.SGA_by_component.fasta
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.cpts_N1_E1.component_lca51pct.tab
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.cpts_N1_E1.components.csv
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.cpts_N1_E1.metaEdges.csv
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.cpts_N1_E1.metaNodes.csv
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.cpts_N1_E1.read_metanode_component.tab
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.cpts_N1_E1.read_metanode_component_taxo.tab
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.edges.csv
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50.nodes.csv
# 16sp.art_HS25_pe_100bp_50x.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.sam
# abundance_79_r1zdp
# components_assembly
# contigs.NR.fasta
# contigs.NR.min_500bp.fasta
# contigs.fasta
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.blast
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.blast.best_only.selected.bam
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.blast.best_only.selected.sam
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.blast.best_only.selected.sorted.bam
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.blast.best_only.selected.sorted.mpileup
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.blast.best_only.selected.sorted.scaffolds.fa
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.blast.best_only.selected.tab
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.blast.best_only.tab
# contigs.sortmerna_vs_complete_SILVA_128_SSURef_NR95_num_align_0.sam
# scaffolds.NR.fa
# 'scaffolds.NR.min_500bp.abd.fa'
# scaffolds.NR.min_500bp.fa
# scaffolds.fa