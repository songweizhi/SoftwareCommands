
####################################### copy files to Gadi #######################################

# step 1: login to Katana data mover node (kdm.restech.unsw.edu.au)
ssh z1234567@kdm.restech.unsw.edu.au

# step 2: copy files to Gadi, you'll need to type the password to login to Gadi
scp /srv/scratch/z5095298/BH_ER_R1.fastq wzs561@gadi.nci.org.au:/scratch/du5/wzs561/
scp /srv/scratch/z5095298/BH_ER_R2.fastq wzs561@gadi.nci.org.au:/scratch/du5/wzs561/


###################################### install BioSAK ####################################

module load intel-mkl/2019.3.199
module load python3/3.7.4

mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate

pip3 install --upgrade BioSAK


##########################################################################################

module load intel-mkl/2020.2.254
module load python3/3.8.5
source ~/mypython3env/bin/activate
BioSAK -h
