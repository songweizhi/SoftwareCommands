
# run the following command to avoid keep solving environment
conda update -n base conda
conda install -n base conda-libmamba-solver
conda config --set solver libmamba


##########################################################################################
############################# Install Anaconda on HKUST HPC3 #############################
##########################################################################################

cd /home/ocessongwz/Software
curl -O https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
bash Anaconda3-2023.09-0-Linux-x86_64.sh

#    Installed package of scikit-learn can be accelerated using scikit-learn-intelex.
#    More details are available here: https://intel.github.io/scikit-learn-intelex
#
#    For example:
#
#        $ conda install scikit-learn-intelex
#        $ python -m sklearnex my_application.py


# to automatically initialize conda
#conda config --set auto_activate_base false
conda config --set auto_activate_base true

# You can undo this by running `conda init --reverse $SHELL`


# To activate conda's base environment in your current shell session:
eval "$(/home/ocessongwz/anaconda3/bin/conda shell.bash hook)" 


# To install conda's shell functions for easier access, first activate, then:
conda init


# list available channels
conda config --show channels


# add channel
conda config --add channels conda-forge
conda config --add channels bioconda


# install software to the base environment
conda activate base
pip install BioSAK
pip3 install TreeSAK
pip3 install MetaCHIP
pip3 install MetaCHIP2


# install Perl and it's modules in Conda's base environment
conda install -c bioconda perl-lwp-simple              
conda update perl
cpan App::cpanminus
cpan B::Hooks::EndOfScope
cpan namespace::clean
cpan List::MoreUtils
conda install -c bioconda perl-moose
conda install -c bioconda perl-moosex-app
conda install -c bioconda perl-gd
conda install -c bioconda perl-statistics-descriptive
conda install -c bioconda perl-moosex-getopt
conda install -c bioconda perl-bio-featureio
conda install bioconda::blast==2.15.0
conda install bioconda::mafft
conda install bioconda::trimal
# conda install etetoolkit::phylobayes
# conda install bioconda::phylobayes-mpi

# You may want to add the following line to your perl script to disable warning messages
no warnings 'experimental';


##########################################################################################
############################# Install Anaconda on HKUST HPC3 #############################
##########################################################################################

conda create -n mybase -c conda-forge -c bioconda gtdbtk=2.3.2
conda activate mybase
conda install bioconda::blast=2.15.0
pip install BioSAK
pip3 install TreeSAK
pip3 install MetaCHIP
pip3 install MetaCHIP2
pip install virtualenv
cpan App::cpanminus
cpan B::Hooks::EndOfScope
cpan namespace::clean
cpan List::MoreUtils
conda install -c bioconda perl-moose
conda install -c bioconda perl-moosex-app
conda install -c bioconda perl-gd
conda install -c bioconda perl-statistics-descriptive
conda install -c bioconda perl-moosex-getopt
conda install -c bioconda perl-bio-featureio
conda install -c bioconda iqtree=2.2.6
conda install bioconda::mafft
conda install bioconda::trimal

# install R to mybase environment
# conda install conda-forge::r-base
# conda config --set channel_priority flexible
# conda install -c r r r-essentials
conda install -c bioconda r-base
conda install -c bioconda r-base=4.1.2



# install R packages
conda activate mybase
R
install.packages("optparse")
install.packages("plyr")
install.packages("dbplyr")
install.packages("dplyr")
install.packages("tidyr")
install.packages("ggplot2")
install.packages("data.table")
install.packages("RColorBrewer")
install.packages("gplots")
install.packages("ape")


##########################################################################################
##########################################################################################
##########################################################################################

# To list all created conda environments
conda info --envs

checkm                   /home/ocessongwz/.conda/envs/checkm
ezaaienv                 /home/ocessongwz/.conda/envs/ezaaienv
fastaaienv               /home/ocessongwz/.conda/envs/fastaaienv
gtdbtk                   /home/ocessongwz/.conda/envs/gtdbtk
metachip2env             /home/ocessongwz/.conda/envs/metachip2env
metachip2env_test        /home/ocessongwz/.conda/envs/metachip2env_test
metachip_env             /home/ocessongwz/.conda/envs/metachip_env
prokka                   /home/ocessongwz/.conda/envs/prokka
                         /home/ocessongwz/anaconda3
                         /home/ocessongwz/anaconda3/envs/GRiD
                         /home/ocessongwz/anaconda3/envs/mybase
                         /home/ocessongwz/anaconda3/envs/mypython3env
                         /home/ocessongwz/anaconda3/envs/odp
base                  *  /home/ocessongwz/miniforge3
gapseq-dev               /home/ocessongwz/miniforge3/envs/gapseq-dev
mybase                   /home/ocessongwz/miniforge3/envs/mybase
odp                      /home/ocessongwz/miniforge3/envs/odp

# To list all of the packages in the active environment, use:
conda list

# To list all of the packages in a deactivated environment, use:
conda list -n myenv

# To remove installed package
conda remove blast


##########################################################################################
##########################################################################################
##########################################################################################

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

