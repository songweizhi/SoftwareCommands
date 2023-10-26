
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
MetaCHIP BP -p NorthSea -r p -t 12 -tmp
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

cd /Users/songweizhi/Desktop/MetaCHIP_demo
export PATH=/Users/songweizhi/Softwares/FastTree/bin
MetaCHIP PI -i NS_37bins -taxon NorthSea_GTDB.tsv -p NorthSea -r p -x fasta -t 4


##################################### MetaCHIP debug #####################################

# NS_18bins
MetaCHIP PI -i NS_18bins/ -taxon NorthSea_GTDB.tsv -p NorthSea18bins -r pcofg -x fasta -t 12
MetaCHIP BP -p NorthSea18bins -r pcofg -t 12 -tmp

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
