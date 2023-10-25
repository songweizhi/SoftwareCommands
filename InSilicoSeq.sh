
# install InSilicoSeq
module load python/3.7.3
mkdir ~/mypython3env_iss
python3 -m venv --system-site-packages ~/mypython3env_iss
source ~/mypython3env_iss/bin/activate
pip install InSilicoSeq


# run InSilicoSeq
module load python/3.7.3
source ~/mypython3env_iss/bin/activate
cd /srv/scratch/z5039045/MarkerMAG_wd/InSilicoSeq_wd
iss generate -g file_in/combined_refs.fna -D file_in/abundance_even3.txt -o ISS_10x_even -m NovaSeq -p 12
