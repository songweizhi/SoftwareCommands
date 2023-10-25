
# BlastKOALA and GhostKOALA


# BlastKOALA accepts a smaller dataset and is suitable for annotating high-quality genomes 
# https://www.kegg.jp/blastkoala/


# GhostKOALA accepts a larger dataset and is suitable for annotating metagenomes 
# https://www.kegg.jp/ghostkoala/


# Online KEGG annotation

# 1) Upload the faa files containing all the proteins predicted for the bins by prokka to blastkoala (http://www.kegg.jp/blastkoala/). 
#    You need to provide some basic data: the taxonomy of your bin (wait for kaiju results) and which database you would like to use (go for species_prokaryotes). 
#    You will receive an email asking for job confirmation.
# 2) Inspect the results
# 3) Download the annotation data to the 3_Mapping
# 4) Add description
perl ../0_DataNeeded/kegg_reader.pl user_ko.txt

