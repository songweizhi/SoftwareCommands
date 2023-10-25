module load python/3.7.3
module load perl/5.28.0
module load quast/5.0.2

quast.py assemblies.fas -o assemblies.fas.quast --threads 12 
quast.py MBARC26_R1_0.03.fasta -o MBARC26_R1_0.03.fasta.quast --threads 12



# quast
module load python/3.7.3
module load perl/5.28.0
module load quast/5.0.2

quast.py assemblies.fas -o assemblies.fas.quast --threads 12 
