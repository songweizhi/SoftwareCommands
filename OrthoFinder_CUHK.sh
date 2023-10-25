
# on MAC
sudo launchctl limit maxfiles 158000 158000


################################### install OrthoFinder ##################################

# install OrthoFinder
conda config --add channels bioconda
conda create -n orthofinder_py37 python=3.7
conda activate orthofinder_py37
conda install orthofinder
conda install diamond=0.9.14


##########################################################################################

# run OrthoFinder
conda activate orthofinder_py37
cd /home-user/wzsong/Tests/OrthoFinder
orthofinder -f faa_files -t 6



conda activate orthofinder_py37
cd /Users/songweizhi/Desktop
orthofinder -f protein_in_faa -t 10 -n Japonicum

ulimit -Hn
ulimit -Sn

ulimit -n 1508084




cd /Users/songweizhi/Desktop/DateArTree/orthofinder_wd
conda activate orthofinder_py37
cd /Users/songweizhi/Desktop
orthofinder -f protein_in_faa -t 10 -n Japonicum

