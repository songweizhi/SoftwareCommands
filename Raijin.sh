
#################################### install MyBioTools ##################################

module load python3/3.7.2
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate
pip install MyBioTools
pip install MetaCHIP
pip install Binning_refiner
pip install HgtSIM
pip install drep


make install INSTALLDIR=/home/561/wzs561/Softwares/bin
make install INSTALLDIR=/home/z5039045/Software/bin


######################################## run dRep ########################################


# test
module load perl/5.22.1
module load python3/3.7.2
source ~/mypython3env/bin/activate

/home/561/wzs561/Softwares/bin/prodigal
/home/561/wzs561/Softwares/MUMmer3.23/mummer


module load mash/2.1
module load gani/1

cd /srv/scratch/z5095298/Weizhi_Song/MetaCHIP_Kelp_bins
dRep dereplicate test_dRep -g test/*.fasta -pa 0.9 -sa 0.99 --genomeInfo GoodBins_0.5_0.05_qualities.txt -comp 50 -p 12

