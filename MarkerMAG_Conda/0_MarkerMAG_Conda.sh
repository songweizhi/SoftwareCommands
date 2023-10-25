
####################################### setup Conda ######################################

# install conda-build
conda install conda-build
# conda install constructor
conda install anaconda-client
# anaconda login

# add channel 
conda config --add channels bioconda

# Updating conda and conda-build
conda update conda
conda update conda-build
conda update anaconda

# prevent Conda from activating the base environment by default
conda config --set auto_activate_base false
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --set anaconda_upload yes

# to activate/deactivate conda base environment
conda activate
conda deactivate

# conda package uploading
# https://giswqs.medium.com/building-a-conda-package-and-uploading-it-to-anaconda-cloud-6a3abd1c5c52

# list all conda environments
conda env list

# to remove conda environment
conda env remove -n CheckM
conda env remove -n MarkerMAG1126
conda env remove -n SemiBin
conda env remove -n PreTR_ML
conda env remove -n anvio-7.1
conda env remove -n ete3
conda remove --prefix /Users/songweizhi/miniconda3/envs/PreTR_ML --all
conda remove --prefix /Users/songweizhi/miniconda3/envs/anvio-7.1 --all
conda remove --prefix /Users/songweizhi/miniforge3/envs/ete3 --all
conda remove --prefix /Users/songweizhi/miniforge3 --all
conda remove --prefix /Users/songweizhi/miniconda3 --all

# restore root environment to its state after first installation
conda install --rev 1

# list all conda revisions 
conda list --revisions


# update conda
conda update conda
conda update conda-build


##########################################################################################

# these commands work well 
cd ~
grayskull pypi MarkerMAG

# modify meta.yaml by adding "noarch: python" to the "build" section and adding the following lines to the "run" section
    - blast
    - barrnap
    - seqtk
    - bowtie2
    - samtools
    - hmmer
    - spades
    
# change "script: {{ PYTHON }} -m pip install . -vv" to "script: {{ PYTHON }} -m pip install --no-deps --ignore-installed ."

# run "conda build"
conda build -c bioconda MarkerMAG


################################### upload to Bioconda ###################################

# no need to run these for later updates
git clone https://github.com/songweizhi/bioconda-recipes.git
cd bioconda-recipes
git checkout -b MarkerMAG

# run these commands to upload new release to github
cd ~/bioconda-recipes
git add .
#git commit -m "MarkerMAG, added --no-deps to meta.yaml"
git commit -m "MarkerMAG v1.1.27"

git push --set-upstream origin MarkerMAG


######################## install MarkerMAG with built Conda recipe #######################

conda create -n MarkerMAG_test -c bioconda -c songweizhi MarkerMAG
conda create -n MarkerMAG -c songweizhi MarkerMAG
conda activate MarkerMAG_test
MarkerMAG -h

cd /Users/songweizhi/Desktop/MarkerMAG_test
MarkerMAG link -p Demo -r1 demo_R1.fasta -r2 demo_R2.fasta -marker demo_16S.fasta -mag demo_MAGs -x fa -t 12


##########################################################################################
######################################### backup #########################################
##########################################################################################

# step 1
# conda clean --all (Ramtin Gharleghi)
cd ~
# conda skeleton pypi MarkerMAG --python-version 3.6 --version 1.1.23
grayskull pypi MarkerMAG  # Ramtin Gharleghi's command


# step 2
# add dependencies to meta.yaml 

    - blast
    - barrnap
    - seqtk
    - bowtie2
    - samtools
    - hmmer
    - spades
# works


    - blast ==2.11.0
    - barrnap ==0.9
    - seqtk ==1.3
    - bowtie2 ==2.3.5.1
    - samtools ==1.10
    - hmmer ==3.3
    - spades ==3.14.0    
# ValueError: Incompatible component merge:
#  - 'mpi_openmpi_*'
#  - 'mpi_openmpi_tempest*'


# step 3 (will upload automatically)
conda build -c bioconda MarkerMAG


# step 4, upload to anaconda (non need!!!!!!)
cd markermag
conda activate
anaconda upload markermag-1.1.23-py39_0.tar.bz2


# install with built package
conda install -c bioconda -c songweizhi MarkerMAG 


# under testing
# Converting a package for use on all platforms (under testing!!!)
# Demo: conda convert --platform all ~/anaconda/conda-bld/linux-64/click-7.0-py37_0.tar.bz2 -o outputdir/
# cd /Users/songweizhi/opt/anaconda3/conda-bld/osx-64/
# conda convert --platform all markermag-1.1.26-py39_0.tar.bz2 -o outputdir_test/
