
################################### install odp on hpc3 ##################################

conda create -n odp python=3
conda activate odp
conda install -c bioconda snakemake matplotlib pandas numpy seaborn diamond hmmer
conda install bioconda::blast=2.15.0
# conda install -c bioconda bioawk
conda install anaconda::gawk

cd /home/ocessongwz/Software/odp
make -f Makefile_1core
# BioSAK hpc3 -q cpu -conda odp -t 1 -n odp_make -c "make -f Makefile_1core"


#################################### run odp on hpc3 #####################################

conda activate odp
cd /scratch/PI/ocessongwz/odp_wd/C_elegans_and_H_sapiens


/home/ocessongwz/Software/odp/tests/testdb/mini_hydra/mini_hydra.chrom
/home/ocessongwz/Software/odp/tests/testdb/mini_hydra/mini_hydra.fa
/home/ocessongwz/Software/odp/tests/testdb/mini_hydra/mini_hydra.pep


/home/ocessongwz/Software/odp/tests/testdb/mini_urchin/mini_urchin.chrom
/home/ocessongwz/Software/odp/tests/testdb/mini_urchin/mini_urchin.fa
/home/ocessongwz/Software/odp/tests/testdb/mini_urchin/mini_urchin.pep


