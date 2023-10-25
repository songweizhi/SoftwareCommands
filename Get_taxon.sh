
#################################### prepare database ####################################

# wd
cd /srv/scratch/z5039045/Pfam_TIGR_db

# download Pfam DB
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz

# download TIGR DB
wget ftp://ftp.jcvi.org/pub/data/TIGRFAMs/14.0_Release/TIGRFAMs_14.0_HMM.tar.gz

# index database Pfam-A.hmm
hmmfetch --index Pfam-A.hmm

# extract needed hmms from Pfam DB
hmmfetch -f Pfam-A.hmm Pfam_ids.txt > Pfam_6.HMM

# convert format 
hmmconvert --outfmt 3/b Pfam_6.HMM > Pfam_6_3b.HMM

# Decompress TIGRFAM DB
tar -xzvf TIGRFAMs_14.0_HMM.tar.gz

# combined needed 120 HMMs as bac120.HMM
cat Pfam_6_3b.HMM TIGR_114.HMM > bac120.HMM


##################################### run get_taxon ######################################


# run TAG.py
module load python/3.5.2
module load hmmer/3.1b2
module load blast+/2.6.0
cd /srv/scratch/z5039045/hmmer_test
python3 /srv/scratch/z5039045/Softwares/TAG.py -bac120hmm /srv/scratch/z5039045/get_taxon_GTDB/bac120.HMM -blastdb /srv/scratch/z5039045/get_taxon_GTDB/bac120_msa_individual_genes_r83_no_dash -taxondb /srv/scratch/z5039045/get_taxon_GTDB/taxonomy_r83_March2018.tsv -ktImportText /home/z5039045/Krona/bin/ktImportText -hmmsearch hmmsearch -i test -c 80
python3 /srv/scratch/z5039045/Softwares/TAG.py -bac120hmm /srv/scratch/z5039045/get_taxon_GTDB/bac120.HMM -blastdb /srv/scratch/z5039045/get_taxon_GTDB/bac120_msa_individual_genes_r83_no_dash -taxondb /srv/scratch/z5039045/get_taxon_GTDB/taxonomy_r83_March2018.tsv -ktImportText /home/z5039045/Krona/bin/ktImportText -hmmsearch hmmsearch -i North_Sea -c 90
python3 /srv/scratch/z5039045/Softwares/TAG.py -bac120hmm /srv/scratch/z5039045/get_taxon_GTDB/bac120.HMM -blastdb /srv/scratch/z5039045/get_taxon_GTDB/bac120_msa_individual_genes_r83_no_dash -taxondb /srv/scratch/z5039045/get_taxon_GTDB/taxonomy_r83_March2018.tsv -ktImportText /home/z5095298/Krona/bin/ktImportText -hmmsearch hmmsearch -i input_genomes -c 80 -tuning

python3 /srv/scratch/z5039045/Softwares/TAG.py -bac120hmm /srv/scratch/z5039045/get_taxon_GTDB/bac120.HMM -blastdb /srv/scratch/z5039045/get_taxon_GTDB/bac120_msa_individual_genes_r83_no_dash -taxondb /srv/scratch/z5039045/get_taxon_GTDB/taxonomy_r83_March2018.tsv -ktImportText /home/z5039045/Krona/bin/ktImportText -hmmsearch hmmsearch -i CF_36bins_faa -c 80


# on MAC
python3 ~/PycharmProjects/TAG/TAG.py -bac120hmm /Users/songweizhi/Softwares/get_taxon_GTDB/bac120.HMM -blastdb /Users/songweizhi/Softwares/get_taxon_GTDB/bac120_msa_individual_genes_r83_no_dash -taxondb /Users/songweizhi/Softwares/get_taxon_GTDB/taxonomy_r83_March2018.tsv -ktImportText ktImportText -hmmsearch /Users/songweizhi/Softwares/hmmer/hmmer-3.1b2-macosx-intel/binaries/hmmsearch -i genome_folder -c 80

python3 ~/PycharmProjects/TAG/TAG.py -bac120hmm ~/Softwares/get_taxon_GTDB/bac120.HMM -blastdb ~/Softwares/get_taxon_GTDB/bac120_msa_individual_genes_r83_no_dash -taxondb ~/Softwares/get_taxon_GTDB/taxonomy_r83_March2018.tsv -ktImportText ktImportText -hmmsearch ~/Softwares/hmmer/hmmer-3.1b2-macosx-intel/binaries/hmmsearch -i genome_folder -c 85 -tuning
