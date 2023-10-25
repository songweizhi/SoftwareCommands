
########################### install and prepare database files ###########################

# install phyloFlash
cd /srv/scratch/z5039045/Softwares
wget https://github.com/HRGV/phyloFlash/archive/pf3.4.tar.gz
tar -xzf pf3.4.tar.gz


# check env 
module load perl/5.28.0
module load bowtie/1.2.0
module load mafft/7.407
module load spades/3.14.0
module load java/8u201-jdk
module load bbmap/38.51
module load vsearch/2.13.3
module load bedtools/2.27.1
cd /srv/scratch/z5039045/Softwares/phyloFlash-pf3.4
export PATH=/srv/scratch/z5039045/Softwares/phyloFlash-pf3.4:$PATH
phyloFlash.pl -check_env


# build db
module load perl/5.28.0
module load bowtie/1.2.0
module load mafft/7.407
module load spades/3.14.0
module load java/8u201-jdk
module load bbmap/38.51
module load vsearch/2.13.3
module load bedtools/2.27.1
export PATH=/srv/scratch/z5039045/Softwares/phyloFlash-pf3.4:$PATH
phyloFlash_makedb.pl --remote

# provide db with 
export PHYLOFLASH_DBHOME=/srv/scratch/z5039045/Softwares/phyloFlash-pf3.4/138.1
# or 
-dbhome /srv/scratch/z5039045/Softwares/phyloFlash-pf3.4/138.1


##################################### test phyloFlash ####################################

module load perl/5.28.0
module load bowtie/1.2.0
module load mafft/7.407
module load spades/3.14.0
module load java/8u201-jdk
module load bbmap/38.51
module load vsearch/2.13.3
module load bedtools/2.27.1
export PHYLOFLASH_DBHOME=/srv/scratch/z5039045/Softwares/phyloFlash-pf3.4/138.1
export PATH=/srv/scratch/z5039045/Softwares/phyloFlash-pf3.4:$PATH

cd /srv/scratch/z5039045/Softwares/phyloFlash-pf3.4/test_files/test_wd
phyloFlash.pl -lib TEST -CPUs 12 -almosteverything -read1 test_F.fq.gz -read2 test_R.fq.gz
phyloFlash.pl -lib TEST_fa -CPUs 12 -almosteverything -read1 test_F.fa -read2 test_R.fa


##################################### run phyloFlash #####################################













