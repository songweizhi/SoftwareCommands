
############################# install PhyloBayes MPI on hpc3 #############################

# https://bioconda.github.io/recipes/phylobayes-mpi/README.html
conda create --name phylobayes_mpi phylobayes-mpi


# conda activate /home/ocessongwz/anaconda3/envs/mybase
# conda install bioconda::phylobayes-mpi


################################### run PhyloBayes MPI ###################################

########## Nina Dombrowski's Undinarchaeota paper ##########

# parameters used by Nina Dombrowski's Undinarchaeota paper: -cat -gtr -x 10 -1 -dgam 4

# In particular, for each marker protein family, 
# four parallel chains were run until convergence was reached, unless stated otherwise (maxdiff < 0.3; settings: bpcomp -x 25%_burnin chain1 chain2 chain3 chain4). 
# Additionally, we checked for the minimum effective size using tracecomp (minimum effective size > 50; settings: -x 25%_burnin chain1 chain2 chain3 chain4).


########## The evolutionary origin of host association in the Rickettsiales ##########

# The tree was inferred using PhyloBayes (CAT+LG+Γ4, 20,000 generations with a burn-in of 5,000 generations)

# These were used for phylogenetic reconstruction under the CAT+GTR+Γ4 (untreated) and CAT+LG+Γ4 (iterative χ2-trimmed) models with PhyloBayes MPI v1.8

# Four independent Markov chain Monte Carlo (MCMC) chains were run until convergence was 
# reached (maxdiff <0.3) or a sufficient effective sample size was reached (effsize >300), 
# while using a burn-in of at least 5,000 generations. 

# The iterative χ2-trimmer was found to be more efficient at reducing compositional heterogeneity compared with the standard χ2-trim method25,28,113


##########################################################################################

# This one works on hpc3 !!!

#!/bin/bash
#SBATCH -t 71:59:59
#SBATCH -N 1 -n 10
#SBATCH -J pb_c85_t25_p0_BMGE
#SBATCH -A oces
#SBATCH -p cpu

cd $SLURM_SUBMIT_DIR

source ~/.bashrc
conda activate phylobayes_mpi
export OMPI_MCA_btl=^openib; mpirun -np 10 pb_mpi -d top25.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s OMA_marker_cov85_top25_pruner0_BMGE_pb


##########################################################################################




conda activate phylobayes_mpi
export OMPI_MCA_btl=^openib
mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker1_pruner0_BMGE_pb
mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker2_pruner0_BMGE_pb
mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker3_pruner0_BMGE_pb
mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker4_pruner0_BMGE_pb
mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker5_pruner0_BMGE_pb


conda activate mybase
BioSAK hpc3 -q cpu -a oces -conda mybase -t 12 -n m1_pb -c "export OMPI_MCA_btl=^openib; mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker1_pruner0_BMGE_pb" 
BioSAK hpc3 -q cpu -a oces -conda mybase -t 12 -n m2_pb -c "export OMPI_MCA_btl=^openib; mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker2_pruner0_BMGE_pb" 
BioSAK hpc3 -q cpu -a oces -conda mybase -t 12 -n m3_pb -c "export OMPI_MCA_btl=^openib; mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker3_pruner0_BMGE_pb" 
BioSAK hpc3 -q cpu -a oces -conda mybase -t 12 -n m4_pb -c "export OMPI_MCA_btl=^openib; mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker4_pruner0_BMGE_pb" 
BioSAK hpc3 -q cpu -a oces -conda mybase -t 12 -n m5_pb -c "export OMPI_MCA_btl=^openib; mpirun -np 12 pb_mpi -d marker_pa85_pruner0.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s Marker5_pruner0_BMGE_pb" 



conda activate mybase
cd /scratch/PI/ocessongwz/Sponge_2023_12_01/7_OMA_wd/OMA_wd/Output/OMA_op_min176/SplitScore2_op_dir/top25_tree_dir/test_pb

BioSAK hpc3 -q cpu -a oces -conda mybase -t 10 -wt 71:59:59 -n pb_c85_t25_p0_BMGE -c "export OMPI_MCA_btl=^openib; mpirun -np 10 pb_mpi -d top25.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s OMA_marker_cov85_top25_pruner0_BMGE_pb"




BioSAK hpc3 -q cpu -a oces -conda mybase -t 10 -wt 71:59:59 -n pb_c85_t25_p0_BMGE -c "mpirun -np 10 pb_mpi -d top25.BMGE.phylip -cat -gtr -x 10 1100 -1 -dgam 4 -s OMA_marker_cov85_top25_pruner0_BMGE_pb"







conda activate phylobayes_mpi
cd /scratch/PI/ocessongwz/Sponge_2023_12_01/7_OMA_wd/OMA_wd/Output/OMA_op_min176/SplitScore2_op_dir/top25_tree_dir/test_pb
mpirun -np 10 pb_mpi -d top25.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s OMA_marker_cov85_top25_pruner0_BMGE_pb


conda activate phylobayes_mpi
cd /scratch/PI/ocessongwz/Sponge_2023_12_01/7_OMA_wd/OMA_wd/Output/OMA_op_min176/SplitScore2_op_dir/top25_tree_dir/test_pb
BioSAK hpc3 -q cpu -a oces -conda phylobayes_mpi -t 10 -wt 71:59:59 -n pb_c85_t25_p0_BMGE -c "export OMPI_MCA_btl=^openib; mpirun -np 12 pb_mpi -d top25.BMGE.phylip -cat -gtr -x 10 -1 -dgam 4 -s OMA_marker_cov85_top25_pruner0_BMGE_pb"











