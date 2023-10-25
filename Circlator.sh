
# linkage
http://sanger-pathogens.github.io/circlator/

# load module 
module load bwa/0.7.17
module load prodigal/2.6.3
module load samtools/1.2
module load mummer/3.23
module load perl/5.20.1
module load java/8u151
module load canu/1.7
module load spades/3.9.0
module load python/3.5.2
cd ~
. mypython3env/bin/activate


# for installation
pip3 install circlator


# cd to working directory
cd /srv/scratch/z5039045/PacBio/2018-06-07_circlator


# combine all subreads together
cat /srv/scratch/z3452659/ThomasPacBio-Nov15/data/2015-11-23.PacBioRaw/SON1053*/SON1053*/*.subreads.fasta > combined_all_subreads.fasta

# copy assemblies to working directory
cp /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.qv20.fas .


# run circlator
circlator all hcq7.fasta combined_all_subreads.fasta hcq7_circularized
circlator all hcq43.fasta combined_all_subreads.fasta hcq43_circularized
circlator all hcq44.fasta combined_all_subreads.fasta hcq44_circularized













# for other checks

# get sequence length
cd /srv/scratch/z5039045/PacBio
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl SON1053.SP16554.hcq.qv20.fas
# hcq7_SON1053__SP016554.7	3690170	57.0%	0

cd /srv/scratch/z5039045/PacBio/quiver_polish
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl combined_10.fasta
# Ratl_SON1053__RE16554.7	3662281	57.1%	0

perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl combined_10.consensus.fasta
# Ratl_SON1053__RE16554.7	3662295	57.1%	0





