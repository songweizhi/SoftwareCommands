
################################# install GapSeq on Gadi #################################

# install automake
cd /scratch/du5/wzs561/software
tar zxvf automake-1.16.tar.gz
cd automake-1.16
./configure --prefix /scratch/du5/wzs561/software/automake-1.16
make
make check 
make install
export PATH=/scratch/du5/wzs561/software/automake-1.16/bin:$PATH


# install bc
cd /scratch/du5/wzs561/software
tar zxvf bc-1.07.tar.gz
cd bc-1.07
./configure --prefix /scratch/du5/wzs561/software/bc-1.07
make
make check 
make install
export PATH=/scratch/du5/wzs561/software/bc-1.07/bin:$PATH


# install hmmer
cd /scratch/du5/wzs561/software
tar zxvf hmmer-3.3.2.tar.gz
cd hmmer-3.3.2
./configure --prefix /scratch/du5/wzs561/software/hmmer-3.3.2
make
make check 
make install
export PATH=/scratch/du5/wzs561/software/hmmer-3.3.2/bin:$PATH


# install barrnap
module load git/2.24.1
module load bedtools/2.28.0
cd /scratch/du5/wzs561/software
git clone https://github.com/tseemann/barrnap.git
export PATH=/scratch/du5/wzs561/software/barrnap/bin:$PATH


# install glpk
tar zxvf glpk-4.65.tar.gz
cd glpk-4.65
./configure --prefix /scratch/du5/wzs561/software/glpk-4.65
make
make check
make install   
export PATH=/scratch/du5/wzs561/software/glpk-4.65/bin:$PATH


# install EXONERATE-2.2.0-x86_64
export PATH=/scratch/du5/wzs561/software/bc-1.07/bin:$PATH
export PATH=/scratch/du5/wzs561/software/hmmer-3.3.2/bin:$PATH
export PATH=/scratch/du5/wzs561/software/barrnap/bin:$PATH
export PATH=/scratch/du5/wzs561/software/glpk-4.65/bin:$PATH
cd /scratch/du5/wzs561/software
tar zxvf exonerate-2.2.0-x86_64.tar.gz
export PATH=/scratch/du5/wzs561/software/exonerate-2.2.0-x86_64/bin:$PATH


# install R packages
module load R/4.0.0
module load intel-compiler/2020.2.254
export PATH=/scratch/du5/wzs561/software/glpk-4.65/bin:$PATH
export PATH=/scratch/du5/wzs561/software/glpk-4.65/src:$PATH
R
install.packages("data.table")
install.packages("stringr")
install.packages("sybil")
install.packages("getopt")
install.packages("reshape2")
install.packages("doParallel")
install.packages("foreach")
install.packages("R.utils")
install.packages("stringi")
install.packages("CHNOSZ")
install.packages("jsonlite")
install.packages("BiocManager")
install.packages("glpkAPI")


# install gapseq
cd /scratch/du5/wzs561/software/gapseq
git clone https://github.com/jotech/gapseq
export PATH=/scratch/du5/wzs561/software/gapseq:$PATH




sudo yum install ncbi-blast+ git glpk-devel BEDTools exonerate hmmer bc
git clone https://github.com/tseemann/barrnap.git
export PATH=$PATH:barrnap/bin/barrnap # needs to be permanent => .bashrc ?
R -e 'install.packages(c("data.table", "stringr", "sybil", "getopt", "reshape2", "doParallel", "foreach", "R.utils", "stringi", "glpkAPI", "CHNOSZ", "jsonlite"))'
R -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install("Biostrings")'
git clone https://github.com/jotech/gapseq && cd gapseq


####################################### run GapSeq #######################################

module load pangeo/2020.05
source ~/mypython3env/bin/activate
module load bedtools/2.28.0
module load intel-compiler/2020.2.254
module load blast/2.10.1
export PATH=/apps/blast/2.10.1/bin:$PATH
export PATH=/scratch/du5/wzs561/software/hmmer-3.3.2/bin:$PATH
export PATH=/scratch/du5/wzs561/software/barrnap/bin:$PATH
export PATH=/scratch/du5/wzs561/software/glpk-4.65/bin:$PATH
export PATH=/scratch/du5/wzs561/software/glpk-4.65/src:$PATH
export PATH=/scratch/du5/wzs561/software/exonerate-2.2.0-x86_64/bin:$PATH
export PATH=/scratch/du5/wzs561/software/gapseq:$PATH
module load R/4.0.0
cd /scratch/du5/wzs561/Test_gapseq
gapseq find -p carbo -b 100 ecoli_1.fna > ecoli_1-carbo-stdout.txt
gapseq find -p carbo -b 100 ecoli_2.fna > ecoli_2-carbo-stdout.txt
gapseq find -p carbo -b 100 ecoli_3.fna > ecoli_3-carbo-stdout.txt
gapseq find -p carbo -b 100 ecoli_4.fna > ecoli_4-carbo-stdout.txt



gapseq find -p carbo -b 100 ecoli_1.fna > ecoli_1-carbo-stdout.txt
gapseq find -p carbo -b 100 ecoli_2.fna > ecoli_2-carbo-stdout.txt
gapseq find -p carbo -b 100 ecoli_3.fna > ecoli_3-carbo-stdout.txt


# on Katana
module load python/3.7.3
module load perl/5.28.0
module load blast+/2.10.1
module load hmmer/3.3
module load prodigal/2.6.3
module load git/2.22.0
module load bedtools/2.27.1
module load glpk/4.65
module load barrnap/0.9
module load gcc/7.3.0
module load exonerate/2.2.0
# module load parallel/20190522
module load parallel/20200722
module unload R
module load R/3.6.1
module load cplex/12.9.0-academic  
export PATH=/srv/scratch/z5039045/Softwares/gapseq2021:$PATH
cd /srv/scratch/z5039045/Test_gapseq
gapseq find -p carbo -b 100 ecoli_1.fna > ecoli_1-carbo-stdout.txt


###################################### run detectCFP #####################################

# install Prodigal
cd /scratch/du5/wzs561/software
mkdir Prodigal
unzip Prodigal-GoogleImport.zip 
cd Prodigal-GoogleImport
make install INSTALLDIR=/scratch/du5/wzs561/software/Prodigal
export PATH=/scratch/du5/wzs561/software/Prodigal:$PATH

module load pangeo/2020.05
source ~/mypython3env/bin/activate
module load R/4.0.0
module load bedtools/2.28.0
module load intel-compiler/2020.2.254
module load blast/2.10.1
export PATH=/scratch/du5/wzs561/software/hmmer-3.3.2/bin:$PATH
export PATH=/scratch/du5/wzs561/software/barrnap/bin:$PATH
export PATH=/scratch/du5/wzs561/software/glpk-4.65/bin:$PATH
export PATH=/scratch/du5/wzs561/software/glpk-4.65/src:$PATH
export PATH=/scratch/du5/wzs561/software/exonerate-2.2.0-x86_64/bin:$PATH
export PATH=/scratch/du5/wzs561/software/gapseq:$PATH
export PATH=/scratch/du5/wzs561/software/Prodigal:$PATH
cd /scratch/du5/wzs561/gapseq_test
detectCFP -p GadiTest2 -g mag_files -x fna -hmm combined.HMM -k pathwaysXhmmfiles.txt -t 1 -force -taxon mag_taxon.txt -dynamic_pcc -cpl mag_cpl.txt -faa faa_files -force











