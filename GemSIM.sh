
module load python/2.7.15 
cd /srv/scratch/z5039045/GemSIM_test
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R ../../input_genomes_m30 -a /srv/scratch/z5039045/MetaCHIP/m30/1_GemSIM_9_million/replicate1_wd/abundance_1.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o replicate_1 -q 33 -u d -s 30 -n 3000000 -l d -p

python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -r o1.fna -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o o1 -q 33 -u d -s 30 -n 3000000 -l d -p









##################################### get error model ####################################

module load bowtie/2.3.5.1
bowtie2-build -f PhiX.fasta PhiX
bowtie2 -x PhiX -1 Undetermined_S0_L001_R1_001.fastq -2 Undetermined_S0_L001_R2_001.fastq -S PhiX.sam --no-unal --quiet --threads 12 -q

module load samtools/1.10
samtools view -bS PhiX.sam -o PhiX.bam
samtools sort PhiX.bam -o PhiX_sorted.bam
samtools index PhiX_sorted.bam

module load python/2.7.15 
cd /srv/scratch/z5039045/MarkerMAG_wd/phix
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemErr.py -r 151 -f PhiX.fasta -s PhiX.sam -p -n phix_err 

python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemErr.py -r 151 -f PhiX.fasta -s PhiX.sam -p -n phix_2020_i5 -i 5 &


# GemReads.py 
cd /srv/scratch/z5039045/MetaCHIP/m30/1_GemSIM_9_million/replicate1_wd
python /srv/scratch/z5039045/Softwares/GemSIM_v1.6/GemReads.py -R ../../input_genomes_m30 -a /srv/scratch/z5039045/MetaCHIP/m30/1_GemSIM_9_million/replicate1_wd/abundance_1.txt -m /srv/scratch/z5039045/Softwares/GemSIM_v1.6/models/ill100v5_p.gzip -o replicate_1 -q 33 -u d -s 30 -n 3000000 -l d -p


####################################### GenSIM_neg #######################################

# load python3
module load python/3.5.2

# cd to working directory
cd /srv/scratch/z5039045/Kerrin/GemSIM_neg

# prepare input files
config.txt
abundance.txt
20_genomes_neg

# run GemSIM (Step 1-1)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg config_neg.txt 
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg config_95.txt 
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg config_90.txt 

# run FastQC (Step 1-2)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg config_neg.txt
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg config_95.txt
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg config_90.txt

# check the quality of filtered reads

# run IDBA_UD (Step 2)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg config_neg.txt -qsub
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg config_95.txt -qsub
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg config_90.txt -qsub


# copy combined reads (combined.fasta) file to raijin
# login to raijin:
ssh wzs561@raijin.nci.org.au
password: 52shan14A
#then run:
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/Kerrin/GemSIM_neg/2_IDBA_UD/combined.fasta /short/du5/wzs561/GemSIM/neg
# run assemble on raijin with qsub script, an example:
/short/du5/wzs561/GemSIM/neg/idba_ud_neg.sh
# copy assemblies (scaffold.fa) to Katana
rsync -avPS /short/du5/wzs561/GemSIM/neg/combined_K20-100/scaffold.fa z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/Kerrin/GemSIM_neg/2_IDBA_UD/combined_k20-100

# run Mapping (Step 3)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_3_Mapping.py -cfg config_neg.txt
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_3_Mapping.py -cfg config_95.txt
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_3_Mapping.py -cfg config_90.txt

# run Binning (Step 4)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_4_Binning.py -cfg config_neg.txt
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_4_Binning.py -cfg config_90.txt

# run Binning_refiner:
# rename Metabat bin folder to MetaBAT
mv scaffold_k20-100_lt2500_MetaBAT MetaBAT 
# rename MyCC bin folder to MyCC
mv 20170312_2052_56mer_0.7_cov MyCC
# run Binning_refiner
module unload python/2.7.10
qsub -I -q express
module load R/3.3.1
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 MetaBAT -2 MyCC

# get correlations between refined bins and input genomes 
cd /srv/scratch/z5039045/Kerrin/GemSIM_neg
mkdir 5_get_correlations
# cp input genomes into 5_get_correlations and renamed to Ref
cp -r /srv/scratch/z5039045/Kerrin/GemSIM_neg/20_genomes_neg /srv/scratch/z5039045/Kerrin/GemSIM_neg/5_get_correlations/Ref
# cp refined bins into 5_get_correlations
cp -r /srv/scratch/z5039045/Kerrin/GemSIM_neg/4_Binning/outputs/Refined /srv/scratch/z5039045/Kerrin/GemSIM_neg/5_get_correlations
# get correlations
module load blast+/2.2.31
cd /srv/scratch/z5039045/Kerrin/GemSIM_neg/5_get_correlations
python3 /srv/scratch/z5039045/Scripts/get_correlations.py -1 Refined -2 Ref

# run Prokka for refined bins
# combine ffn and gbk files
# run all_vs_all blast
# run MetaCHIP for refined bins


####################################### GenSIM_100 #######################################

# cd to working directory
cd /srv/scratch/z5039045/Kerrin/GemSIM_100
# run GemSIM (Step 1-1)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_1_GemSIM.py -cfg config_100.txt 
# run FastQC (Step 1-2)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_1_2_QC.py -cfg config_100.txt
# run IDBA_UD (Step 2)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_2_Assemble.py -cfg config_100.txt -qsub
# copy combined reads (combined.fasta) file to raijin
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/Kerrin/GemSIM_100/2_IDBA_UD/combined.fasta /short/du5/wzs561/GemSIM/100
# copy assemblies (scaffold.fa) to Katana
rsync -avPS /short/du5/wzs561/GemSIM/100/combined_K20-100/scaffold.fa z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/Kerrin/GemSIM_100/2_IDBA_UD/combined_k20-100
# run Mapping (Step 3)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_3_Mapping.py -cfg config_100.txt
# run Binning (Step 4)
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/Step_4_Binning.py -cfg config_100.txt
# run Binning_refiner:
# rename Metabat bin folder to MetaBAT
mv scaffold_k20-100_lt2500_MetaBAT MetaBAT 
# rename MyCC bin folder to MyCC
mv 20170321_0842_56mer_0.7_cov MyCC
# run Binning_refiner
module unload python/2.7.10
module load python/3.5.2
module load R/3.3.1
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 MetaBAT -2 MyCC
# get correlations between refined bins and input genomes 
cd /srv/scratch/z5039045/Kerrin/GemSIM_100
mkdir 5_get_correlations
# cp input genomes into 5_get_correlations and renamed to Ref
cp -r /srv/scratch/z5039045/Kerrin/GemSIM_100/20_genomes_100 /srv/scratch/z5039045/Kerrin/GemSIM_100/5_get_correlations/Ref
# cp refined bins into 5_get_correlations
cp -r /srv/scratch/z5039045/Kerrin/GemSIM_100/4_Binning/outputs/Refined /srv/scratch/z5039045/Kerrin/GemSIM_100/5_get_correlations
# get correlations
module load blast+/2.2.31
cd /srv/scratch/z5039045/Kerrin/GemSIM_100/5_get_correlations
python3 /srv/scratch/z5039045/Scripts/get_correlations.py -1 Refined -2 Ref
# rename refined bins according to correlations
mv Refined_4.fasta AAM.fasta 
mv Refined_11.fasta AKV.fasta 
mv Refined_5.fasta AMAC.fasta 
mv Refined_1.fasta AMAU.fasta 
mv Refined_18.fasta AMS.fasta 
mv Refined_16.fasta ARL.fasta 
mv Refined_19.fasta ARS.fasta 
mv Refined_6.fasta ASJ.fasta 
mv Refined_14.fasta ASN.fasta 
mv Refined_2.fasta ATM.fasta 
mv Refined_15.fasta BAD.fasta 
mv Refined_3.fasta BDS.fasta 
mv Refined_10.fasta BGC.fasta 
mv Refined_12.fasta BHS.fasta 
mv Refined_8.fasta BNM.fasta 
mv Refined_20.fasta BRT.fasta 
mv Refined_13.fasta BSA.fasta 
mv Refined_7.fasta BSD.fasta 
mv Refined_9.fasta BSL.fasta 
mv Refined_17.fasta BTK.fasta 

# run Prokka for refined bins
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder input_genomes -genome_extension fna
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py -genome_folder Refined -genome_extension fasta

# run all_vs_all blast
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep2_BLAST.py
# run MetaCHIP for refined bins
module load python/3.5.2
module load blast+/2.2.31
python3 /srv/scratch/z5039045/Softwares/MetaCHIP/MetaCHIP.py -cfg config.txt
# get gene correlation



######################################### To-do #########################################

# line 86, 87 in Step_3_Mapping.py
# delete sam files in Step_3_Mapping.py
# python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep1_Prokka.py
# python3 /srv/scratch/z5039045/Softwares/MetaCHIP/InPrep2_BLAST.py




module load samtools/1.10
module load bowtie/2.3.5.1
cd /srv/scratch/z5039045/phix
bowtie2-build -f phix_seqs.fasta phix_seqs
bowtie2 -x phix_seqs -1 Undetermined_S0_L001_R1_001.fastq -2 Undetermined_S0_L001_R2_001.fastq -S phix.sam -p 12 -q --no-unal
samtools view -bS phix.sam -o phix.bam
samtools sort phix.bam -o phix_sorted.bam
samtools index phix_sorted.bam




