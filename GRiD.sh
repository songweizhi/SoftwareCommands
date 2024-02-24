
# https://github.com/ohlab/GRiD

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda create --name GRiD python=3.7
conda activate GRiD
conda install grid=1.3



# Example test
wget https://github.com/ohlab/GRiD/archive/1.3.tar.gz
tar xvf 1.3.tar.gz
cd GRiD-1.3/test
grid single -r . -g S_epidermidis.LRKNS118.fna -o output_single
grid multiplex -r . -d . -p -c 0.2 -o output_multiplex -n 16





