cd /Users/weizhisong/Desktop/angst_wd

python /Users/weizhisong/Softwares/angst/angst_lib/AnGST.py /Users/weizhisong/Desktop/angst_wd/example/AnGST.input






# commands for Gblocks
/Users/songweizhi/Softwares/Gblocks_0.91b/Gblocks 1.fasta -t=d -b3=24 -b4=6 -b5=a
/Users/weizhisong/Softwares/Gblocks_0.91b/Gblocks 1.fasta-gb.fasta -t=d -b3=24 -b4=6 -b5=a








# commands for Muscle
module load muscle/3.8.31 
cd /srv/scratch/z5039045/Explicit_Tree/test
muscle -phyi -in 1.seq -out 1.phy 
muscle -in 1.seq -out 1.fasta



# commands for PhyML
module load phyml/20120412
phyml -a 1.0 -b 100 -o tl -i 1.phy 
phyml -a 1.0 -b 100 -o tl -i 1.phy 






#for each seq
# load modules
module load muscle/3.8.31
module load phyml/20120412
module load biopython/1.65
# run mucsle to pre-align
muscle -in 1.seq -out 1_aln.fasta
# run Gblocks to excise poorly aligned regions
/srv/scratch/z5039045/gblocks/Gblocks_0.91b/Gblocks 1_aln.fasta -t=d -b3=24 -b4=6 -b5=a
# need a filter step
python /srv/scratch/z5039045/gblocks/alignment_filter.py 1_aln.fasta-gb 1_aln_gb_filted.fasta 
# run muscle again to get input file for PhyML
muscle -phyi -in 1_aln_gb_filted.fasta -out 1_aln_gb_filted_aln.phy
# run PhyML
phyml -a 1.0 -b 100 -o tl -i 1_aln_gb_filted_aln.phy



 
 
 
 