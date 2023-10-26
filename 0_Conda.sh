
# install with 
conda create -n CoverM_env -c bioconda coverm
# create a conda environment
conda create --name conda_EnrichM python

# To activate the environment    
conda activate CoverM_env

# To deactivate the environment
conda deactivate

# prevent Conda from activating the base environment by default
conda config --set auto_activate_base false

# To initialize your shell, run
conda init bash
conda install mcl

# Create a python3 environment for EnrichM. Replace "X.X.X" with the version number
conda create -n enrichm_0.5.0 python=3

# Activate that environment once it has compiled
conda activate enrichm_0.5.0

# Install EnrichM's dependencies
conda install -c bioconda mcl R hmmer diamond prodigal parallel openmp mmseqs2 moreutils seqmagick

# Install EnrichM itself
conda install -c geronimp enrichm

# Install R dependencies
R
install.packages(‘gridExtra’)
install.packages(‘optparse’)
q()


git clone https://github.com/qunfengdong/BLCA.git
git clone git://git.joeyh.name/moreutils
export PATH=/home/z5039045/moreutils:$PATH
