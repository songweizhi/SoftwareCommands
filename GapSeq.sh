##########################################################################################
################################# install gapseq on hpc3 #################################
##########################################################################################

# run the following command to avoid keep solving environment
conda update -n base conda
conda install -n base conda-libmamba-solver
conda config --set solver libmamba

# install gapseq
cd /home/ocessongwz/scratch/Software/gapseq
conda env create -n gapseq-dev --file gapseq_env.yml
conda activate gapseq-dev 
R -e 'install.packages("CHNOSZ", repos="http://cran.us.r-project.org")'
wget https://cran.r-project.org/src/contrib/Archive/sybilSBML/sybilSBML_3.1.2.tar.gz
R CMD INSTALL --configure-args=" --with-sbml-include=$CONDA_PREFIX/include --with-sbml-lib=$CONDA_PREFIX/lib" sybilSBML_3.1.2.tar.gz
bash ./src/update_sequences.sh


################################# run gapseq on hpc3 #################################

conda activate gapseq-dev
gapseq find -p all -t Archaea -b 100 -c 70 -l all -y /scratch/PI/ocessongwz/Sponge_2023_12_01/6_combined_genomes_dereplicated_207/APA_bin56.fna > APA_bin56_stdout.txt



# example
/srv/scratch/z5039045/Softwares/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna
# Options:
#√   -p keywords such as pathways or subsystems (for example amino,nucl,cofactor,carbo,polyamine)
#   -e Search by ec numbers (comma separated)
#   -r Search by enzyme name (colon separated)
#   -d Database: vmh or seed (default: seed)
#√   -t Taxonomic range for sequences to be downloaded (default: Bacteria)
#√   -b Bit score cutoff for local alignment (default: 200)
#   -i Identity cutoff for local alignment (default: 0)
#√   -c Coverage cutoff for local alignment (default: 75)
#   -s Strict candidate reaction handling (do _not_ use pathway completeness, key kenzymes and operon structure to infere if imcomplete pathway could be still present (default: false)
#   -u Suffix used for output files (default: pathway keyword)
#   -a blast hits back against uniprot enzyme database
#   -n Consider superpathways of metacyc database
#√   -l Select the pathway database (MetaCyc(2712), KEGG(523), SEED(666), all(3922); default: metacyc,custom)
#   -o Only list pathways found for keyword; default false)
#   -x Do not blast only list pathways, reactions and check for available sequences; default false
#   -q Include sequences of hits in log files; default false
#   -v Verbose level, 0 for nothing, 1 for pathway infos, 2 for full (default 1)
#   -k Do not use parallel
#   -g Exhaustive search, continue blast even when cutoff is reached (default false)
#   -z Quality of sequences for homology search: 1:only reviewed (swissprot), 2:unreviewed only if reviewed not available, 3:reviewed+unreviewed, 4:only unreviewed (default 2)
#   -m Limit pathways to taxonomic range (default )


# Predict pathways
/scratch/PI/boqianpy/shanzhang/software/gapseq/gapseq_v20231213/gapseq find -p all -t Bacteria -b 100 -c 70 -l all -y /scratch/PI/boqianpy/shanzhang/03_Maize/01_MAGs/G6_1_Chromosome.fasta > /scratch/PI/boqianpy/shanzhang/03_Maize/03_Gapseq_models/report.sh

# Predict transporters
/scratch/PI/boqianpy/shanzhang/software/gapseq/gapseq_v20231213/gapseq find-transport -b 100 -c 70 /scratch/PI/boqianpy/shanzhang/03_Maize/01_MAGs/G6_1_Chromosome.fasta

# Create draft model
/scratch/PI/boqianpy/shanzhang/software/gapseq/gapseq_v20231213/gapseq draft -r /scratch/PI/boqianpy/shanzhang/03_Maize/03_Gapseq_models/G6_1_Chromosome-all-Reactions.tbl -t /scratch/PI/boqianpy/shanzhang/03_Maize/03_Gapseq_models/G6_1_Chromosome-Transporter.tbl -p /scratch/PI/boqianpy/shanzhang/03_Maize/03_Gapseq_models/G6_1_Chromosome-all-Pathways.tbl -c /scratch/PI/boqianpy/shanzhang/03_Maize/01_MAGs/G6_1_Chromosome.fasta -u 100 -l 50 -b neg

# Predicting a growth medium
/scratch/PI/boqianpy/shanzhang/software/gapseq/gapseq_v20231213/gapseq medium -m G6_1_Chromosome-draft.RDS -p /scratch/PI/boqianpy/shanzhang/03_Maize/03_Gapseq_models/G6_1_Chromosome-all-Pathways.tbl

# Use the medium to create final model
G6_1_Chromosome_diet=/scratch/PI/boqianpy/shanzhang/03_Maize/03_Gapseq_models/G6_1_Chromosome-medium.csv
/scratch/PI/boqianpy/shanzhang/software/gapseq/gapseq_v20231213/gapseq fill -m ./G6_1_Chromosome-draft.RDS -n ${G6_1_Chromosome_diet} -c ./G6_1_Chromosome-rxnWeights.RDS -g ./G6_1_Chromosome-rxnXgenes.RDS -b 50 -o ./20231216_medium_G6_1_Chromosome -r TRUE






conda activate gapseq-dev
cd /scratch/PI/ocessongwz/Sponge_2023_12_01/6_combined_genomes_dereplicated_207_GapSeq_wd/test

gapseq find -p all -t Archaea -b 100 -c 70 -l all -y /scratch/PI/ocessongwz/Sponge_2023_12_01/6_combined_genomes_dereplicated_207/GCA018668425_1.fna
# Number of pathways to be considered: 4002

gapseq find -p all -t Archaea -b 100 -c 70 -l MetaCyc -y /scratch/PI/ocessongwz/Sponge_2023_12_01/6_combined_genomes_dereplicated_207/GCA018668425_1.fna
# Number of pathways to be considered: 3105

gapseq find -p all -t Archaea -b 100 -c 70 -l KEGG -y /scratch/PI/ocessongwz/Sponge_2023_12_01/6_combined_genomes_dereplicated_207/GCA018668425_1.fna
# Number of pathways to be considered: 182

gapseq find -p all -t Archaea -b 100 -c 70 -l SEED -y /scratch/PI/ocessongwz/Sponge_2023_12_01/6_combined_genomes_dereplicated_207/GCA018668425_1.fna
# Number of pathways to be considered: 666

gapseq find -p all -t Archaea -b 100 -c 70 -l custom -y -T /scratch/PI/ocessongwz/Software/gapseq_tmp_dir /scratch/PI/ocessongwz/Sponge_2023_12_01/6_combined_genomes_dereplicated_207/GCA018668425_1.fna 
# Number of pathways to be considered: 50

gapseq find -p all -t Archaea -b 100 -c 70 -l MetaCyc,KEGG -y /scratch/PI/ocessongwz/Sponge_2023_12_01/6_combined_genomes_dereplicated_207/GCA018668425_1.fna
# Number of pathways to be considered: 3287






##########################################################################################
################################## install gapseq (CUHK) #################################
##########################################################################################

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
R CMD INSTALL --configure-args=" --with-sbml-include=$CONDA_PREFIX/include --with-sbml-lib=$CONDA_PREFIX/lib" sybilSBML_3.1.2.tar.gz
rm sybilSBML_3.1.2.tar.gz

# Download reference sequence data
cd /home-user/wzsong/Software/gapseq
bash ./src/update_sequences.sh


##########################################################################################
################################# install GapSeq on Gadi #################################
##########################################################################################

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




###################################### Installation ######################################

# Manual page: https://gapseq.readthedocs.io/en/latest/install.html

# install R packages
module load R/3.6.1
R
install.packages(c("data.table", "stringr", "sybil", "getopt", "reshape2", "doParallel", "foreach", "R.utils", "stringi", "glpkAPI"))
install.packages(c("CHNOSZ"))

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install("Biostrings")

# cd to the folder where you want to have GapSeq installed 
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/jotech/gapseq


############################# Jobscript for running GapSeq ###############################

module load R/3.6.1
module load perl/5.28.0
module load git/2.22.0
module load bedtools/2.27.1
module load blast+/2.9.0
module load hmmer/3.3
module load glpk/4.65
module load barrnap/0.9
module load gcc/7.3.0
module load exonerate/2.2.0
module load parallel/20190522
module load cplex/12.9.0-academic  


# New:
cd /srv/scratch/z5039045/gapseq_test
/srv/scratch/z5039045/Softwares/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna
/srv/scratch/z5039045/Softwares/gapseq/gapseq find -p all -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna

cd /srv/scratch/z5039045/gapseq_test
/srv/scratch/z5039045/Softwares/gapseq_test/gapseq find -n -p all -b 100 -c 70 -l all -y APA_bin_6.fna


# Test
cd /srv/scratch/z5039045/GapSeq_Sponge_and_Coral_MAGs/Test_GapSeq
/srv/scratch/z5039045/Softwares/gapseq_test_cluster/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y APA_bin_2.fna
cd /srv/scratch/z5039045/GapSeq_Sponge_and_Coral_MAGs/Test_GapSeq
/srv/scratch/z5039045/Softwares/gapseq_test_cluster/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y APA_bin_6.fna


# /srv/scratch/z5039045/Softwares/gapseq/gapseq find -p all -t Archaea -b 100 -c 70 -l all -y ./STY_Merged_OTU08.fasta

#√   -p keywords such as pathways or subsystems (for example amino,nucl,cofactor,carbo,polyamine)
#   -e Search by ec numbers (comma separated)
#   -r Search by enzyme name (colon separated)
#   -d Database: vmh or seed (default: seed)
#√   -t Taxonomic range for sequences to be downloaded (default: Bacteria)
#√   -b Bit score cutoff for local alignment (default: 200)
#   -i Identity cutoff for local alignment (default: 0)
#√   -c Coverage cutoff for local alignment (default: 75)
#   -s Strict candidate reaction handling (do _not_ use pathway completeness, key kenzymes and operon structure to infere if imcomplete pathway could be still present (default: false)
#   -u Suffix used for output files (default: pathway keyword)
#   -a blast hits back against uniprot enzyme database
#   -n Consider superpathways of metacyc database
#√   -l Select the pathway database (MetaCyc(2712), KEGG(523), SEED(666), all(3922); default: metacyc,custom)
#   -o Only list pathways found for keyword; default false)
#   -x Do not blast only list pathways, reactions and check for available sequences; default false
#   -q Include sequences of hits in log files; default false
#   -v Verbose level, 0 for nothing, 1 for pathway infos, 2 for full (default 1)
#   -k Do not use parallel
#   -g Exhaustive search, continue blast even when cutoff is reached (default false)
#   -z Quality of sequences for homology search: 1:only reviewed (swissprot), 2:unreviewed only if reviewed not available, 3:reviewed+unreviewed, 4:only unreviewed (default 2)
#   -m Limit pathways to taxonomic range (default )

# New:
# /srv/scratch/z5039045/Softwares/gapseq/gapseq find-transport -b 100 -c 70 ./STY_Merged_OTU08.fasta

#√   -b bit score cutoff for local alignment (default: 50)
#   -i identity cutoff for local alignment (default: 0)
#√   -c coverage cutoff for local alignment (default: 75)
#   -q Include sequences of hits in log files; default false
#   -k do not use parallel
#   -m only check for this keyword/metabolite (default )

# # # -b neg
# New:
# /srv/scratch/z5039045/Softwares/gapseq/gapseq draft -r ./STY_Merged_OTU08-all-Reactions.tbl -t ./STY_Merged_OTU08-Transporter.tbl -p ./STY_Merged_OTU08-all-Pathways.tbl -c ./STY_Merged_OTU08.fasta -u 100 -l 50 -b arc
# a few reactions should be added/modified to created draft model!!!

#√     -r|--blast.res          Blast-results table generated by gapseq.sh.
#√     -t|--transporter.res    Blast-results table generated by transporter.sh.
#√     -b|--biomass            Gram "pos" OR "neg" OR "archae" OR "auto"? Default: "auto". Please note: if set to "auto", the external programms barrnap, usearch, and bedtools are required.
#     -n|--model.name         Name of draft model network. Default: the basename of "blast.res"
#     -c|--genome.seq         If gram is set to "auto", the genome sequence is required to search for 16S genes, which are used to predict gram-staining.
#√     -u|--high.evi.rxn.BS    Reactions with an associated blast-hit with a bitscore above this value will be added to the draft model as core reactions (i.e. high-sequence-evidence reactions)
#√     -l|--min.bs.for.core    Reactions with an associated blast-hit with a bitscore below this value will be considered just as reactions that have no blast hit.
#     -o|--output.dir         Directory to store results. Default: "." (alternatives not yet implemented)
#     -s|--sbml.output        Should the gapfilled model be saved as sbml? Default: FALSE (export not yet implemented)
#     -p|--pathway.pred       Pathway-results table generated by gapseq.sh.
#√     -a|--curve.alpha        Exponent coefficient for transformation of bitscores to reaction weights for gapfilling. (Default: 1 (neg-linear))


# /srv/scratch/z5039045/Softwares/gapseq/gapseq fill -m ./STY_Merged_OTU08_draft_SCM1_model_Li_2018.RDS -n /srv/scratch/z5095298/software/gapseq/Diets_Sponges_July_2019/2020-04-02_photo_Jo/Minimal_diet_GapSeq_GCMSmodify/medium_photo_20200402_Jo.csv -c ./STY_Merged_OTU08-rxnWeights.RDS -g ./STY_Merged_OTU08-rxnXgenes.RDS -b 50 -o ./20220623_diet_Jo_photo_test__STY_Merged_OTU08_draft_SCM1_model_Li_2018 -r TRUE
# New:
# 1. sub2pwy.csv add 4 compounds: Oxidized-ferredoxins, Reduced-ferredoxins, Oxidized-Plastocyanins and Plastocyanin-Reduced
# 2. diet with single carbon source to seawater?

#√     -m|--model                  GapSeq-Draft-Model to be gapfilled (RDS or SBML)
#     -h|--help                   help
#√     -n|--media                  tab- or komma separated table for media components. Requires three named columns: 1 - "compounds" (for metab. IDs), 2 - "name" (metab. name), 3 - "maxFlux" (maximum inflow flux)
#     -f|--full.model             RDS file of the full (dummy) model. (ask Silvio for it :) ). Defaut: dat/full.model.RDS
#     -t|--target.metabolite      ID (without compartment suffix) of metabolite that shall be produced. Default: cpd11416 (Biomass)
#√     -c|--rxn.weights.file       Reaction weights table generated by gapseq function "generate_GSdraft.R" (RDS format).
#√     -g|--rxnXgene.table         Table with gene-X-reaction associations as generated by the "generate_GSdraft.R" (RDS format)
#√     -b|--bcore                  Minimum bitscore for reaction associated blast hits to consider reactions as core/candidate reactions. Default: 50
#√     -o|--output.dir             Directory to store results. Default: "gapfill".
#     -s|--sbml.output            Should the gapfilled model be saved as sbml? Default: FALSE
#     -q|--quick.gf               perform only step 1 and 2. Default: FALSE
#     -l|--limit                  Test metabolite to which search is limitted
#     -x|--no.core                Use always all reactions insteadof core reactions with have sequence evidence. Default: FALSE
#     -v|--verbose                Verbose output and printing of debug messages. Default: FALSE
#√     -r|--relaxed.constraints    Save final model as unconstraint network (i.e. all exchange reactions are open). Default: FALSE


# test with customized pathways
cd /srv/scratch/z5039045/gapseq_test
/srv/scratch/z5039045/Softwares/gapseq_test/gapseq find -p all -b 100 -c 70 -l all -y -n APA_bin_6.fna

/srv/scratch/z5039045/Softwares/gapseq/gapseq find-transport -h

