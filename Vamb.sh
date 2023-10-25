
################################## install Vamb (Conda) ##################################

# Installing a different version of Python
conda create -n py36 python=3.6 anaconda
conda activate py36
conda install -c pytorch pytorch torchvision cudatoolkit=10.2
conda install -c bioconda vamb


######################################## run Vamb ########################################

# example commands
conda activate py36
vamb --outdir Vamb_MAGs --fasta my_contigs.fna --bamfiles *.bam



