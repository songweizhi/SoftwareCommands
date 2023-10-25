
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






# subset subreads
module load python/3.5.2
cd /srv/scratch/z5039045/PacBio/2018-06-07_circlator
python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i combined_all_subreads.fasta -r 0.05 -o combined_all_subreads_0.05.fasta
python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i combined_all_subreads.fasta -r 0.1 -o combined_all_subreads_0.1.fasta
python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i combined_all_subreads.fasta -r 0.2 -o combined_all_subreads_0.2.fasta



# run circlator
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

cd /srv/scratch/z5039045/PacBio/2018-06-07_circlator
circlator all hcq44.fasta combined_all_subreads.fasta hcq44_circularized





# with AMOS
# https://github.com/PacificBiosciences/Bioinformatics-Training/wiki/Circularizing-and-trimming
module load amos/3.1.0

cd /srv/scratch/z5039045/PacBio/2018-06-12_AMOS_circlator



toAmos -s hcq7_with_break.fasta -o circularized.afg

minimus2 circularized


toAmos -s hcq3_1.fasta -o circularized_hcq3.afg
minimus2 circularized_hcq3





# 

python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i hcq7.fasta -r 1 -o hcq7_1.fasta
python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i hcq3.fasta -r 1 -o hcq3_1.fasta



Australian Centre for Ecogenomics (ACE)


######################### run circlator with own subreads subset #########################

# get AD91A subreads subset
module load python/3.5.2
cd /srv/scratch/z5039045/PacBio/2018-06-07_circlator
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam /srv/scratch/z5039045/PacBio/Falcon/get_unmapped_reads/all_ctgs.sam -ctg nonAD91A_hcq_ids.txt -option 0 -out AD91A_subreads.fasta
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam /srv/scratch/z5039045/PacBio/Falcon/get_unmapped_reads/all_ctgs.sam -ctg nonAD91A_hcq_43_44.txt -option 0 -out AD91A_43_44_subreads.fasta

# subset AD91A subreads subset to 34x, ratio=0.2

python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i AD91A_subreads.fasta -r 0.1 -o AD91A_subreads_0.1.fasta
python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i AD91A_subreads.fasta -r 0.15 -o AD91A_subreads_0.15.fasta
python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i AD91A_subreads.fasta -r 0.2 -o AD91A_subreads_0.2.fasta
python3 /srv/scratch/z5039045/Scripts/subset_NonPaired_reads.py -i AD91A_43_44_subreads.fasta -r 0.3 -o AD91A_43_44_subreads_0.3.fasta

# run circlator
cd /srv/scratch/z5039045/PacBio/2018-06-07_circlator
circlator all AD91A_hcqs.fasta AD91A_subreads_0.1.fasta AD91A_hcqs_circularized_0.1
circlator all AD91A_hcq43_44.fasta AD91A_43_44_subreads_0.3.fasta AD91A_43_44_circularized


















