
#################################### install MetaCHIP ####################################

module load python/3.7.3
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
. mypython3env/bin/activate
pip install --upgrade MetaCHIP


# on Mac
export PATH=/Users/songweizhi/Softwares/Prodigal:$PATH
export PATH=/Users/songweizhi/Softwares/FastTree/bin:$PATH
export PATH=/Users/songweizhi/Softwares/ncbi-blast-2.10.1+/bin:$PATH
export PATH=/Users/songweizhi/Softwares/hmmer/hmmer-3.1b2-macosx-intel/binaries:$PATH


###################################### run MetaCHIP ######################################

#!/bin/bash
#PBS -l nodes=1:ppn=12
#PBS -l mem=60gb
#PBS -l walltime=11:59:00
#PBS -j oe
#PBS -M weizhi.song@student.unsw.edu.au
#PBS -m ae

module unload python
module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.2.1
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.5.3
module load blast+/2.9.0
module load prodigal/2.6.3

cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r pcofg -x fasta -t 12
MetaCHIP BP -p NorthSea -r pcofg -t 12


cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_30bins -taxon NorthSea_GTDB.tsv -p NorthSea -r pcofg -x fasta -t 12
MetaCHIP BP -p NorthSea -r pcofg -t 12



cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r p -x fasta -t 12 -grouping_only -tmp
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r c -x fasta -t 12 -grouping_only -tmp
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r o -x fasta -t 12 -grouping_only -tmp
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r f -x fasta -t 12 -grouping_only -tmp
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r g -x fasta -t 12 -grouping_only -tmp
MetaCHIP BP -p NorthSea -r p -t 12 -tmp
MetaCHIP BP -p NorthSea -r c -t 12 -tmp
MetaCHIP BP -p NorthSea -r o -t 12 -tmp
MetaCHIP BP -p NorthSea -r f -t 12 -tmp
MetaCHIP BP -p NorthSea -r g -t 12 -tmp
MetaCHIP CMLP -p NorthSea -r pcofg


# run MetaCHIP with customized grouping file
cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -p CG -g customized_grouping.txt -t 6 -i NS_37bins -x fasta -blastn_js_header blastn_js_header.sh -qsub
MetaCHIP BP -p CG -g customized_grouping.txt -t 6


cd /srv/scratch/z5095298/Weizhi_Song
rm -r NorthSea_MetaCHIP_wd
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r pcofg -x fasta -t 6 -blastn_js_header blastn_js_header.sh -qsub 


cd /srv/scratch/z5039045/MetaCHIP_Cho
MetaCHIP PI -i bins -taxon group.txt -p Cho -r c -x fna -t 6 -blastn_js_header blastn_js_header.sh 


cd /srv/scratch/z5039045/MetaCHIP_demo


cd /Users/songweizhi/Desktop/MetaCHIP_demo
export PATH=/Users/songweizhi/Softwares/FastTree/bin
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r p -x fasta -t 4



#################################### rewrite MetaCHIP ####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load hmmer/3.2.1
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.5.3
module load blast+/2.9.0
module load prodigal/2.6.3
cd /srv/scratch/z5039045/MetaCHIP_demo
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea37bins -r pcofgs -x fasta -t 12 -force
MetaCHIP BP -p NorthSea37bins -r pcofgs -t 12

# test
MetaCHIP PI -i NS_37bins_test -taxon NorthSea_GTDB_test.tsv -p NorthSea37bins_test -r pcofgs -x fasta -t 12 -force
MetaCHIP BP -p NorthSea37bins_test -r pcofgs -t 12


##################################### MetaCHIP debug #####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module unload hmmer
module load hmmer/3.3
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.6.1
module load blast+/2.9.0
module load prodigal/2.6.3

cd /srv/scratch/z5039045/MetaCHIP_debug
MetaCHIP PI -p dataset -r p -t 16 -i genomes_fasta -x fasta -taxon gtdbk_taxonomy.tsv -force

MetaCHIP BP -p dataset -r p -t 16



cd /srv/scratch/z5039045/MetaCHIP_demo/NorthSea18bins_MetaCHIP_wd/NorthSea18bins_pcofg_blastdb/000
makeblastdb -in NorthSea18bins_pcofg_combined_ffn.fasta -dbtype nucl -parse_seqids -logfile /dev/null


cd /srv/scratch/z5039045/MetaCHIP_debug/dataset_MetaCHIP_wd/dataset_p_blastdb
makeblastdb -in dataset_p_combined_ffn.fasta -dbtype nucl -parse_seqids

 -logfile /dev/null


#MetaCHIP PI -i NS_18bins -taxon NorthSea_GTDB.tsv -p NorthSea18bins -r pcofg -x fasta -t 12
MetaCHIP PI -i NS_18bins -taxon NorthSea_GTDB.tsv -p NorthSea18bins -r pcofg -x fasta -t 12
MetaCHIP PI -i 000 -taxon NorthSea_GTDB.tsv -p NorthSea18bins -r pcofg -x fasta -t 12

cd /srv/scratch/z5039045/MetaCHIP/Demo2
MetaCHIP PI -i NS_18bins -x fasta -taxon NorthSea_GTDB.tsv -p Demo2 -r pcofg  -t 12
MetaCHIP BP -p Demo2 -r pcofg -t 12

##################################### MetaCHIP debug #####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module unload hmmer
module load hmmer/3.3
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.6.1
module load blast+/2.9.0
module load prodigal/2.6.3
cd /srv/scratch/z5039045/MetaCHIP/Liang_Shen
MetaCHIP PI -p Halorubrum -r s -t 12 -i Halorubrum_genome -x fna -taxon gnm_taxon.txt -force
MetaCHIP BP -p Halorubrum -r s -t 12




##################################### MetaCHIP debug #####################################

# NS_18bins
MetaCHIP PI -i NS_18bins/ -taxon NorthSea_GTDB.tsv -p NorthSea18bins -r pcofg -x fasta -t 12
MetaCHIP BP -p NorthSea18bins -r pcofg -t 12 -tmp


# Laurene
module load python/3.7.3
source ~/mypython3env/bin/activate
module unload hmmer
module load hmmer/3.3
module load mafft/7.407
module load fasttree/2.1.10
module load R/3.6.1
module load blast+/2.9.0
module load prodigal/2.6.3


# debug_1
cd /srv/scratch/z5039045/MetaCHIP/debug_1
MetaCHIP PI -p o_metachip -r c -t 12 -i bin_folder -x fa -taxon classifications.tsv
MetaCHIP BP -p o_metachip -r c -t 12


# debug_2
cd /srv/scratch/z5039045/MetaCHIP/debug_2
MetaCHIP PI -p debug2 -r c -t 12 -i genomes -x fasta -taxon MAGs_GTDB.tsv
MetaCHIP BP -p debug2 -r c -t 12


cd /srv/scratch/z5039045/MetaCHIP/debug_2
MetaCHIP PI -p debug2cof -r cof -t 12 -i genomes -x fasta -taxon MAGs_GTDB.tsv
MetaCHIP BP -p debug2cof -r cof -t 12





module load python/3.7.3
source ~/mypython3env/bin/activate
module unload hmmer
module load hmmer/3.3
module load mafft/7.490
module load fasttree/2.1.11
module load R/3.6.1
module load blast+/2.11.0
module load prodigal/2.6.3
cd /srv/scratch/z5039045/MetaCHIP/debug_2
MetaCHIP PI -p debug4 -r c -t 12 -i genomes -x fasta -taxon MAGs_GTDB.tsv
MetaCHIP BP -p debug4 -r c -t 12















