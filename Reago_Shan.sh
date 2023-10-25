######################### To run REAGO, you need to do a few things #########################

# HH_Ref3
# 1 Trim your fastq files. This can be done via trimmomatic. Basically I do this:

# For aligned raw reads (HH_Refined_3_aligned_R1_P.fastq   HH_Refined_3_aligned_R2_P.fastq):
# Actually the length of my aligned raw reads is 50-98, which could not be used. So I trim raw reads with mean length of 95bp:

module load java/8u91
module load fastqc/0.10.1
cd /srv/scratch/z5095298/Julie/SPONGES_FOR_TT/06_Re-Assembly/HH/HH_Refined_3
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE HH_Ref3_aligned_R1.fastq HH_Ref3_aligned_R2.fastq HH_Ref3_aligned_R1_L95_P.fastq HH_Ref3_aligned_R1_L95_UP.fastq HH_Ref3_aligned_R2_L95_P.fastq HH_Ref3_aligned_R2_L95_UP.fastq CROP:95 MINLEN:95
# CROP keeps only the first 95 bases.
# MINLEN ensures that anything of length less than 95 is dropped.
## Sequence Duplication Levels is not good.
rm HH_Ref3_aligned_R1_L95_UP.fastq
rm HH_Ref3_aligned_R2_L95_UP.fastq

#cp HH_Refined_3_aligned_R1_P.fastq
#cp HH_Refined_3_aligned_R2_P.fastq
#cp HH_Ref3_IDBA_metabat_bin.1.fa

mkdir HH_Ref3_aligned_R1_L95_P 
mkdir HH_Ref3_aligned_R2_L95_P
fastqc -o ./HH_Ref3_aligned_R1_L95_P HH_Ref3_aligned_R1_L95_P.fastq
fastqc -o ./HH_Ref3_aligned_R2_L95_P HH_Ref3_aligned_R2_L95_P.fastq


# 2 Rename your Fastq files. Use reago1.1_step2_Reassembly_file_renamer.py (By Willis) on forward and reverse fastq file. So:
module load python/3.5.2
python /srv/scratch/z5095298/software/reago1.1_step2_Reassembly_file_renamer/reago1.1_step2_Reassembly_file_renamer.py HH_Ref3_aligned_R1_L95_P.fastq HH_Ref3_aligned_R2_L95_P.fastq

# check if this step goes right!
head -20 HH_Ref3_aligned_R1_L95_P.fastq
head -20 HH_Ref3_aligned_R1_L95_P_renamed.fastq

head -20 HH_Ref3_aligned_R2_L95_P.fastq
head -20 HH_Ref3_aligned_R2_L95_P_renamed.fastq
## if the reads are same and only sequence_name was different that is right!



# 3 Convert to fasta. Easiest way is to load idba_ud, and then run fq2fa. So:
module load idba/1.1.1_512  

fq2fa HH_Ref3_aligned_R1_L95_P_renamed.fastq HH_Ref3_aligned_R1_L95_P_renamed.fa
fq2fa HH_Ref3_aligned_R2_L95_P_renamed.fastq HH_Ref3_aligned_R2_L95_P_renamed.fa

rm HH_Ref3_aligned_R1_L95_P_renamed.fastq
rm HH_Ref3_aligned_R2_L95_P_renamed.fastq



# 4 Run filtering. So:

module load infernal/1.1.1
module load genometools/1.5.9
module unload python/3.5.2
module load python/2.7.9

# rename HH_Ref3_aligned_R1_L95_P_renamed.fa as HH_Ref3_aligned_L95_P_renamed_R1.fa
# rename HH_Ref3_aligned_R2_L95_P_renamed.fa as HH_Ref3_aligned_L95_P_renamed_R2.fa

cp HH_Ref3_aligned_R1_L95_P_renamed.fa HH_Ref3_aligned_L95_P_renamed_R1.fa
cp HH_Ref3_aligned_R2_L95_P_renamed.fa HH_Ref3_aligned_L95_P_renamed_R2.fa
rm HH_Ref3_aligned_R1_L95_P_renamed.fa
rm HH_Ref3_aligned_R2_L95_P_renamed.fa
## Keep HH_Ref3_aligned_L95_P_renamed_R1.fa HH_Ref3_aligned_L95_P_renamed_R2.fa only!

python /srv/scratch/z5095298/software/reago/filter_input.py HH_Ref3_aligned_L95_P_renamed_R1.fa HH_Ref3_aligned_L95_P_renamed_R2.fa /srv/scratch/z5095298/Julie/SPONGES_FOR_TT/06_Re-Assembly/HH/HH_Refined_3/HH_Ref3_L95 /srv/scratch/z5095298/software/reago/cm ab 16
## This step takes 1 hour.
## the 'reago-1.1-master/cm' specifies to use its database, and 'ab' is for both archaea and bacteria. '16' is the number of nodes.





# 5 Once that is done, you need to run reago. This is what I do:
module load infernal/1.1.1
module load genometools/1.5.9

python /srv/scratch/z5095298/software/reago/reago.py /srv/scratch/z5095298/Julie/SPONGES_FOR_TT/06_Re-Assembly/HH/HH_Refined_3/HH_Ref3_L95/filtered.fasta /srv/scratch/z5095298/Julie/SPONGES_FOR_TT/06_Re-Assembly/HH/HH_Refined_3/HH_Ref3_L95/filter_out -l 95
# The '95' at the end specifies the length of the reads, which is the same as that specified via trimmomatic.