
################################## Database update info ##################################

# The dbCAN HMMdb v8 is released (based on CAZyDB 7/26/2019), HMMdb contains 641 CAZyme HMMs (421 family HMMs + 3 cellulosome HMMs + 217 subfamily HMMs)

# The CAZyDB for Diamond search containing in total 1,386,849 fasta sequences.

# db files 
# http://bcb.unl.edu/dbCAN2/download/

# GitHub: https://github.com/linnabrown/run_dbcan

################################# DB files and formatting ################################

# install python modules
module load python/3.7.3
source ~/mypython3env/bin/activate
pip install natsort
pip3 install run-dbcan

# install FragGeneScan
# go to https://sourceforge.net/projects/fraggenescan/ and download FragGeneScan1.31.tar.gz
#tar -xzvf FragGeneScan1.31.tar.gz 
#export PATH=/srv/scratch/z5039045/Softwares/FragGeneScan1.31:$PATH

# Prepare db files
module load hmmer/3.1b2
module load diamond/0.9.24
cd /srv/scratch/z5039045/DB/dbCAN2
# wget http://bcb.unl.edu/dbCAN2/download/Databases/CAZyDB.07312018.fa
wget http://bcb.unl.edu/dbCAN2/download/Databases/CAZyDB.07312019.fa
wget http://bcb.unl.edu/dbCAN2/download/Databases/dbCAN-HMMdb-V8.txt
wget http://bcb.unl.edu/dbCAN2/download/Databases/tcdb.fa
wget http://bcb.unl.edu/dbCAN2/download/Databases/tf-1.hmm
wget http://bcb.unl.edu/dbCAN2/download/Databases/tf-2.hmm
wget http://bcb.unl.edu/dbCAN2/download/Databases/stp.hmm
# diamond makedb --in CAZyDB.07312018.fa -d CAZy
diamond makedb --in CAZyDB.07312019.fa -d CAZy
diamond makedb --in tcdb.fa -d tcdb
mv dbCAN-HMMdb-V8.txt dbCAN.txt
hmmpress dbCAN.txt
hmmpress tf-1.hmm
hmmpress tf-2.hmm
hmmpress stp.hmm


#################################### run run_dbcan.py ####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.1b2
module load diamond/0.9.24
module load prodigal/2.6.3
module load fraggenescan/1.31

cd /srv/scratch/z5039045/Test_and_backup/dbcan2_test
run_dbcan.py EscheriaColiK12MG1655.fna prok --out_dir output_EscheriaColiK12MG1655 --db_dir /srv/scratch/z5039045/DB/dbCAN2
