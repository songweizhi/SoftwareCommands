
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/Mira_test

mkdir $TMPDIR/mira


rm -r $TMPDIR/mira/MT4_fq_Mira_Assembly_assembly
mira -c $TMPDIR/mira /srv/scratch/z5039045/Mira_test/manifest_MT4_fq.txt
cp -r $TMPDIR/mira/MT4_fq_Mira_Assembly_assembly ./

# 4.3.1.  Manifest for shotgun data
# 4.3.3.  Manifest for data sets with paired reads
# Chapter 7: Working with the results of MIRA


mira -c $TMPDIR/mira /srv/scratch/z5039045/Mira_test/manifest_MT4_fa.txt 
cp -r $TMPDIR/mira/MT4_fa_Mira_Assembly_assembly ./

mira -c $TMPDIR/mira /srv/scratch/z5039045/Mira_test/manifest_MBARC26.txt 
cp -r $TMPDIR/mira/MBARC26_Mira_Assembly_assembly ./

mira -c $TMPDIR/mira /srv/scratch/z5039045/Mira_test/manifest_unpaired.txt 


##########################################################################################
################################ test with simulated reads ###############################
##########################################################################################

# simulate reads
module load python/2.7.15 
cd /srv/scratch/z5039045/GemSIM_test
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -r o1.fna -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o o1 -q 33 -u d -s 30 -n 300000 -l d -p

cd /srv/scratch/z5039045/GemSIM_test2
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -r o1.fna -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o o1 -q 33 -u d -s 30 -n 600000 -l d -p


# QC
module load java/8u121
cd /srv/scratch/z5039045/GemSIM_test
java -jar /apps/trimmomatic/0.38/trimmomatic-0.38.jar PE o1_fir.fastq o1_sec.fastq o1_R1_Q30_P.fastq o1_R1_Q30_UP.fastq o1_R2_Q30_P.fastq o1_R2_Q30_UP.fastq ILLUMINACLIP:/apps/trimmomatic/0.38/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:30 MINLEN:50


# run fastqc to check the quaities of filtered reads
module load fastqc/0.11.8
fastqc o1_fir.fastq
fastqc o1_sec.fastq
fastqc o1_R1_Q30_P.fastq 
fastqc o1_R2_Q30_P.fastq 
fastqc o1_R1_Q30_UP.fastq 
fastqc o1_R2_Q30_UP.fastq


# fq2fa
module load idba/1.1.3 
fq2fa o1_R1_Q30_P.fastq o1_R1_Q30_P.fasta 
fq2fa o1_R2_Q30_P.fastq o1_R2_Q30_P.fasta
fq2fa o1_R1_Q30_UP.fastq o1_R1_Q30_UP.fasta 
fq2fa o1_R2_Q30_UP.fastq o1_R2_Q30_UP.fasta


# assemble with metaspades 
module load spades/3.12.0
cd /srv/scratch/z5039045/HgtSIM/metaspades
spades.py -1 o1_R1_Q30_P.fastq -2 o1_R2_Q30_P.fastq -o o1_spades_wd


# assemble with Mira with fastq files
mkdir $TMPDIR/Mira_test_paired_fq_wd
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/GemSIM_test
mira -c $TMPDIR/Mira_test_paired_fq_wd /srv/scratch/z5039045/GemSIM_test/manifest_paired_fq.txt

# assemble with Mira with fastq files of R1
mkdir $TMPDIR/Mira_test_R1_fq_wd
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/GemSIM_test
mira -c $TMPDIR/Mira_test_R1_fq_wd /srv/scratch/z5039045/GemSIM_test/manifest_R1_fq.txt
cp -r $TMPDIR/Mira_test_R1_fq_wd ./


# 4.2.2 unpaired Illumina data
mkdir $TMPDIR/Mira_test_R1_fq2_wd
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/GemSIM_test
mira -c $TMPDIR/Mira_test_R1_fq2_wd /srv/scratch/z5039045/GemSIM_test/manifest_R1_fq2.txt
cp -r $TMPDIR/Mira_test_R1_fq2_wd ./


# Good!
mkdir $TMPDIR/Mira_test_R1_fq3_wd
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/GemSIM_test
mira -c $TMPDIR/Mira_test_R1_fq3_wd /srv/scratch/z5039045/GemSIM_test/manifest_R1_fq3.txt
cp -r $TMPDIR/Mira_test_R1_fq3_wd ./


mkdir $TMPDIR/Mira_test_R1_fa3_wd
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/GemSIM_test
mira -c $TMPDIR/Mira_test_R1_fa3_wd /srv/scratch/z5039045/GemSIM_test/manifest_R1_fa3.txt
cp -r $TMPDIR/Mira_test_R1_fa3_wd ./

# as EST
mkdir $TMPDIR/Mira_test_R1_fq_wd_EST
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd
mira -c $TMPDIR/Mira_test_R1_fq_wd_EST /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/manifest_mira5_est.txt
cp -r $TMPDIR/Mira_test_R1_fq_wd_EST ./

module load samtools/1.10
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/Mira_test_R1_fq_wd_EST/mini_assembly_mira5_aware_chimera_assembly/mini_assembly_mira5_aware_chimera_d_results
bowtie2-build -f mini_assembly_mira5_aware_chimera_out.unpadded.fasta mini_assembly_mira5_aware_chimera_out.unpadded
bowtie2 -x mini_assembly_mira5_aware_chimera_out.unpadded -U ../../../free_living_read_combined.fastq -S mini_assembly_mira5_aware_chimera_out.unpadded.sam -p 12
samtools view -bS mini_assembly_mira5_aware_chimera_out.unpadded.sam -o mini_assembly_mira5_aware_chimera_out.unpadded.bam
samtools sort mini_assembly_mira5_aware_chimera_out.unpadded.bam -o mini_assembly_mira5_aware_chimera_out.unpadded_sorted.bam
samtools index mini_assembly_mira5_aware_chimera_out.unpadded_sorted.bam


# as EST, aware chimera
mkdir $TMPDIR/Mira_test_R1_fq_EST_chimera
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd
mira -c $TMPDIR/Mira_test_R1_fq_EST_chimera /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/manifest_mira5_est_chimera.txt
cp -r $TMPDIR/Mira_test_R1_fq_EST_chimera ./

module load samtools/1.10
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/Mira_test_R1_fq_EST_chimera/mini_assembly_mira5_est_chimera_assembly/mini_assembly_mira5_est_chimera_d_results
bowtie2-build -f mini_assembly_mira5_est_chimera_out.unpadded.fasta mini_assembly_mira5_est_chimera_out.unpadded
bowtie2 -x mini_assembly_mira5_est_chimera_out.unpadded -U ../../../free_living_read_combined.fastq -S mini_assembly_mira5_est_chimera_out.unpadded.sam -p 12
samtools view -bS mini_assembly_mira5_est_chimera_out.unpadded.sam -o mini_assembly_mira5_est_chimera_out.unpadded.bam
samtools sort mini_assembly_mira5_est_chimera_out.unpadded.bam -o mini_assembly_mira5_est_chimera_out.unpadded_sorted.bam
samtools index mini_assembly_mira5_est_chimera_out.unpadded_sorted.bam




module load samtools/1.10
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/Mira_EST/mira_est_assembly/mira_est_d_results
mira_est_out.unpadded.fasta



cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/Mira_EST_no_chimera/mira_est_no_chimera_assembly/mira_est_no_chimera_d_results
BioSAK reads2bam -p mira_est_no_chimera -ref mira_est_no_chimera_out.unpadded.fasta -u ../../../free_living_read_combined.fastq -fastq -t 12 -index_ref






mkdir $TMPDIR/Mira_EST
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd
mira -c $TMPDIR/Mira_EST /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/manifest_mira5_est.txt
cp -r $TMPDIR/Mira_EST ./


mkdir $TMPDIR/Mira_EST_no_chimera
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd
mira -c $TMPDIR/Mira_EST_no_chimera /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/manifest_mira5_est_no_chimera.txt
cp -r $TMPDIR/Mira_EST_no_chimera ./





module load python/3.7.3
source ~/mypython3env/bin/activate
python3 rename_reads.py -r1 S0_R1_Q25_P.fq -r2 S0_R2_Q25_P.fq -p S0 -fq
python3 rename_reads.py -r1 S1_R1_Q25_P.fq -r2 S1_R2_Q25_P.fq -p S1 -fq
python3 rename_reads.py -r1 S2_R1_Q25_P.fq -r2 S2_R2_Q25_P.fq -p S2 -fq
python3 rename_reads.py -r1 S3_R1_Q25_P.fq -r2 S3_R2_Q25_P.fq -p S3 -fq
python3 rename_reads.py -r1 S4_R1_Q25_P.fq -r2 S4_R2_Q25_P.fq -p S4 -fq
python3 rename_reads.py -r1 S5_R1_Q25_P.fq -r2 S5_R2_Q25_P.fq -p S5 -fq
python3 rename_reads.py -r1 S9_R1_Q25_P.fq -r2 S9_R2_Q25_P.fq -p S9 -fq
python3 rename_reads.py -r1 S10_R1_Q25_P.fq -r2 S10_R2_Q25_P.fq -p S10 -fq
python3 rename_reads.py -r1 S11_R1_Q25_P.fq -r2 S11_R2_Q25_P.fq -p S11 -fq
python3 rename_reads.py -r1 S12_R1_Q25_P.fq -r2 S12_R2_Q25_P.fq -p S12 -fq

cat S0_R1.fastq S1_R1.fastq S2_R1.fastq S3_R1.fastq S4_R1.fastq S5_R1.fastq S9_R1.fastq S10_R1.fastq S11_R1.fastq S12_R1.fastq > GI_R1.fastq
cat S0_R2.fastq S1_R2.fastq S2_R2.fastq S3_R2.fastq S4_R2.fastq S5_R2.fastq S9_R2.fastq S10_R2.fastq S11_R2.fastq S12_R2.fastq > GI_R2.fastq



/srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/1_filtered_reads/GI_R1.fastq
/srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/1_filtered_reads/GI_R2.fastq

module load idba/1.1.3 
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/1_filtered_reads
fq2fa GI_R1.fastq GI_R1.fasta 
fq2fa GI_R2.fastq GI_R2.fasta 






module unload python
module load python/3.7.3
source ~/mypython3env/bin/activate
module unload R
module load R/4.0.2
module load blast+/2.9.0
module load bowtie/2.3.5.1
module load samtools/1.10
module load spades/3.14.0
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP
python3 link_16s_55_127.py -p CAMI2_GI_mplu5_longkmer_55-127_2nd -s1_mi 98 -s1_mc 30 -s1_mpl 10 -s1_mplu 5 -s2_g 300 -s2_m 50 -depth 0 -r1 1_filtered_reads/GI_R1.fasta -r2 1_filtered_reads/GI_R2.fasta -marker 3_GI_Matam16S_wd/3_GI_assembled_16S_uclust_0.995.fasta -mag 4_binning/GI_refined_bins -x fasta -t 12 -tmp -force





# 4.2.2 unpaired Illumina data
mkdir $TMPDIR/mini_assembly_mira5
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd
mira -c $TMPDIR/mini_assembly_mira5 /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/CAMI2_GI_mplu5_longkmer_55-127_2nd_MarkerMAG_wd/CAMI2_GI_mplu5_longkmer_55-127_2nd_step_2_wd/manifest_mira5.txt
cp -r $TMPDIR/mini_assembly_mira5 ./




perl ~/Scripts/select_contig.pl -m 350 scaffolds.fasta scaffolds_350.fasta
perl ~/Scripts/select_contig.pl -m 350 mini_assembly_mira5_out.unpadded.fasta mini_assembly_mira5_out.unpadded_350.fasta

perl ~/Scripts/select_contig.pl -m 500 scaffolds.fasta scaffolds_500.fasta
perl ~/Scripts/select_contig.pl -m 500 mini_assembly_mira5_out.unpadded.fasta mini_assembly_mira5_out.unpadded_500.fasta


