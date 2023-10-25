
#################################### install Inspector ###################################

cd /srv/scratch/z5039045/Softwares
git clone https://github.com/ChongLab/Inspector.git
cd Inspector
pip install statsmodels


###################################### run Inspector #####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load samtools/1.9
module load minimap2/2.16
module load flye/2.9

cd /srv/scratch/z5039045/Adaptive_Nanopore/combined_rd12_flye_wd/assembly_min2500_Inspector_wd
/srv/scratch/z5039045/Softwares/Inspector/inspector.py -c assembly.fasta -r trimmed50bp.fastq -o assembly_Inspector_wd --datatype nanopore
