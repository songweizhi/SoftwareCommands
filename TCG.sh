
# command for TCG
module load python/3.5.2
module load hmmer/3.1b2
module load blast+/2.6.0

cd /srv/scratch/z5039045/hmmer_test

python3 /srv/scratch/z5039045/Softwares/TCG.py -bac120hmm /srv/scratch/z5039045/get_taxon_GTDB/bac120.HMM -blastdb /srv/scratch/z5039045/get_taxon_GTDB/bac120_msa_individual_genes_r83_no_dash -taxondb /srv/scratch/z5039045/get_taxon_GTDB/taxonomy_r83_March2018.tsv -ktImportText /home/z5039045/Krona/bin/ktImportText -i gtdbtk_BW_faa 

