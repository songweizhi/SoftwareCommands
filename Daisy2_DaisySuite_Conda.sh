
############################ install DaisySuite (2019-07-10) #############################

# https://daisysuite.readthedocs.io/en/latest/tutorial/install_git.html

cd /srv/scratch/z5039045/Softwares
git clone https://gitlab.com/eseiler/DaisySuite.git
cd DaisySuite
chmod +x DaisySuite*
export PATH=/srv/scratch/z5039045/Softwares/DaisySuite/:$PATH


# get additional dependency for Laser
cd /srv/scratch/z5039045/Softwares/DaisySuite
mkdir bin
cd bin
wget https://raw.githubusercontent.com/lh3/bwa/master/xa2multi.pl
export PATH=/srv/scratch/z5039045/Softwares/DaisySuite/bin:$PATH


# install python modules
module load python/3.7.3
cd ~
. mypython3env/bin/activate
pip install snakemake
pip install pysam
pip install scipy
pip install pandas
pip install biopython


############################### run DaisySuite (2019-07-10) ##############################

module load python/3.7.3
cd ~
. mypython3env/bin/activate

module load bedtools/2.27.1
module load samtools/1.10
module load bwa/0.7.17
module load seqan/2.4.0  # include gustaf, mason2, sak, stellar and yara
module load boost/1.68.0-gcc7
module load cmake/3.14.5
module load gcc/7.3.0
module load ctk/2.4

export PATH=/srv/scratch/z5039045/Softwares/DaisySuite/:$PATH
export PATH=/srv/scratch/z5039045/Softwares/DaisySuite/bin:$PATH

cd /srv/scratch/z5039045/Softwares/DaisySuite/example
DaisySuite --configfile M0.yaml








