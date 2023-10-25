
# install vechat first
conda create -n vechat
conda activate vechat
conda install -c bioconda vechat






# install vechat first
# https://github.com/HaploKit/vechat
conda create -n metaBooster
conda activate metaBooster
conda install -c bioconda minimap2 yacrd fpa=0.5
# conda install -c bioconda pathlib
# conda install -c bioconda pathlib2
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/HaploKit/vechat.git
cd vechat
python ./scripts/vechat -h



conda activate metaBooster
python /srv/scratch/z5039045/Softwares/vechat/scripts/vechat -h
python2 /srv/scratch/z5039045/Softwares/vechat/scripts/vechat -h
python3 /srv/scratch/z5039045/Softwares/vechat/scripts/vechat -h


