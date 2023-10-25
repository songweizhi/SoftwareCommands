
###################################### install iRep ######################################

# install iRep
module load python/3.7.3
source ~/mypython3env/bin/activate
pip install iRep


######################################## run iRep ########################################

# module load bowtie/2.3.5.1
# cd /srv/scratch/z5039045/Flow_cell_biofilm/0_References
# bowtie2-build -f 2.10wt_illumina.fasta 2.10wt_illumina
# bowtie2-build -f D2_pacbio.fasta D2_pacbio


module load python/3.7.3
source ~/mypython3env/bin/activate
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/Flow_cell_biofilm/7_iRep
bowtie2 -x ../0_References/2.10wt_illumina -1 ../2_combined_reads/Day0/210WTD0_R1_Q30_P.fastq -2 ../2_combined_reads/Day0/210WTD0_R2_Q30_P.fastq -S 210WTD0.sam --reorder -p 6
bPTR -f ../0_References/2.10wt_illumina.fasta -s 210WTD0.sam -o 210WTD0.bPTR.tsv -plot 210WTD0.bPTR.pdf -m coverage


module load python/3.7.3
source ~/mypython3env/bin/activate
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/Flow_cell_biofilm/7_iRep
bowtie2 -x ../0_References/D2_pacbio -1 ../2_combined_reads/Day0/D2D0_R1_Q30_P.fastq -2 ../2_combined_reads/Day0/D2D0_R2_Q30_P.fastq -S D2D0.sam --reorder -p 6
bPTR -f ../0_References/D2_pacbio.fasta -s D2D0.sam -o D2D0.bPTR.tsv -plot D2D0.bPTR.pdf -m coverage


# iRep -f ../0_References/2.10wt_illumina.fasta -s ../3_novoalign_nonsubsampled/210WTD0.sam -o 210WTD0
# iRep -f ../0_References/D2_pacbio.fasta -s ../3_novoalign_nonsubsampled/D2D0.sam -o D2D0



module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/Flow_cell_biofilm/7_iRep/refs_test
bowtie2-build -f 2.10wt_illumina_c.fasta 2.10wt_illumina_c
bowtie2-build -f 2.10wt_illumina.fasta 2.10wt_illumina
bowtie2-build -f D2_pacbio_c.fasta D2_pacbio_c
bowtie2-build -f D2_pacbio.fasta D2_pacbio
bowtie2-build -f D2_pacbio_p.fasta D2_pacbio_p




