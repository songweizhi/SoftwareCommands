
##################################### upload to PyPI #####################################

alias twine='/Users/songweizhi/Library/Python/3.7/bin/twine'
cd /Users/songweizhi/PycharmProjects/MarkerMAG
rm -r build
rm -r dist
rm -r MarkerMAG.egg-info
python setup.py sdist bdist_wheel
twine upload dist/*
songweizhi

shan88


################################## upload to test.PyPI ###################################

cd /Users/songweizhi/PycharmProjects/MarkerMAG
rm -r build
rm -r dist
rm -r MarkerMAG.egg-info
python setup.py sdist bdist_wheel
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
songweizhi

shan88

# install/upgrade BioSAK
pip3 install --upgrade -i https://test.pypi.org/simple/ MarkerMAG
MarkerMAG -h


#################################### install MarkerMAG ###################################

module load python/3.6.5
mkdir ~/mypython365env
python3 -m venv --system-site-packages ~/mypython365env
source ~/mypython365env/bin/activate

pip3 install --upgrade MarkerMAG
pip3 install --upgrade -i https://test.pypi.org/simple/ MarkerMAG


###################################### run MarkerMAG #####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load R/4.0.2
module load perl/5.28.0
module load blast+/2.11.0
module load bowtie/2.3.5.1
module load samtools/1.10
module load spades/3.14.0
module load gcc/8.4.0
module load boost/1.73.0-gcc8   
module load mira/v5rc2
module load java/8u201-jdk
module load bbmap/38.51
module load seqtk/20190219
module load mafft/7.407
module load hmmer/3.3
module load bedtools/2.27.1
module load barrnap/0.9
module load usearch/11.0.667
cd /srv/scratch/z5039045/MarkerMAG_demo

# -tmp -force -test_mode -spades
#MarkerMAG link -p MBARC26_1 -r1 MBARC26_R1.fasta -r2 MBARC26_R2.fasta -marker 16S.fasta -mag MAGs -x fna -t 12 -sorted_sam16s MBARC26_input_reads_to_16S_sorted.sam
#MarkerMAG link -p MBARC26_2 -r1 MBARC26_R1.fasta -r2 MBARC26_R2.fasta -marker 16S.fasta -mag MAGs -x fna -t 12 
MarkerMAG link -p MBARC26_2 -r1 MBARC26_R1_subset.fasta -r2 MBARC26_R2_subset.fasta -marker 16S.fasta -mag MAGs -x fna -t 12 
MarkerMAG link -p Demo -r1 demo_R1.fasta -r2 demo_R2.fasta -marker 16S_demo.fasta -mag MAGs_demo -x fna -t 12 
MarkerMAG link -p SR -r1 SR_R1.fasta -r2 SR_R2.fasta -marker 16S_demo.fasta -mag MAGs_demo -x fna -t 12 
MarkerMAG link -p Demo -r1 demo_R1.fasta -r2 demo_R2.fasta -marker demo_16S.fasta -mag demo_MAGs -x fa -t 12 




cd /srv/scratch/z5039045/get_copy_number_files/51
# MarkerMAG link -p S51 -r1 51_R1.fasta -r2 51_R2.fasta -marker 51_16S.fa -mag 51_MAGs -x fasta -t 12 
MarkerMAG get_cp_num -p S51_get_cp_num -linkages 51_linkages_by_genome.txt -r1 51_R1.fasta -r2 51_R2.fasta -marker 51_16S.fa -mag 51_MAGs -x fasta -t 12 


head -2000000 MBARC26_R1.fasta > MBARC26_R1_subset.fasta 
head -2000000 MBARC26_R2.fasta > MBARC26_R2_subset.fasta 


##################################### get copy number ####################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load R/4.0.2
module load perl/5.28.0
module load blast+/2.11.0
module load bowtie/2.3.5.1
module load samtools/1.10
module load spades/3.14.0
module load gcc/8.4.0
module load boost/1.73.0-gcc8
module load mira/v5rc2
module load java/8u201-jdk
module load seqtk/20190219
module load mafft/7.407
module load perl/5.28.0
module load hmmer/3.3
module load bedtools/2.27.1
module load barrnap/0.9
module load usearch/11.0.667
module load bbmap/38.51
cd /srv/scratch/z5039045/get_copy_number_files/2R4
MarkerMAG get_cp_num -p 2R4_TEST -r1 2R4_R1.fasta -r2 2R4_R2.fasta -linkages 2R4_linkages_by_genome.txt -marker 2R4_16S_joined.fa -mag 2R4_MAGs -x fasta -t 12 -force


###################################### demo dataset ######################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load R/4.0.2
module load perl/5.28.0
module load blast+/2.11.0
module load bowtie/2.3.5.1
module load samtools/1.10
module load spades/3.14.0
module load gcc/8.4.0
module load boost/1.73.0-gcc8
module load mira/v5rc2
module load java/8u201-jdk
module load seqtk/20190219
module load mafft/7.407
module load perl/5.28.0
module load hmmer/3.3
module load bedtools/2.27.1
module load barrnap/0.9
module load usearch/11.0.667
module load bbmap/38.51
cd /srv/scratch/z5039045/MarkerMAG_demo
MarkerMAG link -p Demo2 -r1 demo_R1.fasta -r2 demo_R2.fasta -marker demo_16S.fasta -mag demo_MAGs -x fa -t 12


###################################### demo dataset ######################################


module load python/3.7.3
source ~/mypython3env/bin/activate
module load perl/5.28.0
module load hmmer/3.2.1
module load bedtools/2.27.1
module load barrnap/0.9

cd /srv/scratch/z5039045/MarkerMAG_demo
MarkerMAG barrnap_16s -g demo_MAGs -x fa -t 6 -force
MarkerMAG barrnap_16s -g demo_MAGs/Nitrosopumilus_bin.11.fa -t 6 -force

