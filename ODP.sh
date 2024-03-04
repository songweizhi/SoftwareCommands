
# Keep Solving environment, downgrade conda to 4.6.14, it works.
conda config --set allow_conda_downgrades true
conda install conda=4.6.14

conda create -n odp python=3
conda activate odp
conda install snakemake matplotlib pandas numpy seaborn


######################################### on hpc3 ########################################

conda create -n odp python=3
conda activate odp
conda install snakemake matplotlib pandas numpy seaborn
conda install -c bioconda diamond
conda install bioconda::blast=2.15.0
conda install -c bioconda bioawk
conda install anaconda::gawk


cd /home/ocessongwz/Software/odp
make -f Makefile_1core

BioSAK hpc3 -q cpu -conda odp -t 1 -n odp_make -c "make -f Makefile_1core"
