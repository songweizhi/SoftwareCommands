
################################## Screen manipulation ###################################

# Start a new screen session with session name	
screen -S Falcon_BS107

# List running screens	
screen -ls

# Attach to a running session	
screen -x 31180.test_6

# close a screen (which is 24795.falcon)
screen -X -S 24795.falcon quit

# To reattach the screen again
screen -dr <screen name>
screen -dr falcon


######################################### Falcon #########################################

# Load modules
module add python/2.7.12-gcc6 
module add falcon/1.8.6
export FALCON_WORKSPACE=$(pwd)


# Working_directory
cd /srv/scratch/z5039045/PacBio/Falcon


# Get input.fofn file
# raw reads
ls /srv/scratch/z3452659/ThomasPacBio-Nov15/data/2015-11-23.PacBioRaw/*/*/*.subreads.fasta > input.fofn
# preads
/srv/scratch/z3452659/ThomasPacBio-Nov15/data/2015-12-03.PacBioAssemblies/SON1053.SP16554.defaultsettings/SON1053.SP16554.hcq.preassembly.fasta


# Running Falcon
fc_run.py fc_run.cfg


# run padding_ctgs.py
cd 2-asm-falcon/
cp ../1-preads_ovl/db2falcon/preads4falcon.fasta .
python /srv/scratch/z5039045/Scripts/padding_ctgs.py > p_ctg_pad.fa​


# replace p_ctg.fa​with p_ctg_pad.fa​


# Running Falcon-Unzip
fc_unzip.py fc_unzip.cfg


# Running fc_quiver
fc_quiver.py fc_unzip.cfg


# get fasta stats
# cutoff
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_12000/2-asm-falcon/a_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_12000/2-asm-falcon/p_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_12000/2-asm-falcon/a_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_12000/2-asm-falcon/p_ctg.fa > 12000_p.txt

perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_5000/2-asm-falcon/a_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_5000/2-asm-falcon/p_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_5000/2-asm-falcon/a_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_5000/2-asm-falcon/p_ctg.fa > 5000_p.txt


perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl cns_h_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T cns_h_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl cns_p_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T cns_p_ctg.fasta


# get read length cutoff corresponding to 30X coverage
module add python/2.7.12-gcc6 
module add falcon/1.8.6
export FALCON_WORKSPACE=$(pwd)
cd /srv/scratch/z5039045/PacBio/Falcon

python /srv/scratch/z5039045/Softwares/SLiMSuite/tools/smrtscape.py optimise=T coverage=T genomesize=8500000 basefile=reads_not_mapped_to_the_8 seqin=reads_not_mapped_to_the_8.fasta

python /srv/scratch/z5039045/Softwares/SLiMSuite/tools/smrtscape.py optimise=T genomesize=8500000 basefile=reads_not_mapped_to_the_8 seqin=reads_not_mapped_to_the_8.fasta


######################################## run BBMAP #######################################

module load bbmap/35.82
bbnorm.sh -h

# To index and map at the same time:
cd /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test
bbmap.sh in=combined_reads.fasta out=test7_p_ctg_bbmap_best.sam ref=test7_p_ctg.fasta ambiguous=best
bbmap.sh in=combined_reads.fasta out=test7_p_ctg_bbmap_toss.sam ref=test7_p_ctg.fasta ambiguous=toss
bbmap.sh in=combined_reads.fasta out=test7_h_ctg_bbmap_best.sam ref=test7_h_ctg.fasta ambiguous=best
bbmap.sh in=combined_reads.fasta out=test7_h_ctg_bbmap_toss.sam ref=test7_h_ctg.fasta ambiguous=toss

# calculate purity
module load python/3.5.2
module load bbmap/35.82
cd /srv/scratch/z5039045/PacBio/Falcon/wd_2_genomes_test25/4-quiver/cns_output
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref cns_p_ctg.fasta -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref cns_h_ctg.fasta -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75


######################################## run BLASR #######################################

module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/Falcon
blasr /srv/scratch/z5039045/PacBio/Falcon/input.fofn CC6-YY-74.fasta -bestn 1 -sam -nproc 12 -out CC6-YY-74.sam



#################################### Calculate purity ####################################

# simulate short reads from the two reference genomes
module load python/3.5.2
cd /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/ref
python3 /srv/scratch/z5039045/PacBio/Falcon/Test_10.py -r 2.10.fasta -n 500000 -l 250 -c 1 -o 2.10_reads.fasta
python3 /srv/scratch/z5039045/PacBio/Falcon/Test_10.py -r BS107.fasta -n 500000 -l 250 -c 0 -o BS107_reads.fasta

# get summary of simulated short reads
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T 2.10_reads.fasta
Number of Contigs=500000, Total bp=125000000, Shortest=250, Longest=250, Average length=250.0, Average GC%=59.8%, Non-ACGT bases=0
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T BS107_reads.fasta
Number of Contigs=499849, Total bp=124903128, Shortest=50, Longest=250, Average length=249.9, Average GC%=59.8%, Non-ACGT bases=0

# mapping short reads to p_ctgs and h_ctgs
module load bowtie/2.2.9
module load samtools/1.3.1

cd /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test

# index reference
bowtie2-build -f test7_p_ctg.fasta test7_p_ctg
bowtie2-build -f test7_h_ctg.fasta test7_h_ctg

# mapping with bowtie2
bowtie2 -x test7_p_ctg combined_reads.fasta -S test7_p_ctg.sam -p 6 -f
bowtie2 -x test7_h_ctg combined_reads.fasta -S test7_h_ctg.sam -p 6 -f

# convert sam files to bam files with samtools
samtools view -bS test7_p_ctg.sam -o test7_p_ctg.bam
samtools view -bS test7_h_ctg.sam -o test7_h_ctg.bam

# sort bam files with samtools
samtools sort test7_p_ctg.bam -o test7_p_ctg_sorted.bam
samtools sort test7_h_ctg.bam -o test7_h_ctg_sorted.bam

# index sorted bam files with samtools
samtools index test7_p_ctg_sorted.bam
samtools index test7_h_ctg_sorted.bam

# parse sam file


########################################## Test ##########################################

# test1
input_type = raw
length_cutoff = 20000
length_cutoff_pr = 7000 


cd /srv/scratch/z5039045/PacBio/Falcon
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T wd_2_genomes_test25/4-quiver/cns_output/cns_p_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T wd_2_genomes_test25/4-quiver/cns_output/cns_h_ctg.fasta


perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T wd_2_genomes_test2_padded/4-quiver/cns_output/cns_p_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T wd_2_genomes_test2_padded/4-quiver/cns_output/cns_h_ctg.fasta




