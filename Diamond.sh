
module load diamond/0.9.31

# make diamond db
cd /srv/scratch/z5039045/KEGG_DB/kegg_genes_for_Blastp
diamond makedb --in prokaryotes.pep --db prokaryotes.pep.dmnd

# run diamond blastp
diamond blastp -q input.faa --db /srv/scratch/z5039045/KEGG_DB/kegg_genes_for_Blastp/prokaryotes.pep.fasta.dmnd --out KelpBins_KEGG_diamond.tab --outfmt 6 --evalue 0.001 --threads 6


 
diamond blastp -q GoodBins_0.5_0.05_PG_validated_pcofg.faa --db /srv/scratch/z5039045/KEGG_DB/kegg_genes_for_Blastp/prokaryotes.pep.fasta.dmnd --out KelpBins_KEGG_diamond.tab --outfmt 6 --evalue 0.001 --threads 6

