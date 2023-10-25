#################################### log into katana #####################################

# Log into katana using Putty
katana.restech.unsw.edu.au
z5189525
Pass

# Start an interactive job
qsub -I -l nodes=1:ppn=12,mem=120gb,walltime=11:59:00

#Filezilla
kdm.restech.unsw.edu.au
/srv/scratch/z5189525

# Move to scratch
cd /srv/scratch/z5189525

#################################### Run Abricate #####################################

module load blast+/2.11.0 
module load perl/5.28.0
module load abricate/1.0.0

# create a db folder on your scratch,
mkdir /srv/scratch/z5039045/my_abricate_db

# download db files from https://github.com/tseemann/abricate/tree/master/db
# and upload them to above db folder
# here shows the structure of my_abricate_db:
/srv/scratch/z5039045/my_abricate_db/argannot/sequences
/srv/scratch/z5039045/my_abricate_db/abricate/sequences
/srv/scratch/z5039045/my_abricate_db/argannot/sequences
/srv/scratch/z5039045/my_abricate_db/card/sequences
/srv/scratch/z5039045/my_abricate_db/ecoh/sequences
/srv/scratch/z5039045/my_abricate_db/ecoli_vf/sequences
/srv/scratch/z5039045/my_abricate_db/megares/sequences
/srv/scratch/z5039045/my_abricate_db/ncbi/sequences
/srv/scratch/z5039045/my_abricate_db/plasmidfinder/sequences
/srv/scratch/z5039045/my_abricate_db/resfinder/sequences
/srv/scratch/z5039045/my_abricate_db/vfdb/sequences

# index db
cd /srv/scratch/z5039045/my_abricate_db
abricate --datadir /srv/scratch/z5039045/my_abricate_db --setupdb

# run abricate with your own db
cd /srv/scratch/z5039045/MetaCHIP/Demo
abricate --datadir /srv/scratch/z5039045/my_abricate_db --db ncbi --quiet NorthSea_bin014.fasta > NorthSea_bin014_ncbi.tab 
abricate --datadir /srv/scratch/z5039045/my_abricate_db --db resfinder --quiet NorthSea_bin014.fasta > NorthSea_bin014_resfinder.tab 


