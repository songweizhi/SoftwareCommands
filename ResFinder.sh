
#################################### install resfinder ###################################

# https://bitbucket.org/genomicepidemiology/resfinder/src/master/

# install ResFinder
module load python/3.9.9
mkdir ~/mypython3env_ResFinder
python3 -m venv --system-site-packages ~/mypython3env_ResFinder
source ~/mypython3env_ResFinder/bin/activate
pip install resfinder
python -m resfinder -h

# download db files
cd /srv/scratch/z5039045/DB/ResFinder
git clone https://bitbucket.org/genomicepidemiology/resfinder_db/
git clone https://bitbucket.org/genomicepidemiology/pointfinder_db/
git clone https://bitbucket.org/genomicepidemiology/disinfinder_db/

# Set approximate environment variables
export CGE_RESFINDER_RESGENE_DB="/srv/scratch/z5039045/DB/ResFinder/resfinder_db"
export CGE_RESFINDER_RESPOINT_DB="/srv/scratch/z5039045/DB/ResFinder/pointfinder_db"
export CGE_DISINFINDER_DB="/srv/scratch/z5039045/DB/ResFinder/disinfinder_db"


###################################### run resfinder #####################################

module load python/3.9.9
source ~/mypython3env_ResFinder/bin/activate
module load kma/1.3.23
module load blast+/2.11.0
export CGE_RESFINDER_RESGENE_DB="/srv/scratch/z5039045/DB/ResFinder/resfinder_db"
export CGE_RESFINDER_RESPOINT_DB="/srv/scratch/z5039045/DB/ResFinder/pointfinder_db"
export CGE_DISINFINDER_DB="/srv/scratch/z5039045/DB/ResFinder/disinfinder_db"

cd /srv/scratch/z5039045/test_ResFinder
python -m resfinder -o ResFinder_op -s "Escherichia coli" -l 0.6 -t 0.8 --acquired --point -ifa GCF_000005845.fna


