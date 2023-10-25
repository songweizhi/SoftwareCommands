
################################## install for yourself ##################################

# download OrthoFinder from https://github.com/davidemms/OrthoFinder/releases/tag/2.5.2

module load python/3.7.3
source ~/mypython3env/bin/activate
cd /srv/scratch/z5039045/Softwares
tar xzf OrthoFinder_source.tar.gz
python3 OrthoFinder_source/orthofinder.py -h

cd /srv/scratch/z5039045/Softwares/OrthoFinder_source/test
python3 /srv/scratch/z5039045/Softwares/OrthoFinder_source/orthofinder.py -f /srv/scratch/z5039045/Softwares/OrthoFinder_source/ExampleData

cd /srv/scratch/z5039045/Kelp_coassembly/test
python3 /srv/scratch/z5039045/Softwares/OrthoFinder_source/orthofinder.py -f /srv/scratch/z5039045/Kelp_coassembly/test/orthofinder_in -t 12 -a 1


################################# load the one on Katana #################################

module load python/3.7.3
module load orthofinder/2.5.4 
orthofinder -h 

#################################### run orthofinder #####################################

# Run full OrthoFinder analysis on FASTA format proteomes in <dir>
orthofinder [options] -f <dir>

# Add new species in <dir1> to previous run in <dir2> and run new analysis
orthofinder [options] -f <dir1> -b <dir2>




