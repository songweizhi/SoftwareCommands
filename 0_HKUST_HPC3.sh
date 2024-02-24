
##########################################################################################
####################################### HKUST HPC3 #######################################
##########################################################################################

ssh ocessongwz@hpc3.ust.hk -o "ServerAliveInterval 10"


# JOB SCHEDULING SYSTEM (SLURM)
# https://itsc.hkust.edu.hk/services/academic-teaching-support/high-performance-computing/hpc3-cluster/jobs

sbatch metachip.sh			# To submit a job
scancel 1044191				# To cancel a running or pending job
scontrol show job 1044191	# To view job details
squeue -u ocessongwz		# To view the queue status
sinfo						# To check what queues (partitions) are available
squeue -A boqianpy			# To view the queue status
squeue -A oces				# To view the queue status


##########################################################################################
################################## some customisations ###################################
##########################################################################################

ln -s /scratch/PI/ocessongwz /home/ocessongwz/scratch

ln -s /scratch/PI/boqianpy /home/ocessongwz/boqianpy
ln -s /scratch/PI/boqianpy /scratch/PI/ocessongwz/boqianpy

ln -s /scratch/PI/boqianpy/App /home/ocessongwz/App
ln -s /scratch/PI/boqianpy/App /scratch/PI/ocessongwz/App

ln -s /scratch/PI/boqianpy/weizhi /home/ocessongwz/qscratch
ln -s /scratch/PI/boqianpy/weizhi /scratch/PI/ocessongwz/qscratch


##########################################################################################
################################## Storage of HKUST HPC3 #################################
##########################################################################################

# The HPC3 provides 3 kinds of storage for different purposes.
# 1. Home directory for individual (100GB quota with backup for disaster recovery)
# 2. Scratch directory (For non-contributors: 1TB group-based quota. For contributors: quota depends on PI's purchase quantity. Highest performance using BeeGFS with no backup)
# 3. Archive directory (For contributors only: quota depends on PI's purchase quantity. Used as second copy of data with no backup)


##########################################################################################
########################### Example job script for HKUST HPC3 ############################
##########################################################################################

#!/bin/bash
#SBATCH --mail-user=ocessongwz@ust.hk 	# update your email address
#SBATCH --mail-type=begin				# get email notification when job begins
#SBATCH --mail-type=end					# get email notification when job ends
#SBATCH -J MetaCHIP2_test1 				# job name
#SBATCH -t 12:00:00 					# Maximum runtime of 12 hours
#SBATCH -N 1 -n 12						# Use 1 node and 12 cores
#SBATCH -p cpu-share           			# Choose partition (queue) to use. e.g., cpu-share,  gpu-share, himem-share

module load anaconda3
source activate mypython3env
cd /home/ocessongwz/MetaCHIP_wd
MetaCHIP2 detect -h


##########################################################################################
########################### Example job script for HKUST HPC3 ############################
##########################################################################################

#!/bin/bash
#SBATCH -J MetaCHIP2_test1 				# job name
#SBATCH -t 48:00:00 					# Maximum runtime of 48 hours
#SBATCH --mail-user=ocessongwz@ust.hk 	# update your email address
#SBATCH --mail-type=begin				# get email notification when job begins
#SBATCH --mail-type=end					# get email notification when job ends
#SBATCH -p cpu-share           			# Choose partition (queue) to use. e.g., cpu-share,  gpu-share, himem-share
#SBATCH -N 1 -n 3 						# Use 1 node and 3 cores 

cd /home/ocessongwz/MetaCHIP_wd

# Execute applications in parallel 
srun -n 1 myapp1 &    # Assign 1 core to run application "myapp1" 
srun -n 1 myapp2 &    # Similarly, assign 1 core to run application "myapp2" 
srun -n 1 myapp3 
wait


##########################################################################################
##########################################################################################
##########################################################################################
