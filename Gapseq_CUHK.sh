
##################################### install gapseq #####################################

# Cloning the development version of gapseq
git clone https://github.com/jotech/gapseq
cd gapseq

# Create and activate a conda environment "gapseq-dev"
conda env create -n gapseq-dev --file gapseq_env.yml
conda activate gapseq-dev

# install one additional R-package
R -e 'install.packages("CHNOSZ", repos="http://cran.us.r-project.org")'
# R -e 'install.packages("ape", repos="http://cran.us.r-project.org")'

# Download & Install R-package 'sybilSBML'
wget https://cran.r-project.org/src/contrib/Archive/sybilSBML/sybilSBML_3.1.2.tar.gz
R CMD INSTALL --configure-args=" \
--with-sbml-include=$CONDA_PREFIX/include \
--with-sbml-lib=$CONDA_PREFIX/lib" sybilSBML_3.1.2.tar.gz
rm sybilSBML_3.1.2.tar.gz

# Download reference sequence data
cd /home-user/wzsong/Software/gapseq
bash ./src/update_sequences.sh

####################################### run gapseq #######################################

conda activate gapseq-dev
/home-user/wzsong/Software/gapseq/gapseq -h


conda activate gapseq-dev
cd /home-user/wzsong/Software/gapseq
/home-user/wzsong/Software/gapseq/gapseq find -p carbo -t Bacteria -l metacyc -K 1 -M prot -T /home-user/wzsong/Japonicum/gapseq_metacyc/gapseq_tmp_dir /home-user/wzsong/Japonicum/data/protein/HKCCT7.protein > HKCCT7_metacyc_carbo_stdout.txt

