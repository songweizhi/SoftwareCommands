
################################# construct profile hmms #################################

# align sequences
module load mafft/7.407 
cd /srv/scratch/z5039045/hmmer_test
mafft --quiet --retree 1 K18831.fasta > K18831_fast.aln
mafft --quiet --maxiterate 1000 --globalpair K18831.fasta > K18831_slow.aln

# construct profile HMM
module load hmmer/3.3
hmmbuild K18831_fast.hmm K18831_fast.aln

hmmsearch -o /dev/null --domtblout APA_bin_52_K18831_fast_hmmout.tbl K18831_fast.hmm APA_bin_52.faa


################################### update hmm profile ###################################

# Download Pfam DB (v32.0)
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam32.0/Pfam-A.hmm.gz

# Download TIGR DB (v14.0)
wget ftp://ftp.jcvi.org/pub/data/TIGRFAMs/14.0_Release/TIGRFAMs_14.0_HMM.tar.gz

hmmfetch -f Pfam-A.hmm hmm_profile_41_ids.txt


#################################### prepare database ####################################

# wd
cd /srv/scratch/z5039045/Pfam_TIGR_db

# download Pfam DB
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz

# download TIGR DB
wget ftp://ftp.jcvi.org/pub/data/TIGRFAMs/14.0_Release/TIGRFAMs_14.0_HMM.tar.gz
wget ftp://ftp.jcvi.org//pub/data/TIGRFAMs/14.0_Release/TIGRFAMs_14.0_HMM.tar.gz

# index database Pfam-A.hmm
hmmfetch --index Pfam-A.hmm

# extract needed hmms from Pfam DB
hmmfetch -f Pfam-A.hmm Pfam_ids.txt > Pfam_6.HMM

# convert format 
hmmconvert --outfmt 3/b Pfam_6.HMM > Pfam_6_3b.HMM

# Decompress TIGRFAM DB
tar -xzvf TIGRFAMs_14.0_HMM.tar.gz

# combined needed 120 HMMs as bac120.HMM
cat Pfam_6_3b.HMM TIGR_114.HMM > bac120.HMM


##########################################################################################

module load mafft/7.310
module load hmmer/3.3

cd /srv/scratch/z5039045/hmm_test

mafft --quiet --maxiterate 1000 --globalpair proA.fna > proA.aln
hmmbuild proA.hmm proA.aln
hmmsearch proA.hmm AAM.fasta


module load python/3.5.2
module load prodigal/2.6.3 
cd /srv/scratch/z5039045/Test_and_backup/hmmer_test
python3 /srv/scratch/z5039045/Scripts/Prodigal_wrapper.py -i human_gut -o human_hut_prodigal -x fna -t 6


######################################### Bernd ##########################################

cd /srv/scratch/z5039045/Test_and_backup/hmmer_test/Bernd
hmmsearch -o /dev/null --domtblout AAM_hmmout.tbl phylo5.hmm AAM.faa
hmmsearch -o /dev/null --domtblout AKV_hmmout.tbl phylo5.hmm AKV.faa
hmmsearch -o /dev/null --domtblout AMAC_hmmout.tbl phylo5.hmm AMAC.faa
hmmsearch -o /dev/null --domtblout BAD_hmmout.tbl phylo5.hmm BAD.faa
hmmsearch -o /dev/null --domtblout BDS_hmmout.tbl phylo5.hmm BDS.faa
hmmsearch -o /dev/null --domtblout BGC_hmmout.tbl phylo5.hmm BGC.faa


######################################## GTDB-Tk #########################################

cd /srv/scratch/z5039045/Test_and_backup/hmmer_test/GTDBTK

# hmmsearch
hmmsearch --domtblout AAM_hmmout.tbl phylo5.hmm AAM.faa > AAM.hmmerOut
hmmsearch --domtblout AKV_hmmout.tbl phylo5.hmm AKV.faa > AKV.hmmerOut
hmmsearch --domtblout AMAC_hmmout.tbl phylo5.hmm AMAC.faa > AMAC.hmmerOut
hmmsearch --domtblout BAD_hmmout.tbl phylo5.hmm BAD.faa > BAD.hmmerOut
hmmsearch --domtblout BDS_hmmout.tbl phylo5.hmm BDS.faa > BDS.hmmerOut
hmmsearch --domtblout BGC_hmmout.tbl phylo5.hmm BGC.faa > BGC.hmmerOut

# hmmalign (with --trim)
hmmalign --trim --outformat PSIBLAST phylo5.hmm query > AAM.hmmalignOut
hmmalign --trim --outformat PSIBLAST phylo5.hmm query > AKV.hmmalignOut
hmmalign --trim --outformat PSIBLAST phylo5.hmm query > AMAC.hmmalignOut
hmmalign --trim --outformat PSIBLAST phylo5.hmm query > BAD.hmmalignOut
hmmalign --trim --outformat PSIBLAST phylo5.hmm query > BDS.hmmalignOut
hmmalign --trim --outformat PSIBLAST phylo5.hmm query > BGC.hmmalignOut

# hmmalign test
hmmalign --outformat PSIBLAST PF00164.20.hmm PF00164.20.fasta > PF00164.20.aln
hmmalign --outformat PSIBLAST PF00177.16.hmm PF00177.16.fasta > PF00177.16.aln
hmmalign --outformat PSIBLAST PF00181.18.hmm PF00181.18.fasta > PF00181.18.aln
hmmalign --outformat PSIBLAST PF00189.15.hmm PF00189.15.fasta > PF00189.15.aln
hmmalign --outformat PSIBLAST PF00203.16.hmm PF00203.16.fasta > PF00203.16.aln
hmmalign --trim --outformat PSIBLAST PF00164.20.hmm PF00164.20.fasta > PF00164.20.trim.aln
hmmalign --trim --outformat PSIBLAST PF00177.16.hmm PF00177.16.fasta > PF00177.16.trim.aln
hmmalign --trim --outformat PSIBLAST PF00181.18.hmm PF00181.18.fasta > PF00181.18.trim.aln
hmmalign --trim --outformat PSIBLAST PF00189.15.hmm PF00189.15.fasta > PF00189.15.trim.aln
hmmalign --trim --outformat PSIBLAST PF00203.16.hmm PF00203.16.fasta > PF00203.16.trim.aln
hmmalign --trim --outformat PSIBLAST TIGR00344.hmm TIGR00344.fasta > TIGR00344.aln
hmmalign --trim --outformat PSIBLAST TIGR00422.hmm TIGR00422.fasta > TIGR00422.aln

module load hmmer/3.3
cd /srv/scratch/z5039045/Test_and_backup/hmm_test
hmmalign --trim --outformat PSIBLAST PF00312.17.hmm PF00312.17.fasta > PF00312.17.aln


########################################## Mine ##########################################

cd /srv/scratch/z5039045/Test_and_backup/hmmer_test/GTDBTK
hmmsearch --domtblout AAM_hmmout.tbl phylo5.hmm AAM.faa > AAM.hmmerOut; rm AAM.hmmerOut
hmmsearch --domtblout AKV_hmmout.tbl phylo5.hmm AKV.faa > AKV.hmmerOut; rm AKV.hmmerOut
hmmsearch --domtblout AMAC_hmmout.tbl phylo5.hmm AMAC.faa > AMAC.hmmerOut; rm AMAC.hmmerOut
hmmsearch --domtblout BAD_hmmout.tbl phylo5.hmm BAD.faa > BAD.hmmerOut; rm BAD.hmmerOut
hmmsearch --domtblout BDS_hmmout.tbl phylo5.hmm BDS.faa > BDS.hmmerOut; rm BDS.hmmerOut
hmmsearch --domtblout BGC_hmmout.tbl phylo5.hmm BGC.faa > BGC.hmmerOut; rm BGC.hmmerOut


hmmstat MetaCHIP_phylo.hmm > MetaCHIP_phylo.hmm.stat.txt
hmmemit MetaCHIP_phylo.hmm




module load hmmer/3.3
cd /srv/scratch/z5039045/test_willis
hmmsearch TIGR01584.HMM Chlorobium_tepidum.faa
hmmsearch TIGR01584_raw.HMM Chlorobium_tepidum.faa


######################################## ELP Pfams #######################################

module load hmmer/3.3

cd /srv/scratch/z5039045/DB/ELP_hmms
hmmfetch -f Pfam-A.hmm ELP_Pfams.txt


hmmsearch --cut_ga --cut_nc --cut_tc -o /dev/null --domtblout BGC_hmmout.tbl phylo5.hmm BGC.faa


module load hmmer/3.3
cd /srv/scratch/z5039045/hmmer_test
hmmsearch --cut_ga --cut_nc --cut_tc -o /dev/null --domtblout APA_bin_1_PF00164_hmmout.tbl hmm_profile_fetched/PF00164.25.hmm APA_bin_1.faa
hmmsearch --cut_ga --cut_nc --cut_tc -o /dev/null --domtblout APA_bin_3_PF00164_hmmout.tbl hmm_profile_fetched/PF00164.25.hmm APA_bin_3.faa
hmmsearch --cut_ga --cut_nc --cut_tc -o /dev/null --domtblout APA_bin_4_PF00164_hmmout.tbl hmm_profile_fetched/PF00164.25.hmm APA_bin_4.faa


hmmsearch --cut_tc -o /dev/null --domtblout APA_bin_1_PF00164_hmmout.tbl hmm_profile_fetched/PF00164.25.hmm APA_bin_1.faa
hmmsearch --cut_tc -o /dev/null --domtblout APA_bin_1_combined_43_hmmout.tbl combined_43.hmm APA_bin_1.faa

