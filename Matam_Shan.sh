
##########################################################
###                   Install Matam                    ###
##########################################################


# Copy Anaconda3-5.0.1-Linux-x86_64.sh to your home dir (~)
# I have uploaded one copy to my folder in Torsten's storage
/home/z5039045/torsten/Weizhi_Song/Anaconda_for_Matam/Anaconda3-5.0.1-Linux-x86_64.sh


# Step 1. Install Anaconda:  
cd ~
bash Anaconda3-5.0.1-Linux-x86_64.sh # install Anaconda3
export PATH=~/anaconda3/bin:$PATH


# Step 2. Add the followings channels:
conda config --add channels conda-forge
conda config --add channels defaults
conda config --add channels r
conda config --add channels bioconda
conda config --add channels bonsai-team
conda config --add channels salford_systems


# Step 3. Install matam 
~/anaconda3/bin/conda install -c bonsai-team matam


# load the following modules when running Matam
module load python/3.6.5
module load java/7u51
module load gcc/7.3.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9
module load usearch/11.0.667
module load seqtk/20190219
export PATH=~/anaconda3/bin:$PATH
matam_assembly.py -h
