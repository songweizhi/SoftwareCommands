
conda activate mybase
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

