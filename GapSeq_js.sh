#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=60gb
#PBS -l walltime=30:59:00
#PBS -M weizhi.song@unsw.edu.au
#PBS -m ae
 
module add R/3.6.1
module load perl/5.28.0
module load git/2.22.0
module load bedtools/2.27.1
module load blast+/2.9.0
module load hmmer/3.3
module load glpk/4.65
module load barrnap/0.9
module load gcc/7.3.0
module load exonerate/2.2.0
module load parallel/20190522
module load cplex/12.9.0-academic  

cd /srv/scratch/z5039045/gapseq_test
# /srv/scratch/z5039045/Softwares/gapseq/gapseq find -p all -t Archaea -b 100 -c 70 -l all -y ./STY_Merged_OTU08.fasta
/srv/scratch/z5039045/Softwares/gapseq/gapseq find -p carbo -b 100 -c 70 -l all -y genome_folder/APA_bin_6.fna

# Options:
#√   -p keywords such as pathways or subsystems (for example amino,nucl,cofactor,carbo,polyamine)
#   -e Search by ec numbers (comma separated)
#   -r Search by enzyme name (colon separated)
#   -d Database: vmh or seed (default: seed)
#√   -t Taxonomic range for sequences to be downloaded (default: Bacteria)
#√   -b Bit score cutoff for local alignment (default: 200)
#   -i Identity cutoff for local alignment (default: 0)
#√   -c Coverage cutoff for local alignment (default: 75)
#   -s Strict candidate reaction handling (do _not_ use pathway completeness, key kenzymes and operon structure to infere if imcomplete pathway could be still present (default: false)
#   -u Suffix used for output files (default: pathway keyword)
#   -a blast hits back against uniprot enzyme database
#   -n Consider superpathways of metacyc database
#√   -l Select the pathway database (MetaCyc(2712), KEGG(523), SEED(666), all(3922); default: metacyc,custom)
#   -o Only list pathways found for keyword; default false)
#   -x Do not blast only list pathways, reactions and check for available sequences; default false
#   -q Include sequences of hits in log files; default false
#   -v Verbose level, 0 for nothing, 1 for pathway infos, 2 for full (default 1)
#   -k Do not use parallel
#   -g Exhaustive search, continue blast even when cutoff is reached (default false)
#   -z Quality of sequences for homology search: 1:only reviewed (swissprot), 2:unreviewed only if reviewed not available, 3:reviewed+unreviewed, 4:only unreviewed (default 2)
#   -m Limit pathways to taxonomic range (default )
