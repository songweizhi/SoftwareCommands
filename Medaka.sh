
################## install Medaka on Katana with Conda (not working!!!) ##################

# install SemiBin on Katana with Conda
conda create -n Medaka_env
conda activate Medaka_env
conda install -c conda-forge -c bioconda medaka

# install SemiBin on Katana with Conda
conda create -n Medaka_env -c conda-forge -c bioconda medaka


################ install Medaka on Katana with Python3 virtual environment ###############

module load python/3.7.3
source ~/mypython3env/bin/activate
pip install --upgrade pip
pip install --upgrade grpcio
pip install --upgrade h5py
pip install --upgrade pandas
pip install --upgrade importlib-metadata
pip install medaka

##################################### model selection ####################################

# examples
# r941_min_fast_g303		MinION (or GridION) R9.4.1 flowcells using the fast Guppy basecaller version 3.0.3. 
# r941_prom_hac_g303 		PromethION data and the high accuracy basecaller (termed "hac" in Guppy configuration files)

# maybe just use the default?
XXX_min_fast_g615

# GridION X5 Mk1 (GXB03456) Final report
# Basecalling		Fast model
# Guppy				6.1.5

####################################### run medaka #######################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load samtools/1.15
module load minimap2/2.22

cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving
medaka_consensus -i ../rd123_no_decision_and_stop_receiving.fastq -d assembly.fasta -o medaka_wd -t 12



module load python/3.7.3
source ~/mypython3env/bin/activate
module load samtools/1.15
module load minimap2/2.22
cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd123_flye_wd_no_decision_stop_receiving/00_reassemble_wd/bin.3_reads_min5000_dir/flye_reassemble_wd_bin.3
medaka_haploid_variant -i ../bin.3_reads_min5000bp.fastq -r assembly.fasta -o bin.3_medaka_haploid_variant_wd -t 12













