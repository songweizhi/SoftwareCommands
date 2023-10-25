
# intall the dependencies through Conda
conda create -n phasebook python=3.7
conda activate phasebook
conda install -c bioconda whatshap=0.18 minimap2=2.18 longshot=0.4.1 samtools=1.12 bcftools=1.12 racon=1.4.20 fpa=0.5
# UnsatisfiableError: The following specifications were found to be incompatible with each other:
# Output in format: Requested package -> Available versions


# pull down the code and compile the code:
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/phasebook/phasebook.git
cd /srv/scratch/z5039045/Softwares/phasebook
sh install.sh








