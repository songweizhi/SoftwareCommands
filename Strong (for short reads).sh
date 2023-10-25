
# install vechat first
conda create -n strong
conda activate strong
conda install -c bioconda minimap2 yacrd fpa=0.5
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/HaploKit/vechat.git
cd vechat
#python ./scripts/vechat -h
python /srv/scratch/z5039045/Softwares/vechat/scripts/vechat
# SyntaxError: invalid syntax



