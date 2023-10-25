
# Global versus Local Alignment:
# BBMap is a global aligner. That means it looks for the highest-scoring alignment taking into account all bases in a sequence. 
# A local aligner would look for the best-scoring local alignment, meaning an alignment where the ends are possibly clipped off. 
# So, if there were two possible alignment locations for a 100bp read, one with 3 mismatches scattered through a read, and one 
# with 5 mismatches all in the last 10bp of a read, BBMap would place the read at the location with 3 mismatches, while a local 
# aligner would probably place it at the location with 5 mismatches, but clip the end so that the result would be a clipped 90bp 
# sequence with zero mismatches. Which of these is better depends on the experiment, but global alignments are essential in order 
# to detect long indels.

# BBMap has a “local” flag, which will convert its global alignments into local alignments. That does not make it a local aligner 
# – it still looks for the best global alignment. If the local flag is enabled, then the alignment will be clipped if that yields 
# a higher score. So, BBMap will create local alignments, but it will not guarantee that it finds the optimal local alignment – 
# rather, it will produce local alignments from the optimal global alignments.

# ambiguous=all
# local=t
# threads=auto


module load java/8u201-jdk
module load bbmap/38.51


# To index and map:     
bbmap.sh ref=<reference fasta>     
bbmap.sh in=<reads> out=<output sam>


# To map without writing an index:
bbmap.sh ref=<reference fasta> in=<reads> out=<output sam> nodisk


module load java/8u201-jdk
module load bbmap/38.51
cd /srv/scratch/z5039045/Mac_test
bbmap.sh ref=combined_16S.ffn
bbmap.sh in=combined_5x_R1.fasta in2=combined_5x_R2.fasta out=combined_5x.sam local=t
bbmap.sh ref=combined_16S.ffn in=combined_5x_R1.fasta in2=combined_5x_R2.fasta out=combined_5x2.sam local=t nodisk






module load java/8u201-jdk
module load bbmap/38.51
cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/Kelp_0.999_aa_MarkerMAG_wd/Kelp_0.999_aa_step_1_wd/bwa_test
bbmap.sh ref=BH_ER_050417_assembled_16S_uclust_0.999.fasta in=../../../Kelp_R1.fasta in2=../../../Kelp_R2.fasta outm=test_bbmap_only_mapped_all.sam local=t nodisk threads=6 ambiguous=all


module load java/8u201-jdk
module load bbmap/38.51
cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/Kelp_0.999_aa_MarkerMAG_wd/Kelp_0.999_aa_step_1_wd/bwa_test
bbmap.sh ref=BH_ER_050417_assembled_16S_uclust_0.999.fasta in=../../../Kelp_R1.fasta in2=../../../Kelp_R2.fasta outm=test_bbmap_only_mapped_all.sam local=t nodisk threads=6 ambiguous=all
bbmap.sh ref=BH_ER_050417_assembled_16S_uclust_0.999.fasta in=../../../Kelp_R1.fasta in2=../../../Kelp_R2.fasta outm=test_bbmap_only_mapped_all.sam local=t nodisk threads=6 ambiguous=all -Xmx20g
bbmap.sh ref=BH_ER_050417_assembled_16S_uclust_0.999.fasta in=../../../Kelp_R1.fasta in2=../../../Kelp_R2.fasta outm=test_bbmap_only_mapped_all.sam local=t nodisk threads=6 ambiguous=all -Xmx20g 2> bbmap_stderr.txt


bbmap.sh in=reads.fq ref=D.fa path=/another/location/


# test out of memory issue
module load java/8u201-jdk
module load bbmap/38.51
cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/Kelp_0.999_bbmap_MarkerMAG_wd/Kelp_0.999_bbmap_step_1_wd
bbmap.sh ref=Kelp_0.999_bbmap_MarkerMAG_wd/Kelp_0.999_bbmap_step_1_wd/BH_ER_050417_refined_bins_db/BH_ER_050417_refined_bins_combined.fa in=Kelp_0.999_bbmap_MarkerMAG_wd/Kelp_0.999_bbmap_step_1_wd/unmapped_paired_reads.fasta outm=Kelp_0.999_bbmap_MarkerMAG_wd/Kelp_0.999_bbmap_step_1_wd/BH_ER_050417_refined_bins_db/BH_ER_050417_refined_bins_combined.sam local=t nodisk=t ambiguous=all sam=1.3 keepnames=t saa=f silent=true threads=1 2> Kelp_0.999_bbmap_MarkerMAG_wd/Kelp_0.999_bbmap_step_1_wd/BH_ER_050417_refined_bins_db/BH_ER_050417_refined_bins_combined_bbmap_stderr.txt

cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/Kelp_0.999_bbmap_MarkerMAG_wd.backup2/Kelp_0.999_bbmap_step_1_wd/BH_ER_050417_refined_bins_db
bbmap.sh ref=BH_ER_050417_refined_bins_combined.fa in=../unmapped_paired_reads.fasta outm=BH_ER_050417_refined_bins_combined.sam local=t nodisk=t ambiguous=all sam=1.3 keepnames=t saa=f silent=true threads=1 

cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/Kelp_0.999_bbmap_MarkerMAG_wd/Kelp_0.999_bbmap_step_1_wd/BH_ER_050417_refined_bins_db
bbmap.sh ref=BH_ER_050417_refined_bins_combined.fa in=../unmapped_paired_reads.fasta outm=BH_ER_050417_refined_bins_combined.sam local=t nodisk=t ambiguous=all sam=1.3 keepnames=t saa=f silent=true threads=6


module load java/8u201-jdk
module load bbmap/38.51
cd /srv/scratch/z5039045/test_bbmap
bbmap.sh ref=ref.fa in=read.fa outm=test.sam local=t nodisk=t ambiguous=all sam=1.3 keepnames=t saa=f silent=true threads=6
bbmap.sh ref=CF_refined_bins_combined.fa in=unmapped_paired_reads.fasta outm=test.sam local=t nodisk=t ambiguous=all keepnames=t saa=f trd=t silent=true threads=6 scoretag=t
bbmap.sh ref=ref.fa in=read.fa outm=test.sam local=t nodisk=t ambiguous=all keepnames=t saa=f trd=t silent=true threads=6 scoretag=t



module load java/8u201-jdk
module load bbmap/38.51
cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/test_bbmap

bbmap.sh ref=Kelp_16S.fasta in=Kelp_R1_subset.fastq in2=Kelp_R2_subset.fastq outm=reads_to_16S_fq.sam local=t nodisk=t ambiguous=all keepnames=t saa=f trd=t silent=true threads=12 -Xmx10g 2> reads_to_16S_fq_bbmap_stderr.txt

bbmap.sh ref=Kelp_16S.fasta in=Kelp_R1_subset.fasta in2=Kelp_R2_subset.fasta outm=reads_to_16S_fa.sam local=t nodisk=t ambiguous=all keepnames=t saa=f trd=t silent=true threads=12 -Xmx10g 2> reads_to_16S_fa_bbmap_stderr.txt





module load java/8u201-jdk
module load bbmap/38.51
reformat.sh in=Kelp_R1.fasta
reformat.sh in=Kelp_R2.fasta

reformat.sh in=combined_R1.fasta
reformat.sh in=combined_R2.fasta

reformat.sh in=Oral_5_25_R1.fasta
reformat.sh in=Oral_5_25_R2.fasta

# Input:                  	86612979 reads          	10891615200 bases






# test indel with bbmap
module load java/8u201-jdk
module load bbmap/38.51

cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26/gc_bias
bbmap.sh ref=FP.fna in=../MBARC26_R1.fasta in2=../MBARC26_R2.fasta outm=FP_bbmap_random_indel_2.sam nodisk=t ambiguous=random keepnames=t saa=f trd=t silent=true threads=12 -Xmx10g indelfilter=2
bbmap.sh ref=FP.fna in=../MBARC26_R1.fasta in2=../MBARC26_R2.fasta outm=FP_bbmap_random_indel_5.sam nodisk=t ambiguous=random keepnames=t saa=f trd=t silent=true threads=12 -Xmx10g indelfilter=5
bbmap.sh ref=FP.fna in=../MBARC26_R1.fasta in2=../MBARC26_R2.fasta outm=FP_bbmap_random_2_2_2_2.sam nodisk=t ambiguous=random keepnames=t saa=f trd=t silent=true threads=12 -Xmx10g subfilter=2 insfilter=2 delfilter=2 indelfilter=2


python3 filter_sam.py -in FP_bbmap_random_indel_2.sam -out FP_bbmap_random_indel_2_mis0.sam -mm 0 -aln 50
python3 filter_sam.py -in FP_bbmap_random_2_2_2_2.sam -out FP_bbmap_random_2_2_2_2_mis0.sam -mm 0 -aln 50
