# Working_directory
cd /srv/scratch/z5039045/PacBio/quiver_polish/

# load modules:
module add samtools
module add python/2.7.10 
module add smrt-analysis/2.3.0

# index assemblies:
samtools faidx combined_10.fasta&

# get input files (fofn)
ls /srv/scratch/z3452659/ThomasPacBio-Nov15/data/2015-11-23.PacBioRaw/*/*/*.subreads.fasta > subreads.fofn
ls /srv/scratch/z3452659/ThomasPacBio-Nov15/data/2015-11-23.PacBioRaw/*/*/*.h5 > h5.fofn

# run pbalign
#input files: h5.fofn, subreads.fofn and combined_10.fasta
#output files: combined_10.cmp.h5
mkdir /srv/scratch/z5039045/PacBio/quiver_polish/temp
/share/apps/smrt-analysis/2.3.0/analysis/bin/pbalign --forQuiver --nproc 16 --tmpDir /srv/scratch/z5039045/PacBio/quiver_polish/temp --pulseFile /srv/scratch/z5039045/PacBio/quiver_polish/h5.fofn /srv/scratch/z5039045/PacBio/quiver_polish/subreads.fofn /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.fasta /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.cmp.h5

# run quiver to polish assemblies (combined_10.fasta), with combined_10.cmp.h5 and combined_10.fasta as input:
#input files: combined_10.cmp.h5 and combined_10.fasta 
#output files: combined_10.variants.gff, combined_10.consensus.fasta and combined_10.consensus.fastq
/share/apps/smrt-analysis/2.3.0/analysis/bin/quiver /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.cmp.h5 -p P6-C4 -j 8 -r /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.fasta -o /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.variants.gff -o /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.fasta -o /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.fastq

# get bam:
/share/apps/smrt-analysis/2.3.0/analysis/bin/blasr /srv/scratch/z5039045/PacBio/quiver_polish/subreads.fofn /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.fasta -sam -out /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.sam -unaligned /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.unaligned.fas -nproc 16 -placeRepeatsRandomly
samtools view -bo /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.bam -S /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.sam&
samtools sort -@ 6 -f /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.bam /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.sorted.bam&
samtools index -b /srv/scratch/z5039045/PacBio/quiver_polish/combined_10.consensus.sorted.bam&


###################################### run quiver for 210 genome ######################################

# load modules:
module load samtools
module load python/2.7.9
module load smrt-analysis/2.3.0

mkdir /srv/scratch/z5039045/PacBio/2018-03-12_quiver_210
cd /srv/scratch/z5039045/PacBio/2018-03-12_quiver_210/

# get assemblies
cp /srv/scratch/z5039045/PacBio/2018-03-09_canu_placeRepeatsRandomly/210/210_default/210_canu_placeRepeatsRandomly.contigs.fasta .

# get subreads.fofn
ls /srv/scratch/z5039045/PacBio/2018-03-09_canu_placeRepeatsRandomly/210/210_default/

# get h5.fofn
ls /srv/scratch/z3452659/ThomasPacBio-Nov15/data/2015-11-23.PacBioRaw/*/*/*.h5 > h5.fofn

# run pbalign
mkdir pbalign_temp
/share/apps/smrt-analysis/2.3.0/analysis/bin/pbalign --forQuiver --nproc 12 --tmpDir pbalign_temp --pulseFile h5.fofn subreads.fofn 210_canu_placeRepeatsRandomly.contigs.fasta 210_canu_placeRepeatsRandomly.contigs.fasta.cmp.h5 &


###################################### run Circlator #####################################

# load module
pyvenv mypython3env
. mypython3env/bin/activate
module load bwa/0.7.15
module load prodigal/2.6.3
module load samtools/1.3.1
module load mummer/3.23
module load spades/3.7.0
module purge
module add perl/5.20.1
module add java/8u151
module add canu/1.7
export _JAVA_OPTIONS=-Xmx2g

circlator -h


# circlator needs corrected reads
https://github.com/sanger-pathogens/circlator/wiki/Brief-instructions





pyvenv mypythonenv
. mypythonenv/bin/activate

deactivate






