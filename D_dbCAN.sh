
################################## Database update info ##################################

# The dbCAN HMMdb v8 is released (based on CAZyDB 7/26/2019), HMMdb contains 641 CAZyme HMMs (421 family HMMs + 3 cellulosome HMMs + 217 subfamily HMMs)

# The CAZyDB for Diamond search containing in total 1,386,849 fasta sequences.

# http://bcb.unl.edu/dbCAN2/download/Databases/dbCAN-old@UGA/readme.txt

# FTP: 
# http://bcb.unl.edu/dbCAN2/download/

# GitHub: https://github.com/linnabrown/run_dbcan


############################# Manual Page (old hmmscan way) ##############################

# DB files
# http://bcb.unl.edu/dbCAN2/download/Databases/dbCAN-old@UGA/

# ** if you want to run dbCAN CAZyme annotation on your local linux computer, do the following:
# ** 1. download dbCAN-fam-HMMs.txt, hmmscan-parser.sh 
# ** 2. download HMMER 3.0 package [hmmer.org] and install it properly
# ** 3. format HMM db: hmmpress dbCAN-fam-HMMs.txt
# ** 4. run: hmmscan --domtblout yourfile.out.dm dbCAN-fam-HMMs.txt yourfile > yourfile.out
# ** 5. run: sh hmmscan-parser.sh yourfile.out.dm > yourfile.out.dm.ps (if alignment > 80aa, use E-value < 1e-5, otherwise use E-value < 1e-3; covered fraction of HMM > 0.3)
# ** 6. run: cat yourfile.out.dm.ps | awk '$5<1e-15&&$10>0.35' > yourfile.out.dm.ps.stringent (this allows you to get the same result as what is produced in our dbCAN2 webpage)

# Cols in yourfile.out.dm.ps:
# 1. Family HMM
# 2. HMM length
# 3. Query ID
# 4. Query length
# 5. E-value (how similar to the family HMM)
# 6. HMM start
# 7. HMM end
# 8. Query start
# 9. Query end
# 10. Coverage

# ** About what E-value and Coverage cutoff thresholds you should use (in order to further parse yourfile.out.dm.ps file), we have done some evaluation analyses. Our suggestion is that for bacteria, use E-value < 1e-18 and coverage > 0.35.
# ** We have also performed evaluation for the five CAZyme classes separately, which suggests that the best threshold varies for different CAZyme classes (please see http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4132414/ for details). Basically to annotate GH proteins, one should use a very relax coverage cutoff or the sensitivity will be low (Supplementary Tables S4 and S9); (ii) to annotate CE families a very stringent E-value cutoff and coverage cutoff should be used; otherwise the precision will be very low due to a very high false positive rate (Supplementary Tables S5 and S10)
# ** On our dbCAN2 website, we use E-value < 1e-15 and coverage > 0.35, which is more stringent than the default ones in hmmscan-parser.sh

# download hmmscan-parser.sh and HMM db
cd /srv/scratch/z5039045/DB/dbCAN_old
wget http://bcb.unl.edu/dbCAN2/download/Databases/dbCAN-old@UGA/hmmscan-parser.sh
wget http://bcb.unl.edu/dbCAN2/download/Databases/dbCAN-old@UGA/dbCAN-fam-HMMs.txt
hmmpress dbCAN-fam-HMMs.txt


########################### run dbCAN locally (old hmmscan way) ##########################

# load modules
module load hmmer/3.2.1

# hmmscan --domtblout yourfile.out.dm dbCAN-fam-HMMs.txt yourfile > yourfile.out
cd /srv/scratch/z5039045/Test_and_backup/dbCAN_test
hmmscan --domtblout Refined_3.out.dm /srv/scratch/z5039045/DB/dbCAN/dbCAN-fam-HMMs.txt Refined_3.faa > Refined_3.out

# if alignment > 80aa, use E-value < 1e-5, otherwise use E-value < 1e-3; covered fraction of HMM > 0.3
# sh hmmscan-parser.sh yourfile.out.dm > yourfile.out.dm.ps 
sh /srv/scratch/z5039045/DB/dbCAN_old/hmmscan-parser.sh Refined_3.out.dm > Refined_3.out.dm.ps 

# this allows you to get the same result as what is produced in our dbCAN2 webpage.
# for bacteria, use E-value < 1e-18 and coverage > 0.35
# cat yourfile.out.dm.ps | awk '$5<1e-15&&$10>0.35' > yourfile.out.dm.ps.stringent 
cat Refined_3.out.dm.ps | awk '$5<1e-18&&$10>0.35' > Refined_3.out.dm.ps.stringent 


################################ run dbCAN with MyBioTools ###############################

module load python/3.7.3
cd ~
. mypython3env/bin/activate
module load hmmer/3.1b2

# single file
cd /srv/scratch/z5039045/Test_and_backup/dbCAN_test/dbCAN
MyBioTools dbCAN -m P -t 4 -DB_dir /srv/scratch/z5039045/DB/dbCAN -i Refined_3.faa

# multiple files
cd /srv/scratch/z5039045/Test_and_backup/dbCAN_test/dbCAN
MyBioTools dbCAN -m P -t 4 -DB_dir /srv/scratch/z5039045/DB/dbCAN -i faa_files -x faa

