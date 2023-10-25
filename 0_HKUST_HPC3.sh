
##########################################################################################
####################################### HKUST HPC3 #######################################
##########################################################################################

ssh ocessongwz@hpc3.ust.hk -o "ServerAliveInterval 10"


# JOB SCHEDULING SYSTEM (SLURM)
# https://itsc.hkust.edu.hk/services/academic-teaching-support/high-performance-computing/hpc3-cluster/jobs


# To check what queues (partitions) are available:	
sinfo

# To submit job:	
sbatch <your_job_script>

# To view the queue status:	
squeue

# To view the queue status of your job:	
squeue -u $USER

# To cancel a running or pending job:	
scancel <your_slurm_jobid>

# To view detailed information of your job:	
scontrol show job <your_slurm_jobid>




