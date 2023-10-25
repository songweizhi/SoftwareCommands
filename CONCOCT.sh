
module load python/3.7.3
source ~/mypython3env/bin/activate
python setup.py install

/srv/scratch/z5039045/Softwares/CONCOCT/1.1.0/bin/concoct -h




module load python/3.7.3
source ~/mypython3env/bin/activate
cd /srv/scratch/z5095298/Weizhi/Software/CONCOCT-develop
cd /srv/scratch/z5095298/Weizhi/Software/CONCOCT-1.1.0
python setup.py install

/srv/scratch/z5039045/Softwares/CONCOCT/1.1.0/bin/concoct -h


# install CONCOCT (Shan)
deactivate
module purge
module load python/3.10.8
cd /srv/scratch/z5095298/Weizhi/Software
mkdir mypython3_10_8env
python3 -m venv --system-site-packages /srv/scratch/z5095298/Weizhi/Software/mypython3_10_8env
source /srv/scratch/z5095298/Weizhi/Software/mypython3_10_8env/bin/activate
cd /srv/scratch/z5095298/Weizhi/Software
wget https://github.com/BinPro/CONCOCT/archive/refs/tags/1.1.0.tar.gz
tar xzvf CONCOCT-1.1.0.tar.gz
cd /srv/scratch/z5095298/Weizhi/Software/CONCOCT-1.1.0
pip install numpy
pip install cython
pip3 install scikit-learn==1.1.0
module load gsl/2.7.1
python setup.py install

# install CONCOCT (Xuemeng)
deactivate
module purge
module load python/3.10.8
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Software
mkdir mypython3_10_8env
python3 -m venv --system-site-packages /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Software/mypython3_10_8env
source /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Software/mypython3_10_8env/bin/activate
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Software
wget https://github.com/BinPro/CONCOCT/archive/refs/tags/1.1.0.tar.gz
tar xzvf CONCOCT-1.1.0.tar.gz
cd /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Software/CONCOCT-1.1.0
pip install numpy
pip install cython
pip3 install scikit-learn==1.1.0
module load gsl/2.7.1
python setup.py install




# run CONCOCT
module purge
module load python/3.10.8
source /srv/scratch/z5265700/Shan_z5095298/z5095298/Weizhi/Software/mypython3_10_8env/bin/activate
module load gsl/2.7.1
concoct -h


cut_up_fasta.py scaffolds.fasta -c 2000 -o 0 --merge_last -b contigs_2K.bed > contigs_2K.fa
concoct_coverage_table.py contigs_2K.bed *_sorted.bam > concoct_coverage_table.tsv
concoct --composition_file contigs_2K.fa --coverage_file concoct_coverage_table.tsv -b concoct_output/ -t 9
merge_cutup_clustering.py concoct_output/clustering_gt1000.csv > concoct_output/clustering_merged.csv
