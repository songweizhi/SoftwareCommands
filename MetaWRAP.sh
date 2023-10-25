
################################# setup metaWRAP on Mac ##################################





############################## setup metaWRAP (from Penny) ###############################

$ qsub -I -l select=1:ncpus=8:ngpus=1:mem=60gb,walltime=12:00:00
$ mamba create -n nanophase -c nanophase nanophase -y
These other steps are to make all the other programs in the nanophase environment work:
# Get databases (GTDB already on Katana, so just get PLSDB - current version is 2021_06_23_v2)
$ wget https://ccb-microbe.cs.uni-saarland.de/plsdb/plasmids/download/plsdb.fna.bz2 && bunzip2 plsdb.fna.bz2
# Set locations for databases
$ echo "export GTDBTK_DATA_PATH=/path/to/release/package/" > $(dirname $(dirname `which nanophase`))/etc/conda/activate.d/np_db.sh
## Change /path/to/release/package/ to the real location where you stored the GTDB
$ echo "export PLSDB_PATH=/path/to/plsdb.fna" >> $(dirname $(dirname `which nanophase`))/etc/conda/activate.d/np_db.sh
## Change /path/to/plsdb.fna to the real location where you stored the PLSDB
$ conda deactivate && conda activate nanophase    ## require re-activate nanophase

# Get nanophase test dataset

cd /srv/scratch/z5438778/nanophase_testdata
$ wget https://github.com/example-data/np-example/raw/main/np.test.tar && tar -xvf np.test.tar && rm -rf np.test.tar
$ nanophase check 
# All packages should be found successfully!


##use the metawrap in nanophase
$cd /srv/scratch/z5438778/ONT_Scopalina_microbe/With_Polishing/After_polishing_bins
$ metawrap bin_refinement -o SemiBin_MetaBAT_superspecific_Metabate2 -A SemiBin -B MetaBAT_superspecific_Medaka -C Metabate2 -o SemiBin_MetaBAT_superspecific_Metabate2 -t 12 -x 5


################################## setup metaWRAP (2023) #################################

cd /srv/scratch/z5095298/Weizhi/Software
git clone https://github.com/bxlab/metaWRAP.git
export PATH=/srv/scratch/z5095298/Weizhi/Software/metaWRAP/bin/:$PATH


# run metaWRAP
module unload python
module load python/2.7.18
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3
module load r/4.3.0
#module load pullseq/1.0.2
module load pullseq/2022-01-23
#module load ruby/2.3.7
module load ruby/3.2.0
#module load blast+/2.11.0
module load blast-plus/2.12.0
export PATH=/srv/scratch/z5095298/Weizhi/Software/metaWRAP/bin/:$PATH



jgi_summarize_bam_contig_depths --outputDepth assembly.scaffolds.fa.depth.txt assembly.scaffolds.fa.no.secondary_sorted.bam --showDepth

jgi_summarize_bam_contig_depths



################################ setup metaWRAP (python2) ################################

# download metaWRAP
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/bxlab/metaWRAP.git
export PATH=/srv/scratch/z5039045/Softwares/metaWRAP/bin/:$PATH
# export PATH=/srv/scratch/z5095298/Weizhi/Software/metaWRAP/bin/:$PATH

############################# run metaWRAP (bin_refinement) ##############################

module unload python
module load python/2.7.15
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3
module load R/3.4.2
module load pullseq/1.0.2
module load ruby/2.3.7
module load blast+/2.11.0
export PATH=/srv/scratch/z5039045/Softwares/metaWRAP/bin/:$PATH

cd /srv/scratch/z5039045/BH_ER_050417_mag_folder

# refine two bin sets
metawrap bin_refinement -o MetaWRAP_refinement_wd -t 12 -c 50 -x 5 -A MetaBAT_MAGs -B MyCC_MAGs

# refine three bin sets
metawrap bin_refinement -o MetaWRAP_refinement_wd -t 12 -c 50 -x 5 -A MetaBAT_MAGs -B MyCC_MAGs -C CONCOCT_MAGs


# if you see errors that say "OSError: Device or resource busy", please don't worry, it does not seem to affect CheckM performance.
# https://github.com/bxlab/metaWRAP/issues/48

# I also saw errors like "mv: cannot stat ...", these errors are related to the moving or deleting of files.
# seems not a big issue as metawrap reported that "BIN_REFINEMENT PIPELINE FINISHED SUCCESSFULLY", 
# and we did get refined bins in the final output folder
# https://github.com/bxlab/metaWRAP/issues/253


############################# run metaWRAP (reassemble_bins) #############################

metawrap reassemble_bins -h







############################# setup metaWRAP (python2) (test) ############################

cd /srv/scratch/zID
git clone https://github.com/bxlab/metaWRAP.git
# Carefully configure the /srv/scratch/zID/metaWRAP/bin/config-metawrap file to it points to your desired database locations
# add "PATH=/srv/scratch/zID/metaWRAP/bin/:$PATH" to file "/home/zID/.bash_profile"

module load python/2.7.15
conda create -y -n env_metaWRAP python=2.7
conda activate env_metaWRAP
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --add channels ursky
conda install --only-deps -c ursky metawrap-mg



# to run metaWRAP:
conda activate env_metaWRAP
metawrap -h

