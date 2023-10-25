
#################################### install Autometa ####################################

# download autometa
module load git/2.7.1
cd /srv/scratch/z5039045/Softwares
git clone https://bitbucket.org/jason_c_kwan/autometa


# download db files 
cd /srv/scratch/z5039045/DB
wget ftp://ftp.ncbi.nih.gov/pub/taxonomy/accession2taxid/prot.accession2taxid.gz
wget ftp://ftp.ncbi.nih.gov/pub/taxonomy/accession2taxid/prot.accession2taxid.gz.md5
wget ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump.tar.gz
wget ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump.tar.gz.md5
wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nr.gz
wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nr.gz.md5


# decompress db files
tar -xzvf taxdump.tar.gz
gunzip prot.accession2taxid.gz


# make diamond db
diamond makedb --in nr.gz --db nr -p 12


# install python module tqdm, joblib and cython
module unload intel/11.1.080 
module add intel/17.0.4.196
module load python/2.7.15
module load openblas/0.2.8
cd ~
mkdir mypythonenv_autometa
virtualenv --system-site-packages mypythonenv_autometa
. mypythonenv_autometa/bin/activate
pip install tqdm
pip install joblib
pip install cython

# install python module tsne
cd ~
curl -LOk https://files.pythonhosted.org/packages/cc/57/87d99c7c3da6e25dc7a34b7d305cf5a4f5850b78edd2a5e12de2254a1155/tsne-0.1.8.tar.gz
tar xf tsne-0.1.8.tar.gz
# !!! replace file setup.py (within folder ~/tsne-0.1.8) with the attached one, then run: 
sed -i -e "s/dist in/dist not in/" -e "s/lcblas/lmkl_rt/" tsne-0.1.8/
pip install tsne-0.1.8/


###################################### run Autometa ######################################

module unload intel/11.1.080 
module add intel/17.0.4.196
module load python/2.7.15
module load prodigal/2.6.3
module load hmmer/3.1b2
module load diamond/0.9.10  
module load bowtie/2.3.2  
module load samtools/1.7
module load bedtools/2.27.1
module load openblas/0.2.8
cd /srv/scratch/z5039045/Softwares/autometa/pipeline
export PATH=/srv/scratch/z5039045/Softwares/autometa/pipeline:$PATH
cd ~
. mypythonenv_autometa/bin/activate


# run on its test dataset
cd /srv/scratch/z5039045/Softwares/autometa/test_data_one_step
run_autometa.py --assembly scaffolds.fasta --processors 12 --length_cutoff 3000 --maketaxtable --ML_recruitment
cluster_process.py --bin_table ML_recruitment_output.tab --column ML_expanded_clustering --fasta scaffolds.fasta --do_taxonomy --db_dir /srv/scratch/z5039045/DB --output_dir cluster_process_output


# to visualize the results
module load R/3.4.2
Rscript path/to/Autometa_VisBin.R -in ML_recruitment_output.tab
# It will produce the three plot at the bottom of the website
# ML_recruitment_output_BH_tSNE_Cluster_bin.png
# ML_recruitment_output_BH_tSNE_Phylum.png
# ML_recruitment_output_GC_Coverage.png






# get completeness
module load python/3.5.2
module load perl/5.20.1
module load blast+/2.6.0
module load R/3.4.2

cd /srv/scratch/z5039045/Autometa_test/D6
python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -1 cluster_process_output -pbs -qsub
python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -1 MetaBAT2 -pbs -qsub
python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -1 MyCC -pbs -qsub
python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -1 D6_outputs_0bp/Refined_bins -pbs -qsub


cd /srv/scratch/z5039045/Autometa_test/D6
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 AutoMeta -2 MyCC -3 MetaBAT2 -ms 0
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 AutoMeta -2 MyCC -3 MetaBAT2 -ms 0


python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 AutoMeta -2 MetaBAT2 -3 MyCC -r D6_outputs_0bp/Refined_bins -ms 0


python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner_v2/Binning_refiner.py -1 AutoMeta -2 MyCC -3 MetaBAT2 -x3 fa -ms 0 -prefix D6

python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner_v2/Binning_refiner.py -1 AutoMeta -2 MetaBAT2 -3 MyCC -x2 fa -ms 0 -prefix D6
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner_v2/Binning_refiner.py -1 AutoMeta -2 MetaBAT2 -3 MyCC -x2 fa -ms 20480 -prefix D6_20480bp
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner_v2/Binning_refiner.py -1 AutoMeta -2 MetaBAT2 -3 MyCC -x2 fa -ms 102400 -prefix D6_100Kbp




module load R/3.4.2
Rscript /srv/scratch/z5039045/Softwares/autometa/Autometa_VisBin.R -i ML_recruitment_output.tab

  so it point to the directory containing the data downloaded 

