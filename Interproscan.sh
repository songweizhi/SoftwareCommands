
################################## Install InterProScan ##################################

# install the core InterProScan software
cd /srv/scratch/z5039045/Softwares/interproscan
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.39-77.0/interproscan-5.39-77.0-64-bit.tar.gz
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.39-77.0/interproscan-5.39-77.0-64-bit.tar.gz.md5
tar -pxvzf interproscan-5.39-77.0-*-bit.tar.gz


# Install Panther Data
cd /srv/scratch/z5039045/Softwares/interproscan/interproscan-5.39-77.0/data
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-14.1.tar.gz
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-14.1.tar.gz.md5
tar -pxvzf panther-data-14.1.tar.gz

# Works on desktop Linux, but java error on Katana !!!
module load perl/5.28.0 
module load java/8u201-jre
/srv/scratch/z5039045/Softwares/interproscan/interproscan-5.39-77.0/interproscan.sh -h


#################################### run InterProScan ####################################

module purge
module load openjdk/15.0.1
module load interproscan/5.44-79.0

cd /srv/scratch/z5039045/P67b_genome
# interproscan.sh -i P67b.faa -d P67b_interproscan_wd -f tsv -T P67b_interproscan_wd_tmp
# interproscan.sh -i P67b.faa -f tsv -T P67b_interproscan_wd_tmp
















cd /srv/scratch/z5039045/get_homologues_test
interproscan.sh -i P67b.faa -f tsv -T P67b_interproscan_wd_tmp

#####

module unload java
module unload interproscan
module load java/8u201-jre
module load perl/5.28.0 
module load interproscan/5.35-74.0

#####

module unload java

module load java/7u51      
module load java/8u121     
module load java/8u201-jdk 
module load java/8u201-jre 
module load java/8u231-jre 
module load java/8u45

module load openjdk/15.0.1 
module load openjdk/14.0.1 
module load openjdk/11.0.2

module purge
module unload java
module unload interproscan
module load java/8u231-jre
module load perl/5.28.0
module load openjdk/15.0.1
module load interproscan/5.35-74.0


module purge

module load java/8u201-jre
module load interproscan/5.35-74.0



module load perl/5.28.0 
module unload java
module load java/8u201-jre
module unload openjdk
module load openjdk/11.0.2
module load interproscan/5.44-79.0





module purge
module load openjdk/15.0.1 
module load interproscan/5.44-79.0
interproscan.sh -i ANE_00001.fasta -f tsv -T ANE_00001_interproscan_wd_tmp



























 1012  module load interproscan/5.44-79.0
 1013  module load openjdk/15.0.1
 1014  module load interproscan/5.44-79.0
 1015  module load openjdk/14.0.1
 1016  module unload openjdk/15.0.1
 1017  module load openjdk/15.0.1
 1018  module unload openjdk/15.0.1
 1019  module load openjdk/14.0.1
 1020  module unload openjdk
 1021  module load openjdk/11.0.2
 1022  pwd
 1023  cd /srv/scratch/z5039045/GTDB_SSU_test
 1024  /srv/scratch/z5039045/GTDB_SSU_test
 1025  cd 
 1026  source scratch.sh 
 1027  module avail
 1028  module load interproscan/5.44-79.0
 1029  interproscan
 1030  module unload java
 1031  module unload interproscan
 1032  module load java/8u201-jre
 1033  module load perl/5.28.0 
 1034  module load interproscan/5.35-74.0
 1035  module lost
 1036  module list
 1037  module avail
 1038  module purge
 1039  module load interproscan/5.44-79.0
 1040  module load openjdk/15.0.1
 1041  module load interproscan/5.44-79.0
