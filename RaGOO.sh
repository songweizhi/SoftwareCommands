
qsub -I -l nodes=1:ppn=12,mem=90gb,walltime=05:59:00


module load python/3.7.4
module load minimap2/2.17
module load ragoo/1.11

# basic usage
cd /srv/scratch/z5039045/ragoo_test
ragoo.py SPAdes_ctgs.fa reference_genome.fa -t 12

# help info 
ragoo.py -h
