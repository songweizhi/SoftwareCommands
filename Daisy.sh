
####################################### Daisy manual #####################################

# for single donor candidate
-dr -d "seq_id"
# for multiple donor candidates
-dr -d2 file_with_seq_ids

# output interpretation
https://github.com/ktrappe/daisy

# Variant Call Format
http://www.internationalgenome.org/wiki/Analysis/variant-call-format
http://samtools.github.io/hts-specs/VCFv4.2.pdf

# Multiple donor candidates
# If you want to test multiple donor candidates at once, use the -d2 parameter with a textfile
# containing the desired donor gis. The program expects one gi per line. The donor reference
# file then has to contain all donor references (multifasta). Alternatively, you can provide
# a second donor reference file with parameter -dr2.

# !!!!! eads format: >ATM_1/1, use slash to separate reads direction!!!!!

###################################### Daisy test run ####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load samtools/0.1.19
module load bedtools/2.27.1
module load gcc/7.3.0
module load boost/1.68.0-gcc7
module load bwa/0.7.17
module load cmake/3.14.5
module load seqan/2.4.0
module load ctk/2.4
export PATH=/srv/scratch/z5039045/Softwares/Daisy/:$PATH

# simulate reads
cd /srv/scratch/z5039045/Daisy_test/simulate_reads_1
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ATM.fna -n 10000 -l 250 -i 500 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R BGC.fna -n 10000 -l 250 -i 500 -split
cd /srv/scratch/z5039045/Daisy_test/simulate_reads_2
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ATM.fna -n 100000 -l 250 -i 500 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R BGC.fna -n 100000 -l 250 -i 500 -split
cd /srv/scratch/z5039045/Daisy_test/simulate_reads_3
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ATM.fna -n 100000 -l 150 -i 100 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R BGC.fna -n 100000 -l 150 -i 100 -split


# run Daisy
cd /srv/scratch/z5039045/Daisy_test/daisy_wd
daisy.py -r1 ../R1.fasta -r2 ../R2.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"

cd /srv/scratch/z5039045/Daisy_test/daisy_wd_1
daisy.py -r1 ../R1.fasta -r2 ../R2.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"

cd /srv/scratch/z5039045/Daisy_test/daisy_wd_2
daisy.py -r1 ../R1_t.fasta -r2 ../R2_t.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"



cd /srv/scratch/z5039045/Flow_cell_biofilm/5_Daisy_test/AAM_to_BAD_new_1
daisy.py -r1 ../combined_R1.fasta -r2 ../combined_R2.fasta -ar ../ar.fasta -dr ../dr.fasta -a "BAD" -d "AAM"

cd /srv/scratch/z5039045/Flow_cell_biofilm/5_Daisy_test/AAM_to_BAD_new_2
daisy.py -r1 ../combined_R1_formatted.fasta -r2 ../combined_R2_formatted.fasta -ar ../ar.fasta -dr ../dr.fasta -a "BAD" -d "AAM"


cd /srv/scratch/z5039045/Daisy_test/daisy_wd_2_BGC_to_ATM
daisy.py -r1 ../simulate_reads_2/ATM_BGC_R1.fasta -r2 ../simulate_reads_2/ATM_BGC_R2.fasta -ar ../References/ATM.fna -dr ../References/BGC.fna -a "ATM" -d "BGC"
cd /srv/scratch/z5039045/Daisy_test/daisy_wd_2_ATM_to_BGC
daisy.py -r1 ../simulate_reads_2/ATM_BGC_R1.fasta -r2 ../simulate_reads_2/ATM_BGC_R2.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"



cd /srv/scratch/z5039045/Daisy_test/daisy_wd_3_BGC_to_ATM
daisy.py -r1 ../simulate_reads_3/ATM_BGC_R1.fasta -r2 ../simulate_reads_3/ATM_BGC_R2.fasta -ar ../References/ATM.fna -dr ../References/BGC.fna -a "ATM" -d "BGC"
cd /srv/scratch/z5039045/Daisy_test/daisy_wd_3_ATM_to_BGC
daisy.py -r1 ../simulate_reads_3/ATM_BGC_R1.fasta -r2 ../simulate_reads_3/ATM_BGC_R2.fasta -ar ../References/BGC.fna -dr ../References/ATM.fna -a "BGC" -d "ATM"




# Biofilm dataset

module load python/3.7.3
source ~/mypython3env/bin/activate
cd /srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D9_R1_Q30_P.fasta -o 12D9_R1_Q30_P_renamed.fasta -s 1
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D9_R2_Q30_P.fasta -o 12D9_R2_Q30_P_renamed.fasta -s 2
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D18_R1_Q30_P.fasta -o 12D18_R1_Q30_P_renamed.fasta -s 1
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D18_R2_Q30_P.fasta -o 12D18_R2_Q30_P_renamed.fasta -s 2
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D27_R1_Q30_P.fasta -o 12D27_R1_Q30_P_renamed.fasta -s 1
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D27_R2_Q30_P.fasta -o 12D27_R2_Q30_P_renamed.fasta -s 2
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D42_R1_Q30_P.fasta -o 12D42_R1_Q30_P_renamed.fasta -s 1
python /srv/scratch/z5039045/Scripts/Rename_FC_biofilm_reads.py -i 12D42_R2_Q30_P.fasta -o 12D42_R2_Q30_P_renamed.fasta -s 2


/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D9_R1_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D9_R2_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D18_R1_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D18_R2_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D27_R1_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D27_R2_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D42_R1_Q30_P_renamed.fasta
/srv/scratch/z5039045/Flow_cell_biofilm/2_combined_reads/12D42_R2_Q30_P_renamed.fasta


cd /srv/scratch/z5039045/Flow_cell_biofilm/5_Daisy
python /srv/scratch/z5039045/Softwares/daisy/daisy.py -r1 ../2_combined_reads/12D9_R1_Q30_P_renamed.fasta -r2 ../2_combined_reads/12D9_R2_Q30_P_renamed.fasta -ar 2.10wt_illumina.fasta -dr D2_pacbio.fasta -a "2.10_chromosome" -d D2_seq_ids.txt --outdir 12D9_210_chromosome/ --task 12D9_210_chromosome




cd /srv/scratch/z5039045/Flow_cell_biofilm/Flow_cell_biofilm_dataset
cp -r /home/z5039045/torsten/Weizhi_Song/Flow_cell_biofilm_dataset/raw_reads/run_1 ./
cd /srv/scratch/z5039045/Flow_cell_biofilm/Flow_cell_biofilm_dataset
cp -r /home/z5039045/torsten/Weizhi_Song/Flow_cell_biofilm_dataset/raw_reads/run_2 ./
cd /srv/scratch/z5039045/Flow_cell_biofilm/Flow_cell_biofilm_dataset
cp -r /home/z5039045/torsten/Weizhi_Song/Flow_cell_biofilm_dataset/raw_reads/run_3 ./



################## Daisy test (one transfer with multiple proportions) ###################

# wd
module load python/3.7.3
source ~/mypython3env/bin/activate
module load samtools/0.1.19
module load bedtools/2.27.1
module load gcc/7.3.0
module load boost/1.68.0-gcc7
module load bwa/0.7.17
module load cmake/3.14.5
module load seqan/2.4.0
module load ctk/2.4
export PATH=/srv/scratch/z5039045/Softwares/Daisy/:$PATH
cd /srv/scratch/z5039045/Daisy_test/one_transfer


# Var10_WT0, works!!!
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var10_WT0
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var10_WT0
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 100000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 100000 -l 150 -i 200 -split
cat ATM_R1.fasta BGC_R1.fasta > combined_R1.fasta
cat ATM_R2.fasta BGC_R2.fasta > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"


# Var9_WT1, works!!!
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var9_WT1
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var9_WT1
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 90000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 90000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/ATM.fna -n 10000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/BGC.fna -n 10000 -l 150 -i 200 -split
cat *R1* > combined_R1.fasta
cat *R2* > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"


# Var5_WT5
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var5_WT5
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var5_WT5
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 50000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 50000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/ATM.fna -n 50000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/BGC.fna -n 50000 -l 150 -i 200 -split
cat *R1* > combined_R1.fasta
cat *R2* > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"


# Var1_WT9
mkdir /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var1_WT9
cd /srv/scratch/z5039045/Daisy_test/one_transfer/2_reads_simulation/Var1_WT9
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/ATM.fna -n 10000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../1_ATM_24000bp_25600bp_to_BGC_48000bp/BGC.fna -n 10000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/ATM.fna -n 90000 -l 150 -i 200 -split
python /srv/scratch/z5039045/Softwares/Reads_simulator.py -R ../../0_References/BGC.fna -n 90000 -l 150 -i 200 -split
cat *R1* > combined_R1.fasta
cat *R2* > combined_R2.fasta
daisy.py -r1 combined_R1.fasta -r2 combined_R2.fasta -ar ../../0_References/BGC.fna -dr ../../0_References/ATM.fna -a "BGC" -d "ATM"









