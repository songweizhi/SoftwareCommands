# NCBI Conserved Domains Database (CDD) 
ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd


############ make rpsblast database ############
# if you want to build a db yourself, all smp files needed to build the rpsblast database are here:
ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/cdd.tar.gz 

# and here is a ready-to-use rpsblast database provided by NCBI:
ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/little_endian/Cog_LE.tar.gz

# It has been saved to the scratch:  
-db /srv/scratch/z5039045/COG_annotation_db/Cog


############ run rpsblast and cdd2cog.pl ############ 
module load blast+/2.6.0
rpsblast -query ATM.faa -db /srv/scratch/z5039045/COG_annotation_db/Cog -out ATM.tab -evalue 1e-2 -outfmt 6 


module load perl/5.20.1
# refers to: https://github.com/aleimba/bac-genomics-scripts/tree/master/cdd2cog
perl /srv/scratch/z5039045/Scripts/cdd2cog.pl -r ATM.tab -c /srv/scratch/z5039045/COG_annotation_db/cddid.tbl -f /srv/scratch/z5039045/COG_annotation_db/fun.txt -w /srv/scratch/z5039045/COG_annotation_db/whog


############ here is an easy way ############

BioSAK COG2003 -h
BioSAK COG2014 -h
