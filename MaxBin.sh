
# run MaxBin
module load velvet/1.2.10
module load perl/5.28.0
module load idba/1.1.3
module load hmmer/3.3
module load fraggenescan/1.31
module load bowtie/2.3.5.1
module load maxbin/2.2.3
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI_high
run_MaxBin.pl -contig contig_min2500.fasta -out MaxBin_wd -sample_1_depth.txt -abund2 sample_2_depth.txt -abund3 sample_3_depth.txt -thread 12


# format of depth file (no header, tab separated)
NODE_1_length_252598_cov_0.093528	0
NODE_2_length_234548_cov_3.415278	103.241
NODE_3_length_209164_cov_0.098758	0
NODE_4_length_206201_cov_0.184361	0
NODE_5_length_204400_cov_0.070484	0
NODE_6_length_195456_cov_4.878134	225.687

