
########################## install CheckM2 on Katana with Conda ##########################

cd /srv/scratch/z5039045/Softwares
git clone --recursive https://github.com/chklovski/checkm2.git && cd checkm2
conda env create -n checkm2 -f checkm2.yml
conda activate checkm2
python setup.py install

# download database files 
checkm2 database --download --path /srv/scratch/z5039045/DB/checkm2

# Consider running <checkm2 testrun> to verify everything works.
conda activate checkm2
checkm2 testrun


############################ run CheckM2 on Katana with Conda ############################

conda activate checkm2
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving/00_reassemble_wd
checkm2 predict --threads 12 --allmodels --input 0_completed_genomes -x fa --output-directory 0_completed_genomes_checkm2_wd_allmodels



