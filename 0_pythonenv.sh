
##########################################################################################
########################################### Mac ##########################################
##########################################################################################

mkdir ~/python3env_ml
python3 -m venv --system-site-packages ~/python3env_ml

source ~/python3env_ml/bin/activate


##########################################################################################
####################################### HKUST HPC3 #######################################
##########################################################################################

module load anaconda3
conda create -n mypython3env
source activate mypython3env
pip install BioSAK
pip install TreeSAK
pip install MetaCHIP
pip install MetaCHIP2


##########################################################################################
######################################### Katana #########################################
##########################################################################################

module load python/3.7.4
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate

pip3 install BioSAK
pip3 install --upgrade BioSAK

