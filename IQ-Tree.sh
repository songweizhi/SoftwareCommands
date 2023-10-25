
/Users/songweizhi/Software/iqtree/1.6.12/bin/iqtree2 -h
/Users/songweizhi/Software/iqtree/2.1.3/bin/iqtree2 -h
/Users/songweizhi/Software/iqtree/iqtree-2.2.0-MacOSX/bin/iqtree2 -h

######################################### on MAC #########################################

which iqtree2
/Users/songweizhi/Software/iqtree/iqtree-2.2.0-MacOSX/bin/iqtree2
iqtree2 -h

cd /Users/songweizhi/Desktop/Sponges/2_MAGs_tree
iqtree2 -m MFP -T 8 --prefix bacterial_MAG -s gtdbtk.bac120.user_msa.BMGE.fasta 

iqtree2 --wbtl --bnni -st AA -m LG+C60+F -T 10 -B 1000 -alrt 1000 -s example.phy -pre example_iqtree

####################################### on Katana ########################################

/srv/scratch/z5039045/Softwares/iqtree-2.2.0-Linux/bin/iqtree2
/srv/scratch/z5039045/Softwares/iqtree-2.1.2-Linux/bin/iqtree2

cd /srv/scratch/z5039045/Sponge_holobionts/Sponge_symbiont_MAG/Sponge_MAGs_1171_80_5_GTDB_r202_tree/align
/srv/scratch/z5039045/Softwares/iqtree-2.2.0-Linux/bin/iqtree2 -m MFP -T 8 --prefix bacterial_MAG -s gtdbtk.bac120.user_msa.BMGE.fasta 


################################## infer_tree_cmds_BuXu ##################################

# Xu Bu
module load muscle/3.8.31
module load trimal/1.4.1
muscle -in protein_file.faa -out protein_file.aln
trimal -in protein_file.aln -out protein_file_trimmed.phy -gappyout -keepheader -phylip
iqtree -s protein_file_trimmed.phy -pre protein_file_iqtree -st AA -m LG+C60+F -nt 112 -bb 1000 -alrt 1000

# Anja Spang (-m LG + G -bb 1000 -wbtl -bnni)
# --wbtl               Like --boot-trees but also writing branch lengths
# --bnni               Optimize UFBoot trees by NNI on bootstrap alignment
# --boot-trees         Write bootstrap trees to .ufboot file (default: none)
/srv/scratch/z5039045/Softwares/iqtree-2.2.0-Linux/bin/iqtree2 --wbtl --bnni -st AA -m LG+C60+F -T 12 -B 1000 -alrt 1000 -s ../OG339_trimmed.phy -pre OG339_iqtree


cd /srv/scratch/z5039045/Sponge_hologenome/2_Archaeal_tree_50_5/Nitrosopumilaceae_OMA_wd/Output/OrthologousGroupsFasta_cov_85_no_empty_line_aln_trimmed
/srv/scratch/z5039045/Softwares/iqtree-2.2.0-Linux/bin/iqtree2 -s OG10208_trimmed.phy -pre OG10208_iqtree -st AA -m LG+C60+F -T 12 -B 1000 -alrt 1000

# Anja: LG+C60+F+R


########################################### FAQ ##########################################

### what is the difference between .contree and .treefile? which one should I choose? when i draw ml tree.
# If you do an ML-search including ultrafast-bootstrapping, than both files are created. 
# The treefile contains the best tree found by ML with the UFboot support values added. 
# The contree-file contains the consensus tree constructed from all UFboot trees (with the respective UFboot support values). 


cd /Users/songweizhi/Desktop/iqtree2_test
iqtree2 -s subset1.phy -pre subset1
iqtree2 -s subset2.phy -pre subset2
 




# PMSF
# Our extensive simulations and empirical phylogenomic data analyses demonstrate that the PMSF models can effectively ameliorate long branch attraction artefacts.
# To use the PMSF model you have to provide a guide tree, which, for example, can be obtained by a quicker analysis under the simpler LG+F+G model. 
# The guide tree can then be specified via -ft option, for example:
iqtree -s <alignment> -m LG+C20+F+G -ft <guide_tree>































