
################################# install syri on Katana #################################

# refers to: https://github.com/schneebergerlab/syri

module load python/3.5.7
mkdir ~/mypython357env
python3 -m venv --system-site-packages ~/mypython357env
source ~/mypython357env/bin/activate

pip install numpy
pip install scipy
pip install pandas==0.23.4
pip install pysam
pip install matplotlib
pip install psutil
pip install python-igraph
pip install biopython==1.76
pip install Cython


# download source code from https://github.com/schneebergerlab/syri
# decompress and rename the folder "syri-master" to "syri"

# make files in folder "syri" executable
cd /srv/scratch/z5039045/Softwares/syri
chmod 777 *
chmod 777 */*
chmod 777 */*/*
chmod 777 */*/*/*
chmod 777 */*/*/*/*
chmod 777 */*/*/*/*/*
chmod 777 */*/*/*/*/*/*

cd /srv/scratch/z5039045/Softwares/syri
python setup.py install


################################# test with example data #################################

# refers to: https://schneebergerlab.github.io/syri/pipeline.html

cd /srv/scratch/z5039045/Zillur/syri_test
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/146/045/GCA_000146045.2_R64/GCA_000146045.2_R64_genomic.fna.gz
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/977/955/GCA_000977955.2_Sc_YJM1447_v1/GCA_000977955.2_Sc_YJM1447_v1_genomic.fna.gz
gzip -df GCA_000146045.2_R64_genomic.fna.gz
gzip -df GCA_000977955.2_Sc_YJM1447_v1_genomic.fna.gz
# if you can't gzip them, the two files can be manually downloaded from NCBI with their id: GCA_000146045, GCA_000977955
# you can then decompress them on you own computer and upload to Katana

head -151797 GCA_000977955.2_Sc_YJM1447_v1_genomic.fna > GCA_000977955.2_Sc_YJM1447_v1_genomic.fna.filtered
ln -sf GCA_000146045.2_R64_genomic.fna refgenome
ln -sf GCA_000977955.2_Sc_YJM1447_v1_genomic.fna.filtered qrygenome

module load minimap2/2.17
cd /srv/scratch/z5039045/Zillur/syri_test
minimap2 -ax asm5 --eqx GR1.fasta ctg.fasta > ctg.sam

/srv/scratch/z5039045/Softwares/syri/syri/bin/syri -c out.sam -r refgenome -q qrygenome -k -F S
/srv/scratch/z5039045/Softwares/syri/syri/bin/plotsr syri.out refgenome qrygenome -H 8 -W 5


######################################## run syri ########################################

# !!! can't see any variations on the plot, may need to adjust parameters for running minimap2 and syri.

# get sam file
module load minimap2/2.17
cd /srv/scratch/z5039045/Zillur/syri_wd
minimap2 -ax asm5 --eqx GR1.fasta ragoo.fasta > G1.sam


# run syri
module unload python
module load python/3.5.7
source ~/mypython357env/bin/activate
cd /srv/scratch/z5039045/Zillur/syri_wd
/srv/scratch/z5039045/Softwares/syri/syri/bin/syri -c G1.sam -r GR1.fasta -q ragoo.fasta -k -F S
/srv/scratch/z5039045/Softwares/syri/syri/bin/plotsr syri.out GR1.fasta ragoo.fasta -H 8 -W 5

