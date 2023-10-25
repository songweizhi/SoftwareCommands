

module unload python
module load gcc/8.4.0
module load python/3.8.3-gcc8
mkdir ~/mypython3env_gcc
python3 -m venv --system-site-packages ~/mypython3env_gcc
source ~/mypython3env_gcc/bin/activate




module unload python
module load gcc/7.5.0
module load python/3.8.3-gcc7
mkdir ~/mypython3env_gcc7
python3 -m venv --system-site-packages ~/mypython3env_gcc7
source ~/mypython3env_gcc7/bin/activate
pip install BioPython
pip install tqdm
pip install joblib
pip install Cython
pip install tsne	# error occured here












module load gcc/7.5.0
module load python/3.7.7-gcc7


wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/KwanLab/Autometa.git

cd /srv/scratch/z5039045/Softwares/Autometa
/home/z5039045/miniconda3/bin/conda create -n autometa -c bioconda -c conda-forge python=3.7 --file=requirements.txt

/home/z5039045/miniconda3/bin/conda install -c maxibor tsne


/home/z5039045/anaconda3/bin/anaconda


