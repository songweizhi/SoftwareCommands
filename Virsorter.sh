
conda create --name virsorter -c bioconda mcl=14.137 muscle blast perl-bioperl perl-file-which hmmer=3.1b2 perl-parallel-forkmanager perl-list-moreutils diamond=0.9.14

git clone https://github.com/simroux/VirSorter.git
cd VirSorter/Scripts
make clean
make
