
# load module
module load python/2.7.9
sh /srv/scratch/z5039045/Softwares/FASTQSim-master/FASTQcharacterize.sh
sh /srv/scratch/z5039045/Softwares/FASTQSim-master/FASTQspike.sh

  
# FASTQcharacterize.sh can be run using an externally generated alignment file (BAM or SAM format) to perform characterization 
sh FASTQcharacterize.sh -input Example5.fq -reference homo_sapien.gdna -sam Example5.sam 


    












